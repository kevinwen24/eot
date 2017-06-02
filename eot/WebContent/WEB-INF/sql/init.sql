
#create dept

INSERT INTO dept(dept.`name`, dept.establish_date) VALUES("软件学院", "2011-07-01");

INSERT INTO dept(dept.`name`, dept.establish_date) VALUES("计算机与通信学院", "1929-07-01");
INSERT INTO dept(dept.`name`, dept.establish_date) VALUES("材料学院", "1919-07-01");
INSERT INTO dept(dept.`name`, dept.establish_date) VALUES("生命科学与工程学院", "1919-07-01");

INSERT INTO dept(dept.`name`, dept.establish_date) VALUES("理学院", "1929-07-01");
INSERT INTO dept(dept.`name`, dept.establish_date) VALUES("土木工程学院", "1919-07-01");
INSERT INTO dept(dept.`name`, dept.establish_date) VALUES("设计艺术学院", "1919-07-01");


INSERT INTO dept(dept.`name`, dept.establish_date) VALUES("机电工程学院", "1929-07-01");
INSERT INTO dept(dept.`name`, dept.establish_date) VALUES("石油化工学院", "1919-07-01");
INSERT INTO dept(dept.`name`, dept.establish_date) VALUES("法学院", "1919-07-01");


#create major
INSERT INTO major(major.dept_no, major.`name`, major.establish_date) VALUES(1, "软件工程", "2011-07-01");

INSERT INTO major(major.dept_no, major.`name`, major.establish_date) VALUES(2, "计算机科学与技术", "1999-07-01");
INSERT INTO major(major.dept_no, major.`name`, major.establish_date) VALUES(2, "物联网", "1999-07-01");
INSERT INTO major(major.dept_no, major.`name`, major.establish_date) VALUES(2, "通信工程", "1999-07-01");

#create class
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(1, 1, "2013");
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(1, 2, "2013");
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(1, 3, "2013");

INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(2, 1, "2013");
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(2, 2, "2013");
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(2, 3, "2013");
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(2, 4, "2013");
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(2, 5, "2013");
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(2, 6, "2013");

INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(3, 1, "2013");
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(3, 2, "2013");
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(3, 3, "2013");

INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(4, 1, "2013");
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(4, 2, "2013");
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(4, 3, "2013");
INSERT INTO class(class.major_no, class.class_index, class.grade) VALUES(4, 4, "2013");

#create techer
INSERT INTO teacher(teacher.te_no, teacher.dept, teacher.rank) VALUES(10001, 1, "系主任");
INSERT INTO teacher(teacher.te_no, teacher.dept, teacher.rank) VALUES(10002, 2, "教师");
INSERT INTO teacher(teacher.te_no, teacher.dept, teacher.rank) VALUES(10003, 2, "教师");
INSERT INTO teacher(teacher.te_no, teacher.dept, teacher.rank) VALUES(10004, 2, "教师");
INSERT INTO teacher(teacher.teacher_no, teacher.dept_no, teacher.rank) VALUES(10005, 2, "教师");

INSERT INTO `user`(`user`.user_id, `user`.`name`, `user`.`password`, `user`.user_role, `user`.gender, `user`.create_date, `user`.last_login_date)
VALUES(10001, "张其文", "1234", 2, "男", "2000-07-01", "2000-07-01");
INSERT INTO `user`(`user`.user_id, `user`.`name`, `user`.`password`, `user`.user_role, `user`.gender, `user`.create_date, `user`.last_login_date)
VALUES(10002, "高伟军", "1234", 2, "男", "2000-07-01", "2000-07-01");
INSERT INTO `user`(`user`.user_id, `user`.`name`, `user`.`password`, `user`.user_role, `user`.gender, `user`.create_date, `user`.last_login_date)
VALUES(10003, "张聚礼", "1234", 2, "男", "2000-07-01", "2000-07-01");
INSERT INTO `user`(`user`.user_id, `user`.`name`, `user`.`password`, `user`.user_role, `user`.gender, `user`.create_date, `user`.last_login_date)
VALUES(10004, "柯明", "1234", 2, "女", "2000-07-01", "2000-07-01");

#create student
INSERT INTO student(student.sto_no,student.dept, student.major, student.class)
VALUES(13270132, 1, 1, 1);

INSERT INTO `user`(`user`.user_id, `user`.`name`, `user`.`password`, `user`.user_role, `user`.gender, `user`.create_date, `user`.last_login_date)
VALUES(13270132, "文震杰", "1234", 3, "男", "2013-07-01", "2013-07-01");

