
import requests
from bs4 import BeautifulSoup
import musicbrainzngs  # using the api for musicbrainz.org
import json
import time
# import re

# Configuration
BILLBOARD_URL = "https://www.billboard.com/charts/artist-100/"
USER_AGENT = "BillboardScraper/1.0 ( contact@example.com )"
OUTPUT_FILE = "billboard_artists_data.json"
LIMIT = 50
# fethcing the info from top 50 most popular artist from bilboard.com


# Initialize MusicBrainz
musicbrainzngs.set_useragent("BillboardScraper", "1.0", "contact@example.com")
musicbrainzngs.set_rate_limit(limit_or_interval=1.0, new_requests=1)


def get_billboard_artists():
    print(f"Fetching Billboard Artist 100 from {BILLBOARD_URL}...")
    headers = {'User-Agent': USER_AGENT}
    try:
        response = requests.get(BILLBOARD_URL, headers=headers)
        response.raise_for_status()
    except Exception as e:
        print(f"Error fetching Billboard: {e}")
        return []

    soup = BeautifulSoup(response.text, 'html.parser')
    artists = []

    # Artist Name is the primary title (<h3>)
    rows = soup.select('.o-chart-results-list-row-container')
    if not rows:
        rows = soup.select('div.o-chart-results-list-row')

    print(f"Found {len(rows)} chart rows. Extracting artists...")

    for row in rows:
        title_tag = row.select_one('h3#title-of-a-story')
        if not title_tag:
            continue

        # getting name directly from <h3>
        raw_name = title_tag.get_text(strip=True)

        if raw_name and raw_name not in artists:
            artists.append(raw_name)

    return artists[:LIMIT]


def get_mb_artist_details(name):
    '''
    Enforce strict delay because of musicbrains.org rules and regulations
    https://musicbrainz.org/doc/MusicBrainz_API
    https://musicbrainz.org/doc/MusicBrainz_API/Rate_Limiting
    Key notes - require meaningfull User-Agent string
              - req. limit to no more than 1 per second
              - json output is supported and recommended
    '''
    time.sleep(1.2)

    print(f"Searching MusicBrainz for: {name}")
    try:
        result = musicbrainzngs.search_artists(artist=name, limit=1)
        if not result['artist-list']:
            print(f"No MusicBrainz match for {name}")
            return None

        artist_data = result['artist-list'][0]
        artist_id = artist_data['id']

        # Fetch detailed info
        time.sleep(1.2)
        details = musicbrainzngs.get_artist_by_id(
            artist_id, includes=['url-rels', 'tags', 'release-groups'])
        artist = details['artist']

        # Extract fields
        artist_type = artist.get('type', 'Unknown')

        # Hometown
        hometown = "Unknown"
        if 'begin-area' in artist:
            hometown = artist['begin-area'].get('name', 'Unknown')
        elif 'area' in artist:
            hometown = artist['area'].get('name', 'Unknown')

        description = artist.get('disambiguation', '')

        socials = {'spotify': None, 'instagram': None, 'apple_music': None}
        for link in artist.get('url-relation-list', []):
            target = link['target']
            if 'spotify.com' in target:
                socials['spotify'] = target
            elif 'instagram.com' in target:
                socials['instagram'] = target
            elif 'music.apple.com' in target or 'itunes.apple.com' in target:
                socials['apple_music'] = target

        genres = [tag['name'] for tag in artist.get('tag-list', [])]
        img_url = "https://placehold.co/400?text=" + requests.utils.quote(name)

        # Albums
        albums = []
        rgs = artist.get('release-group-list', [])
        album_rgs = [rg for rg in rgs if rg.get('type') == 'Album']

        count = 0
        # added 5 albums per artist limit so it doesn't take long
        for rg in album_rgs:
            if count >= 5:
                break

            title = rg['title']
            rg_id = rg['id']
            first_release_date = rg.get('first-release-date', 'Unknown')

            time.sleep(1.2)
            try:
                releases_data = musicbrainzngs.browse_releases(
                    release_group=rg_id, limit=1)

                duration_ms = 0
                track_count = 0
                lang = "Unknown"

                if releases_data['release-list']:
                    rel = releases_data['release-list'][0]
                    rel_id = rel['id']
                    lang = rel.get('text-representation', {}).get(
                        'language', 'Unknown')

                    time.sleep(1.2)
                    rel_details = musicbrainzngs.get_release_by_id(
                        rel_id, includes=['recordings'])
                    media_list = rel_details['release'].get('medium-list', [])

                    for media in media_list:
                        track_count += len(media.get('track-list', []))
                        for track in media.get('track-list', []):
                            rec = track.get('recording', {})
                            if 'length' in rec:
                                duration_ms += int(rec['length'])

                # Convert duration to seconds for clarity
                duration_sec = int(duration_ms / 1000)

                cover_url = (
                    "http://coverartarchive.org/release-group/"
                    + rg_id
                    + "/front"
                )

                albums.append({
                    'title': title,
                    'description': "Album",
                    'duration': duration_sec,  # Converted to Seconds
                    'track_count': track_count,
                    'release_date': first_release_date,
                    'primary_language': lang,
                    'genres': genres,
                    'cover_url': cover_url
                })
                count += 1

            except Exception as e:
                print(f"Skipping album {title}: {e}")
                continue

        return {
            'name': name,
            'type': artist_type,
            'hometown': hometown,
            'description': description,
            'primary_genres': genres,
            'social_media': socials,
            'profile_image_url': img_url,
            'albums': albums
        }

    except Exception as e:
        print(f"Error for {name}: {e}")
        return None


def main():
    names = get_billboard_artists()
    print(f"Collected {len(names)} artists: {names}")

    data = []
    # Process top 50
    for name in names:
        details = get_mb_artist_details(name)
        if details:
            data.append(details)
        else:
            # Fallback basic info
            data.append({
                'name': name,
                'type': 'Unknown',
                'hometown': 'Unknown',
                'description': '',
                'primary_genres': [],
                'social_media': {
                    'spotify': None, 'instagram': None, 'apple_music': None
                    },
                'profile_image_url': '',
                'albums': []
            })

        # Save incrementally
        with open(OUTPUT_FILE, 'w') as f:
            json.dump(data, f, indent=2)
        print(f"Saved {len(data)} artists so far.")

    print(f"Final data saved to {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
