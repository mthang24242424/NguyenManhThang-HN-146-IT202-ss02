create database ss02_b2;
use ss02_b2;
create table Student(
	stu_id int primary key,
    stu_name varchar(40) not null
);
create table Subject(
	sub_id int primary key,
    sub_name varchar (30) not null,
    credit int check (credit > 0)
);
create table Enrollment (
	stu_id int,
    sub_id int,
    enroll_date date,
    primary key (stu_id, sub_id),
    foreign key (stu_id) references Student(stu_id),
    foreign key (sub_id) references Subject(sub_id)
);
create table Teacher (
	teacher_id int primary key,
	teacher_name varchar(50) not null,
	email varchar(100) unique
);

alter table Subject add teacher_id int;

alter table Subject 
add constraint fk_subject_teacher 
foreign key (teacher_id) references Teacher(teacher_id);


create table Score (
	stu_id int,
	sub_id int,
	process_score float check (process_score between 0 and 10),
	final_score float check (final_score between 0 and 10),
	primary key (stu_id, sub_id),
	foreign key (stu_id) references Student(stu_id),
	foreign key (sub_id) references Subject(sub_id)
);
