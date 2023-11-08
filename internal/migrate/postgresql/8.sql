CREATE TABLE IF NOT EXISTS categories (
  label_id SERIAL NOT NULL,
  category_id SERIAL NOT NULL,
  PRIMARY KEY (label_id,category_id)
);
