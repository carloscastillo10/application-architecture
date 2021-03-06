CREATE SCHEMA IF NOT EXISTS parcial_b1;

CREATE USER 'parcialb1_admin'@'localhost' IDENTIFIED BY 'parcial02b1';
GRANT ALL PRIVILEGES ON parcial_b1.* TO parcialb1_admin@localhost;
FLUSH PRIVILEGES;


USE parcial_b1;

-- -----------------------------------------------------
-- Table parcial_b1.student
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parcial_b1.student(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  lastname VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);


-- -----------------------------------------------------
-- Table parcial_b1.knowledge_area
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parcial_b1.knowledge_area(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);


-- -----------------------------------------------------
-- Table parcial_b1.faculty
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parcial_b1.faculty(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  knowledge_area_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_faculty_knowledge_area1
    FOREIGN KEY (knowledge_area_id)
    REFERENCES parcial_b1.knowledge_area (id)
);


-- -----------------------------------------------------
-- Table parcial_b1.department
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parcial_b1.department (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  faculty_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_department_faculty1
    FOREIGN KEY (faculty_id)
    REFERENCES parcial_b1.faculty (id)
);


-- -----------------------------------------------------
-- Table parcial_b1.degree
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parcial_b1.degree(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  department_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_degree_department1
    FOREIGN KEY (department_id)
    REFERENCES parcial_b1.department (id)
);


-- -----------------------------------------------------
-- Table parcial_b1.course
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parcial_b1.course(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  degree_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_course_degree1
    FOREIGN KEY (degree_id)
    REFERENCES parcial_b1.degree (id)
);


-- -----------------------------------------------------
-- Table parcial_b1.course_student
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parcial_b1.course_student(
  course_id INT NOT NULL,
  student_id INT NOT NULL,
  PRIMARY KEY (course_id, student_id),
  CONSTRAINT fk_course_has_student_course
    FOREIGN KEY (course_id)
    REFERENCES parcial_b1.course (id),
  CONSTRAINT fk_course_has_student_student1
    FOREIGN KEY (student_id)
    REFERENCES parcial_b1.student (id)
);


---------------------------------------------------------
-- Insert of knowledge_area table
---------------------------------------------------------
INSERT INTO parcial_b1.knowledge_area (name) VALUES ('T??cnica');
INSERT INTO parcial_b1.knowledge_area (name) VALUES ('Administrativa');
INSERT INTO parcial_b1.knowledge_area (name) VALUES ('Biol??gica');
INSERT INTO parcial_b1.knowledge_area (name) VALUES ('Socio Human??stica');


---------------------------------------------------------
-- Insert of faculty table
---------------------------------------------------------

INSERT INTO parcial_b1.faculty (name, knowledge_area_id) VALUES ('FACULTAD DE INGENIERIAS Y ARQUITECTURA', 1);
INSERT INTO parcial_b1.faculty (name, knowledge_area_id) VALUES ('FACULTAD DE CIENCIAS SOCIALES, EDUCACI??N Y HUMANIDADES', 4);
INSERT INTO parcial_b1.faculty (name, knowledge_area_id) VALUES ('FACULTAD DE CIENCIAS EXACTAS Y NATURALES', 3);
INSERT INTO parcial_b1.faculty (name, knowledge_area_id) VALUES ('FACULTAD DE CIENCIAS DE LA SALUD', 3);
INSERT INTO parcial_b1.faculty (name, knowledge_area_id) VALUES ('FACULTAD DE CIENCIAS ECON??MICAS Y EMPRESARIALES', 2);


---------------------------------------------------------
-- Insert of departments table
---------------------------------------------------------
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE CIENCIAS DE LA COMPUTACI??N Y ELECTR??NICA', 1);
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE CIENCIAS DE LA COMUNICACI??N', 2);
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE CIENCIAS DE LA EDUCACI??N', 2);
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE CIENCIAS JUR??DICAS', 2);
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE CIENCIAS BIOL??GICAS Y AGROPECUARIAS', 3);
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE PRODUCCI??N', 3);
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE QU??MICA', 3);
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE CIENCIAS DE LA SALUD', 4);
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE CIENCIAS EMPRESARIALES', 5);
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE ECONOM??A', 5);
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE ARQUITECTURA Y URBANISMO DEPARTAMENTO DE ARQUITECTURA Y URBANISMO', 1);
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE GEOCIENCIAS', 1);
INSERT INTO parcial_b1.department (name, faculty_id) VALUES ('DEPARTAMENTO DE INGENIER??A CIVIL Y GEOCIENCIAS', 1);


