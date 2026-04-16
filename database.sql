create table Lessons (
  id  SERIAL PRIMARY KEY,
  name varchar(50),
  content varchar(50),
  video_url varchar(50),
  position int not null,
  created_at date,
  updated_at date,
  course_id varchar(100),
  deleted_at date
);

create table Courses (
  id  SERIAL PRIMARY KEY,
  name varchar(50),
  description varchar(50),
  created_at date,
  updated_at date,
  deleted_at date  
);

create table Modules (
  id  SERIAL PRIMARY KEY,
  name varchar(50),
  description varchar(50),
  created_at date,
  updated_at date,
  deleted_at date
);

create table Programs (
  id  SERIAL PRIMARY KEY,
  name varchar(50),
  price int,
  program_type varchar(50),
  created_at date,
  updated_at date
);
create table TeachingGroups (
  id  SERIAL PRIMARY KEY,
  group_slag varchar(100),
  created_at date,
  updated_at date
);

create table Users (
  id  SERIAL PRIMARY KEY,
  name varchar(100),
  email varchar(100),
  role varchar(50),
  password_hash varchar(10000),
  teaching_group_id varchar(100),
  created_at date,
  updated_at date,
  deleted_at date
);
ALTER TABLE Users
ADD FOREIGN KEY(teaching_group_id) REFERENCES TeachingGroups(Id);
