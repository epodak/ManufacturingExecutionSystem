create database createvideo_v3;

use createvideo_v3;

drop table if exists file_categories; 

drop table if exists audio_libraries; 

drop table if exists image_libraries; 

drop table if exists theme_use_counter; 

drop table if exists videos; 

drop table if exists files;

drop table if exists file_channels;

drop table if exists file_types;

drop table if exists published_item;

drop table if exists stats;

drop table if exists stats_history;

/*Table structure for table categories */
create table file_categories (
  id int(3) not null auto_increment,  -- primary key
  type varchar(10) not null,      -- file type : value is one of image, audio and video 
  category varchar(24) not null,  -- category 
  thumbnail varchar(128) not null,  -- thumbnail 
  created_at timestamp default current_timestamp on update current_timestamp,  -- created date 
  primary key (id)
);


/*Table structure for table audio_libraries */
create table audio_libraries (
  id int(10) not null auto_increment,  -- primary key
  category_id int(3) default null,
  name varchar(128) default null,
  artist varchar(128) default null,
  album varchar(128) default null,
  time_length int(10) default 0,
  thumbnail varchar(128) default null,
  song varchar(128) default null,
  created_at timestamp default current_timestamp on update current_timestamp,
  primary key (id)
);

/* Table structure for table image_libraries */
create table image_libraries ( 
  id int(10) not null auto_increment, 
  category_id int(3) default null, 
  name varchar(128) default null, 
  image varchar(128) default null, 
  thumbnail varchar(128) default null, 
  created_at timestamp default current_timestamp on update current_timestamp, 
  primary key (id)  
);

/* Table structure for table theme_use_counter */ 
create table theme_use_counter ( 
  id varchar(4) not null,  
  platform varchar(32) not null, 
  theme_name varchar(128) not null, 
  theme_use int(20) not null default 0,
  primary key (id)
);

/* Table structure for table videos */
create table videos ( 
  id int(20) not null auto_increment,
  theme varchar(10) default null, 
  video_token varchar(128) default null,
  user_id int(11) default null,
  status varchar(10) default null,
  title varchar(128) default null,
  thumbnail varchar(128) default null,
  xml blob,
  created_at timestamp default current_timestamp on update current_timestamp,
  updated_at timestamp default '0000-00-00 00:00:00',
  primary key (id)
);

/* Table structure for table files */
create table files (
  id int(20) not null auto_increment,  -- primary key
  user_id int(11) default null, 
  channel int(2),
  type varchar(10) default null, 
  token varchar(128) default null, 
  name varchar(128) default null, 
  path varchar(256) default null, 
  is_thumbnail int(1) default null, 
  created_at timestamp default current_timestamp on update current_timestamp, 
  primary key (id)
);

/*  Table structure for table file_channels */
create table file_channels(
	id int(2) not null auto_increment,
	name varchar(128) not null unique,
	created_at timestamp default current_timestamp on update current_timestamp,
	updated_at timestamp default '0000-00-00 00:00:00',
	primary key (id)
);

/* Table structure for file_type */
create table file_types(
	id int(2)  not null auto_increment,
	type varchar(128) not null unique,
	folder varchar(128),
	created_at timestamp default current_timestamp on update current_timestamp,
	updated_at timestamp default '0000-00-00 00:00:00',
	primary key (id)
);

/*Table structure for table published_item */
create table published_item (
  id int(16) not null auto_increment,
  pub_channel varchar(50) not null,
  pub_type varchar(50) not null,
  status varchar(50) not null,
  remote_id varchar(50) not null,
  remote_space_id varchar(50) not null,
  play_url varchar(512) default null,
  user_social_account_id int(16) not null,
  file_token varchar(50) default null,
  pub_file_name varchar(250) default null,
  description varchar(250) default null,
  category varchar(250) default null,
  keywords varchar(250) default null,
  tags varchar(50) default null,
  cb_url varchar(512) default null,
  created_at datetime default null,
  updated_at datetime default null,
  primary key (id)
);

/*Table structure for table stats */
create table stats (
  published_item_id int(16) not null DEFAULT '0',
  view_count int(16) not null,
  comment_count int(16) not null,
  like_count int(16) not null,
  dislike_count int(16) not null,
  created_at datetime default null,
  updated_at datetime default null,
  primary key (published_item_id)
);

/*Table structure for table stats_history */
create table stats_history (
  id int(16) not null auto_increment,
  published_item_id int(16) default null,
  view_count int(16) not null,
  comment_count int(16) not null,
  like_count int(16) not null,
  dislike_count int(16) not null,
  created_at datetime default null,
  updated_at datetime default null,
  primary key (id)
);



-- create index 
create index index_category_id on audio_libraries (category_id);  

create index index_category_id on image_libraries (category_id);

create index index_on_video_token on videos (video_token);

create index index_user_id on videos (user_id);

create index index_user_id on files (user_id);

create index index_token on files (token);

create index index_channel on files (channel);