#create evaluation(Teacher Class)
INSERT INTO evaluation(evaluation.teacher_no, evaluation.course_no, evaluation.`year`, evaluation.term, evaluation.class_no, evaluation.create_time)
 VALUES(10004, 1, "2013", 0, 1, "2017-03-01 07:00:00");
INSERT INTO evaluation(evaluation.teacher_no, evaluation.course_no, evaluation.`year`, evaluation.term, evaluation.class_no, evaluation.create_time)
 VALUES(10004, 1, "2013", 0, 2, "2017-03-01 07:00:00");
INSERT INTO evaluation(evaluation.teacher_no, evaluation.course_no, evaluation.`year`, evaluation.term, evaluation.class_no, evaluation.create_time)
 VALUES(10004, 1, "2013", 0, 3, "2017-03-01 07:00:00");
INSERT INTO evaluation(evaluation.teacher_no, evaluation.course_no, evaluation.`year`, evaluation.term, evaluation.class_no, evaluation.create_time)
 VALUES(10002, 5, "2017", 0, 1, "2017-03-01 08:00:00");
INSERT INTO evaluation(evaluation.teacher_no, evaluation.course_no, evaluation.`year`, evaluation.term, evaluation.class_no, evaluation.create_time)
 VALUES(10002, 5, "2017", 0, 2, "2017-03-01 08:00:00");
INSERT INTO evaluation(evaluation.teacher_no, evaluation.course_no, evaluation.`year`, evaluation.term, evaluation.class_no, evaluation.create_time)
 VALUES(10002, 5, "2017", 0, 3, "2017-03-01 08:00:00");
INSERT INTO `user`(`user`.user_no, `user`.`name`, `user`.`password`, `user`.user_role, `user`.gender, `user`.create_date)
VALUES(10005, "李小鹏", "1234", 2, "男", "2000-07-01");
 
#create course
INSERT INTO course(course.course_name, course.course_score) VALUES("软件工程导论",4);
INSERT INTO course(course.course_name, course.course_score) VALUES("java程序设计",3);
INSERT INTO course(course.course_name, course.course_score) VALUES("C++程序设计",4);
INSERT INTO course(course.course_name, course.course_score) VALUES("计算机网络",5);

#cretae category
INSERT INTO category(category.`name`) VALUES("教学方法");
INSERT INTO category(category.`name`) VALUES("教学内容");
INSERT INTO category(category.`name`) VALUES("教学效果");
INSERT INTO category(category.`name`) VALUES("教学态度");

#creat item
INSERT into item(item.category_no, item.`name`) VALUES(1, "教学方法多样灵活，激发学生兴趣"); 
INSERT into item(item.category_no, item.`name`) VALUES(1, "鼓励学生思考，互动性好"); 
INSERT into item(item.category_no, item.`name`) VALUES(1, "鼓励学生创新"); 

INSERT into item(item.category_no, item.`name`) VALUES(2, "教学内容是否熟悉");
INSERT into item(item.category_no, item.`name`) VALUES(2, "是否突出重点"); 
INSERT into item(item.category_no, item.`name`) VALUES(2, "理论结合实际阐述"); 
INSERT into item(item.category_no, item.`name`) VALUES(2, "是否介绍本学科的前沿动态"); 

INSERT into item(item.category_no, item.`name`) VALUES(3, "通过本学期的学习，你是否熟悉运用所学内容");
INSERT into item(item.category_no, item.`name`) VALUES(3, "上课是否精彩，不感到乏味"); 
INSERT into item(item.category_no, item.`name`) VALUES(3, "上课节奏是否跟上"); 
INSERT into item(item.category_no, item.`name`) VALUES(3, "老师所讲知识，是否听懂"); 

INSERT into item(item.category_no, item.`name`) VALUES(4, "老师是否充分备课，熟悉课程内容");
INSERT into item(item.category_no, item.`name`) VALUES(4, "是否有缺课迟到情况"); 


	  create procedure createEvaluation()
      begin
      declare i int default 1;
      repeat
					INSERT INTO evaluation(evaluation.teacher_no, evaluation.course_no, evaluation.`year`, evaluation.term, evaluation.class_no, evaluation.create_time, evaluation.item_no)
					VALUES(10004, 1, "2013", 0, 1, "2017-03-01 07:00:00", i);
          set i=i+1;
          until i>=13
      end repeat;
      end;
