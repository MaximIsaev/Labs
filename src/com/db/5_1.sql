CREATE DATABASE IF NOT EXISTS lab_5_2016;
USE lab_5_2016;

##drop tables students_subject;
##drop tables students, sub;

CREATE TABLE IF NOT EXISTS students (
  z_number int(6) PRIMARY KEY,
  surname varchar(15) NOT NULL,
  firstname varchar(15) NOT NULL,
  secondname varchar(15) NOT NULL,
  numgroup int(2) NOT NULL,
  phone int(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 CREATE TABLE IF NOT EXISTS departments (
  d_number int(2) PRIMARY KEY,
  d_name varchar(50) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS sub (
  s_number int(2) PRIMARY KEY,
  sub varchar(30) NOT NULL,
  surname_teacher varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS students_subject (
  z_number int(6) NOT NULL,
  s_number int(2) NOT NULL,
  val int(1) NOT NULL,
  PRIMARY KEY (z_number,s_number),
  FOREIGN KEY (z_number) REFERENCES students (z_number),
  FOREIGN KEY (s_number) REFERENCES sub (s_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO students VALUES
(120040, "Иванов", "Борис", "Иванович", 11, 51550),
(120041, "Петров", "Андрей", "Петрович", 11, 51551),
(120042, "Сидоров", "Александр", "Сидорович", 11, 51552),
(120043, "Андреев", "Артём", "Андреевич", 12, 51553),
(120044, "Беляев", "Герасим", "Владимирович", 12, 51554),
(120045, "Рябова", "Ольга", "Генадьевна", 12, 51574),
(120046, "Котоусов", "Евгений", "Александрович", 12, NULL),
(120047, "Колосова", "Ольга", "Васильевна", 13, 51562),
(120048, "Мировая", "Елена", "Андреевна", 12, 51910),
(120049, "Миронов", "Андрей", "Александрович", 13, 51911),
(120050, "Смирнова", "Анастасия", "Григорьевна", 11, 51912),
(120051, "Граф", "Юрий", "Дмитриевич", 12, 51897),
(120052, "Прапорщиков", "Геннадий", "Гондурасович", 13, 51898),
(120053, "Рядовой", "Афанасий", "Гафарович", 13, 51899),
(120054, "Иванов", "Игорь", "Татеусович", 12, 51900),
(120055, "Майоров", "Татеус", "Самуилович", 12, 51901);

INSERT INTO departments VALUES
(1, "Кафедра правоведения и философии"),
(2, "Кафедра иностранных языков"),
(3, "Матем. логика и теория алгоритмов");

INSERT INTO sub VALUES
(1, "Логика", "Котикова"),
(2, "Английский", "Обломов"),
(3, "Правоведение", "Немченко"),
(4, "Правоведение", "Буденко"),
(5, "Французский", "Обломов");

INSERT INTO students_subject VALUES
(120040, 1, 4),(120040, 2, 3),(120040, 3, 5),
(120041, 1, 3),(120041, 2, 4),(120041, 3, 5),
(120042, 1, 4),(120042, 2, 3),(120042, 3, 4),
(120043, 1, 2),(120043, 2, 4),(120043, 3, 4),
(120044, 1, 3),(120044, 2, 2),(120044, 3, 5),
(120045, 1, 5),(120045, 2, 5),(120045, 3, 5),
(120046, 1, 3),(120046, 2, 3),(120046, 3, 3),(120046, 4, 4),
(120047, 1, 1),(120047, 2, 3),(120047, 3, 2),
(120048, 1, 5),(120048, 2, 5),(120048, 3, 2),
(120049, 1, 4),(120049, 2, 4),(120049, 3, 5),(120049, 4, 5),
(120050, 1, 5),(120050, 2, 5),(120050, 3, 4)				,(120050, 5, 5),
(120051, 1, 4),(120051, 2, 4),(120051, 3, 4),				(120051, 5, 5),
(120052, 1, 2),(120052, 2, 2)								,(120052, 5, 2),
(120053, 1, 2),(120053, 2, 3),(120053, 3, 4),
(120054, 1, 3),(120054, 2, 2),(120054, 3, 4),(120054, 4, 3),(120054, 5, 4);

/*insert into students_subject values 
(120035, 1, 5), (120035, 2, 5), (120035, 3, 5), (120035, 4, 5),
(120038, 1, 5), (120038, 1, 5), (120038, 1, 5), (120038, 1, 5);*/
##UPDATE students_subject SET val = 5 WHERE z_number = 120040 AND z_number = 120041;
##SELECT * FROM students_subject NATURAL JOIN students WHERE z_number = 120041;

/*lab_1*/
/*SELECT numgroup, COUNT(z_number) FROM students GROUP BY numgroup;
SELECT numgroup, COUNT(z_number) FROM students GROUP BY numgroup;
SELECT max(COUNT(z_number)), min(COUNT(z_number)), avg(COUNT(z_number)) 
	FROM ( SELECT COUNT(z_number) FROM students GROUP BY numgroup);*/

 
/*1.	Создайте представление для получения сведений о количестве студентов в каждой группе.*/

	CREATE OR REPLACE VIEW S1 as SELECT COUNT(z_number) as C1 FROM students GROUP BY numgroup;
	SELECT * FROM S1;

/*2.	Используя предыдущее представление, создайте представление, определяющее минимальное, 
	максимальное и среднее число студентов в группе.*/

##	select MAX(C1) FROM ((SELECT COUNT(z_number) as C1 FROM students GROUP BY numgroup) as t1);	

	CREATE OR REPLACE VIEW S2 as select MAX(C1) as MAX, MIN(C1) AS MIN, AVG(C1) AS AVG FROM S1;	
	SELECT * FROM S2;

/*3.	Создайте представление для получения максимального количества студентов в группе.*/

##	select MAX(C1) FROM ((SELECT COUNT(z_number) as C1 FROM students GROUP BY numgroup) as t1);	

	CREATE OR REPLACE VIEW S3 as SELECT MAX(C1) FROM S1;
    SELECT * FROM S3;

/*4.	Используя предыдущее представление, создайте представление, определяющее номер группы (номера групп) 
		максимальным количеством студентов (представление используется в подзапросе).*/
        
##	SELECT numgroup FROM students GROUP BY numgroup HAVING COUNT(z_number) = (SELECT * FROM S3);
	
	CREATE OR REPLACE  VIEW S4 as SELECT numgroup FROM students GROUP BY numgroup HAVING COUNT(z_number) = (SELECT * FROM S3);
	SELECT * FROM S4;
        
/*5.	Создайте представление для получения сведений по каждому студенту с локальным условием проверки 
		на номер зачетки (номер зачетки меньше заданного). Попытайтесь осуществить вставку в последнее представление 
		с нарушением и без нарушения ограничений.*/
	
##	SELECT * FROM students WHERE z_number < 120052;
	
	CREATE OR REPLACE  VIEW S5 as SELECT * FROM students WHERE z_number < 120052 WITH LOCAL CHECK OPTION;
	SELECT * FROM S5 ;
	INSERT INTO S5 VALUES (120035, "Представление", "Игорь", "Махмудович", 11, 51455);
	INSERT INTO S5 VALUES (120057, "Нарушитель", "Анотолий", "Гиенович", 11, 51456);
	DELETE FROM S5 WHERE z_number = 120035;
     
        
/*6.	Создайте представление для получения сведений по каждому студенту с каскадным условием проверки 
		на номер зачетки (номер зачетки больше заданного). Попытайтесь осуществить вставку в два последних представления 
		с нарушением и без нарушения ограничений.*/
CREATE OR REPLACE  VIEW S6 as SELECT * FROM S5 WHERE z_number > 120035 /*< 120052*/ WITH CASCADED CHECK OPTION;

	SELECT * FROM S6; 
	INSERT INTO S6 VALUES (120031, "Представление", "Игорь", "Махмудович", 11, 51455); 
	INSERT INTO S6 VALUES (120055, "Нарушитель", "Анотолий", "Гиенович", 11, 51456);
	INSERT INTO S6 VALUES (120038, "Гондурасов", "Иннокентий", "Альбертович", 13, 51457);
	DELETE  FROM students WHERE z_number = 120038;
    
/*7.	Измените фамилию студента с заданным номером зачетки в представлении 6.*/

	UPDATE S6 SET surname = "Ангелов" WHERE z_number = 120038;
    SELECT * FROM S6;

/*8.	Удалите студента с заданным номером зачетки с помощью представления 6.*/

	DELETE FROM S6 WHERE z_number = 120050;
    SELECT * FROM S6;

/*9.	Создайте представления для получения списка студентов заданной группы: с условием проверки и без условия проверки. 
		Попытайтесь с помощью этих представлений вставить сведения о новом студенте в другую группу.*/
        
	CREATE OR REPLACE VIEW S7 as SELECT * FROM students WHERE numgroup = 12 WITH CHECK OPTION;
    SELECT * FROM S7;
        
/*10.	Создайте представление для получения сведений обо всех студентах, имеющих только отличные оценки.*/

##	SELECT * FROM students NATURAL JOIN students_subject GROUP BY z_number HAVING SUM(val) % 5 = 0 and COUNT(val) = SUM(val) / 5;

	CREATE OR REPLACE VIEW S8 as SELECT * FROM students NATURAL JOIN students_subject GROUP BY z_number 
		HAVING SUM(val) % 5 = 0 and COUNT(val) = SUM(val) / 5;
	SELECT * FROM S8;
    
/*11.	Создайте представление для получения сведений по каждому студенту: номер зачетки, фамилия, имя, средний и общий баллы.*/
	SELECT z_number, surname, firstname, AVG(val), SUM(val) FROM students NATURAL JOIN students_subject GROUP BY z_number;
    
    CREATE OR REPLACE VIEW S11 as SELECT z_number, surname, firstname, AVG(val), SUM(val) 
		FROM students NATURAL JOIN students_subject GROUP BY z_number;
    SELECT * FROM S11;
	
/*12.	Создайте представление для получения сведений о количестве экзаменов, которые сдавал каждый студент.*/
##	SELECT surname, COUNT(s_number) FROM students NATURAL JOIN students_subject GROUP BY z_number;

    CREATE OR REPLACE VIEW S9 as SELECT z_number, surname, COUNT(s_number) 
		FROM students NATURAL JOIN students_subject GROUP BY z_number;
    SELECT * FROM S9;
    
/*С помощью данного представления получите количество экзаменов, которые сдавал заданный студент.*/
	SELECT * FROM S9 WHERE surname LIKE "Иванов";
/*13.	Создайте представление для получения списка преподавателей, принимавших экзамены.*/
##	SELECT surname_teacher as 'Фамилия преподавателя' FROM  sub NATURAL JOIN students_subject GROUP BY s_number;

	CREATE OR REPLACE VIEW S10 as SELECT surname_teacher as 'Фамилия преподавателя' 
		FROM  sub NATURAL JOIN students_subject GROUP BY s_number;
    SELECT * FROM S10;
