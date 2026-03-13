CREATE TABLE IF NOT EXISTS scene_followers (
  u_id INT NOT NULL REFERENCES users(u_id) ON DELETE CASCADE,
  scene_id INT NOT NULL REFERENCES scenes(scene_id) ON DELETE CASCADE,
  PRIMARY KEY (u_id, scene_id)
);