---------------------------------------------------------
-- Insert of degree table
---------------------------------------------------------
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('SISTEMAS INFORM??TICOS Y COMPUTACI??N', '1');
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE TELECOMUNICACIONES', 1);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE COMUNICACI??N', 2);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE DERECHO', 2);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE EDUCACI??N B??SICA', 3);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE EDUCACI??N INICIAL', 3);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE LENGUA Y LITERATURA', 4);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE PSICOLOG??A', 4);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE GESTI??N AMBIENTAL', 5);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE INGENIER??A AMBIENTAL', 5);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE INGENIER??A INDUSTRIAL', 6);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE INGENIER??A QU??MICA', 6);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE AGRONEGOCIOS', 7);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE SEGURIDAD Y SALUD OCUPACIONAL', 7);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE ENFERMER??A', 8);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE MEDICINA', 8);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE CONTABILIDAD Y AUDITOR??A', 9);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE ECONOM??A', 9);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE FINANZAS', 10);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE GASTRONOM??A', 10);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE GEOLOG??A', 11);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE GESTI??N DE RIESGOS Y DESASTRES', 11);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE INGENIER??A CIVIL', 12);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE LOG??STICA Y TRANSPORTE', 12);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE TECNOLOG??AS DE LA INFORMACI??N', 13);
INSERT INTO parcial_b1.degree (name, department_id) VALUES ('CARRERA DE ARQUITECTURA', 13);

---------------------------------------------------------
-- Insert of course table
---------------------------------------------------------
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('ARQUITECTURA DE APLICACIONES', '1');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('INTELIGENCIA ARTIFICIAL', '1');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('MICROONDAS', '2');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('ANTENAS', '2');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('TEOR??A DE LA COMUNICACI??N', '3');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('LINGU??STICA', '3');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('INTRODUCCI??N AL DERECHO', '4');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('DERECHO ROMANO', '4');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('M??TODOS ALTERNATIVOS', '5');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('??TICA Y MORAL', '5');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('ANTROPOLOG??A B??SICA', '6');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('M??TODOS DE LA INVESTIGACI??N', '6');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('REDACCI??N CIENT??FICA', '7');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('PSICOLOG??A DE LA FAMILIA', '8');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('MEDIO AMBIENTE', '9');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('CONTAMINACI??N ATMOSF??RICA', '10');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('QUIMICA INDUSTRIAL', '11');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('QU??MICA B??SICA', '12');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('SISTEMAS DE PRODUCCI??N ANIMAL', '13');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('BIOSEGURIDAD', '14');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('ENFERMER??A ONCOL??GICA', '15');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('FISIOPATOLOG??A', '16');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('CONTABILIDAD I', '17');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('INTRODUCCI??N A LA ECONOM??A', '18');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('FINAZAS I', '19');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('PASTELERIA', '20');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('SUELOS Y MATERIALES', '21');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('F??SICA B??SICA', '22');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('??LGEBRA LINEAL', '23');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('MODELADO DE TR??FICO', '24');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('ARQUITECTURA DE REDES', '25');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('MATERIALES', '26');
INSERT INTO parcial_b1.course (name, degree_id) VALUES ('HISTORIA DE LA ARQUITECTURA', '26');


---------------------------------------------------------
-- Insert of student table
---------------------------------------------------------
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Carlos', 'Castillo', 'cacastillo19@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Carlos', 'Juca', 'chjuca@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Renato', 'Balcazar', 'rjbalcazar@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Juan', 'Cevallos', 'jfcevallos@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Danilo', 'Menoza', 'odmendoza@utpl.edu,ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Jhandry', 'Lopez', 'jdlopez@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Andres', 'Palacios', 'aepalacios@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Josue', 'Rojas', 'jsrojas@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Mario', 'Valarezo', 'mdvalarezo@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Israel', 'Ortiz', 'iaortiz@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Diego', 'Merino', 'dpmerino@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Paul', 'Sanchez', 'pxsanchez@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Gerson', 'Santos', 'gmsantos@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Bryan', 'Pilco', 'bppilco@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Juan', 'Yanangomez', 'jjyanangomez@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Antse', 'Caceres', 'ascaceres@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Luis', 'Erazo', 'lderazo@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Fernando', 'Alvarez', 'lfalvarez2@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Jorge', 'Largo', 'jalargo@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Raul', 'Perez', 'raperez@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Daniel', 'Armijos', 'darmijos@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Andres', 'Giron', 'aegiron@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Augusto', 'Castillo', 'alcastillo@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Luis', 'Castillo', 'lfcastillo@utpl.edu.ec');
INSERT INTO parcial_b1.student (name, lastname, email) VALUES ('Homero', 'Viteri', 'hjviteri@utpl.edu.ec');


---------------------------------------------------------
-- Insert of course_student table
---------------------------------------------------------
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('1', '1');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('1', '2');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('1', '3');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('1', '4');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('2', '5');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('2', '6');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('2', '7');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('3', '8');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('3', '9');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('4', '10');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('5', '11');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('6', '12');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('7', '13');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('8', '14');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('9', '15');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('10', '16');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('11', '17');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('12', '18');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('13', '19');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('14', '20');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('15', '21');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('16', '22');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('17', '23');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('18', '24');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('19', '25');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('20', '5');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('21', '2');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('22', '8');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('23', '10');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('24', '12');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('25', '23');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('26', '18');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('27', '11');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('28', '5');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('29', '6');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('30', '20');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('31', '25');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('32', '17');
INSERT INTO parcial_b1.course_student (course_id, student_id) VALUES ('33', '6');
