create table Lessons (
  id  SERIAL PRIMARY KEY,
  lesson_name varchar(50),
  lesson_content varchar(50),
  link_on_video varchar(50),
  position int not null,
  create_data date,
  update_data date,
  link_on_course varchar(100),
  deleted boolean
);

create table Courses (
  id  SERIAL PRIMARY KEY,
  course_name varchar(50),
  course_description varchar(50),
  create_date date,
  update_date date
);

create table Modules (
  id  SERIAL PRIMARY KEY,
  modul_name varchar(50),
  modul_description varchar(50),
  create_date date,
  update_date date
);

create table Programs (
  id  SERIAL PRIMARY KEY,
  program_name varchar(50),
  program_cost int,
  program_type varchar(50),
  create_date date,
  update_date date
);
