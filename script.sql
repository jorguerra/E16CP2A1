create database pintagram;
\c pintagram;
create table users (
  id serial primary key,
  username varchar(45) unique
);
create table images(
  id serial primary key,
  name varchar(100) unique,
  user_id int references users(id)
);
create table likes(
  user_id int references users(id),
  image_id int references images(id),
  primary key(user_id,image_id)
);
create table tags(
  id serial primary key,
  tag varchar(90) unique
);
create table tag_image(
  image_id int references images(id),
  tag_id int references tags(id),
  primary key(image_id, tag_id)
);
insert into users values (1,'jorge'),(2,'pedro'), (3,'peter');
/** Checkpoint 2 */
insert into images (id,name, user_id) values
  (1,'jorge1', 1),
  (2,'jorge2', 1),
  (3,'pedro1', 2),
  (4,'pedro2', 2),
  (5,'peter1', 3),
  (6,'peter2', 3);
/** Checkpoint 3 */
insert into likes (image_id, user_id) values
  (1,1),(1,2),(1,3),
  (2,1),(2,2),(2,3),
  (3,1),(3,2),(3,3),
  (4,1),(4,2),(4,3),
  (5,1),(5,2),(5,3),
  (6,1),(6,2),(6,3);
/** Checkpoint 4 */
insert into tags (tag) values ('landscape'),('sports'),('science'),
  ('politics'),('people'),('history'),('movies'),('music');
/** Checkpoint 5 */
insert into tag_image (image_id, tag_id) values
  (1,1),(1,2),(1,3),
  (2,4),(2,5),(2,6),
  (3,7),(3,8),(3,1),
  (4,1),(4,2),(4,3),
  (5,4),(5,5),(5,6),
  (6,7),(6,8),(6,1);
/** Checkpoint 6 */
select images.name, count(likes.user_id) as qty_likes from likes
join images on images.id = likes.image_id
group by likes.image_id, images.name;
/** Checkpoint 7 */
select username, images.name as qty_likes from images
join users on users.id = images.user_id;
/** Checkpoint 8 */
select tag, count(tag_image.image_id) as qty_images from tag_image
join tags on tags.id = tag_image.tag_id
group by tags.id, tags.tag;
