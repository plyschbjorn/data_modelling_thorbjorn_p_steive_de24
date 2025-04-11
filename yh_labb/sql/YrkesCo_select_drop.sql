DROP SCHEMA yrkesco CASCADE;


select * from stad;
select * from adress;
select * from skola;
select * from personuppgift;
select * from program;
select * from skolprogram;
select * from beviljad;
select * from kurs;
select * from kursprogram;
select * from yrkesroll;
select * from personal;
select * from konsultbolag;
select * from konsult;
select * from fast_arbete;
select * from skolpersonal;
select * from kurspersonal;
select * from fri_kurs;
select * from student;
select * from fri_student;
select * from klass;
select * from antagen_student;
select * from kursbetyg;
select * from ledningsgrupp;
select * from ledningspersonal;
select * from ledningstudent;
select * from firma;
select * from ledningsfirma;
select * from protokoll;

set search_path TO public;


DROP TABLE stad CASCADE;
DROP TABLE adress CASCADE;
DROP TABLE skola CASCADE;
DROP TABLE personuppgift CASCADE;
DROP TABLE program CASCADE;
DROP TABLE skolprogram CASCADE;
DROP TABLE beviljad CASCADE;
DROP TABLE kurs CASCADE;
DROP TABLE kursprogram CASCADE;
DROP TABLE yrkesroll CASCADE;
DROP TABLE personal CASCADE;
DROP TABLE konsultbolag CASCADE;
DROP TABLE konsult CASCADE;
DROP TABLE fast_arbete CASCADE;
DROP TABLE skolpersonal CASCADE;
DROP TABLE kurspersonal CASCADE;
DROP TABLE fri_kurs CASCADE;
DROP TABLE student CASCADE;
DROP TABLE fri_student CASCADE;
DROP TABLE klass CASCADE;
DROP TABLE antagen_student CASCADE;
DROP TABLE kursbetyg CASCADE;
DROP TABLE ledningsgrupp CASCADE;
DROP TABLE ledningspersonal CASCADE;
DROP TABLE ledningstudent CASCADE;
DROP TABLE firma CASCADE;
DROP TABLE ledningsfirma CASCADE;
DROP TABLE protokoll CASCADE;

