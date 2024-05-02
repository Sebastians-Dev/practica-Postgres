create table users (
	id serial primary key,
	first_name varchar(30),
	last_name varchar(30),
  	email varchar(40)
);

select * from likes;

insert into users (first_name, last_name, email) values
('sebastian','burbano','sebas@gmail.com'),
('nataly', 'riascos', 'naty@gmail.com'),
('juanse','burbano','juanse@gmail.com');

create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(100),
	text text
);

insert into posts (creator_id, title, text) values
(1,'lorem1','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin accumsan eget purus eu venenatis. Phasellus molestie faucibus arcu nec'),
(2,'lorem2','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin accumsan eget purus eu venenatis. Phasellus molestie faucibus arcu nec'),
(3,'lorem3','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin accumsan eget purus eu venenatis. Phasellus molestie faucibus arcu nec'),
(1,'lorem4','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin accumsan eget purus eu venenatis. Phasellus molestie faucibus arcu nec'),
(2,'lorem5','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin accumsan eget purus eu venenatis. Phasellus molestie faucibus arcu nec');

create table likes (
	id serial primary key,
	user_id int references users(id),
	posts_id int references posts(id)
);

insert into likes (user_id, posts_id) values
(1,1),
(2,3),
(3,2),
(1,2),
(3,1);

select * from users inner join posts
on posts.creator_id = users.id;

select * from posts inner join likes
on posts.id = likes.posts_id inner join users
on likes.user_id = users.id;