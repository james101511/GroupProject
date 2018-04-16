create table user
(
	user_lastname varchar(255) , user_firstname varchar(255),user_email varchar(255),user_password varchar(255),
    PRIMARY KEY (user_email)
);
create table project_involve
(
	project_name varchar(255) , project_admin boolean,user_email varchar(255),
    FOREIGN KEY (user_email) REFERENCES user(user_email),
    FOREIGN KEY (project_name) REFERENCES project(project_name)
);
create table project
(
	project_name varchar(255) , project_progress boolean,
    PRIMARY KEY (project_name)

);
create table task
(
	task_name varchar(255) , project_name varchar(255),start_date varchar(255),end_date varchar(255)
);
create table task_involve
(
	user_email varchar(255) , task_name varchar(255),project_name varchar(255),progress varchar(255),percentage varchar(255)
    
);
select *from project_involve;
select *from user;
select *from project;
select *from task;
select *from task_involve;

