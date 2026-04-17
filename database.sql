
CREATE TABLE courses (
  id            SERIAL PRIMARY KEY,
  name          VARCHAR(100) NOT NULL,
  description   VARCHAR(500),
  created_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  deleted_at    TIMESTAMP WITH TIME ZONE
);


CREATE TABLE lessons (
  id            SERIAL PRIMARY KEY,
  name          VARCHAR(100) NOT NULL,
  content       TEXT,
  video_url     VARCHAR(500),
  position      INT NOT NULL,
  created_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  deleted_at    TIMESTAMP WITH TIME ZONE
);


ALTER TABLE lessons
ADD COLUMN course_id INT
  REFERENCES courses(id)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;


CREATE TABLE modules (
  id            SERIAL PRIMARY KEY,
  name          VARCHAR(100) NOT NULL,
  description   VARCHAR(1000),
  created_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  deleted_at    TIMESTAMP WITH TIME ZONE
);


CREATE TABLE programs (
  id            SERIAL PRIMARY KEY,
  name          VARCHAR(100) NOT NULL,
  price         INT, 
  program_type  VARCHAR(50),
  created_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);


CREATE TABLE course_modules  (
  module_id     INT NOT NULL,
  course_id     INT NOT NULL
);


CREATE TABLE program_modules (
  program_id    INT NOT NULL,
  module_id     INT NOT NULL
);

-- Индекс для ускорения связей
CREATE INDEX idx_lessons_course_id ON lessons(course_id);
CREATE INDEX idx_module_courses_module_id ON course_modules(module_id);
CREATE INDEX idx_module_courses_course_id ON course_modules(course_id);
CREATE INDEX idx_program_modules_program_id ON program_modules(program_id);
CREATE INDEX idx_program_modules_module_id ON program_modules(module_id);
create table teaching_groups  (
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
  teaching_group_id int,
  created_at date,
  updated_at date,
  deleted_at date
);
ALTER TABLE Users
ADD FOREIGN KEY(teaching_group_id) REFERENCES teaching_groups(Id);

create table Enrollments (
  id SERIAL PRIMARY KEY,
  user_id int,
  program_id int,
  status varchar(30),
  created_at date,
  updated_at date
);

create table Payments (
  id SERIAL PRIMARY KEY,
  enrollment_id int,
  amount int,
  status varchar(30),
  created_at date,
  updated_at date,
  paid_at date
);

create table ProgramCompletions (
  id SERIAL PRIMARY KEY,
  user_id int,
  program_id int,
  status varchar(30),
  created_at date,
  updated_at date,
  started_at date,
  completed_at date
);

create table Certificates (
  id SERIAL PRIMARY KEY,
  user_id int,
  program_id int,
  url varchar(100),
  created_at date,
  updated_at date,
  issued_at date
);

create table Quizzes (
  id SERIAL PRIMARY KEY,
  lesson_id int,
  name varchar(100),
  content varchar(100),
  created_at date,
  updated_at date
);

create table Exercises (
  id SERIAL PRIMARY KEY,
  lesson_id int,
  name varchar(100),
  url varchar(100),
  created_at date,
  updated_at date
);

create table Discussions (
  id SERIAL PRIMARY KEY,
  lesson_id int,
  user_id int,
  text varchar(100),
  created_at date,
  updated_at date
);

create table Blogs (
  id SERIAL PRIMARY KEY,
  title varchar(100),
  text varchar(100),
  status varchar(100),
  created_at date,
  updated_at date
);
