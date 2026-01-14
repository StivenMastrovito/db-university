-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
select * 
from `students`
where year(date_of_birth) = 1990
;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
select * 
from `courses`
where cfu > 10

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
select *
from `students`
where to_days(`date_of_birth`) < to_days(curdate()) - 10958  
order by date_of_birth desc


-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
-- laurea (286)
select * 
from `courses`
where `period` = "I semestre"
and `year` = 1

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
-- 20/06/2020 (21)
select * 
from `exams`
where `date` = "2020-06-20"
and `hour` >= "14:00:00"

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
select * 
from `degrees`
where `level` = "magistrale"

-- 7. Da quanti dipartimenti è composta l'università? (12)
select count(`id`) 
from `departments`


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
select count(`id`) 
from `teachers`
where `phone` IS NULL

-- 1. Contare quanti iscritti ci sono stati ogni anno
select count(`id`), year(enrolment_date)
from `students`
group by year(enrolment_date) 
order by year(enrolment_date) asc


-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
select office_number, count(`id`)
from `teachers`
group by `office_number`

-- 3. Calcolare la media dei voti di ogni appello d'esame
select avg(vote), exam_id
from `exam_student`
group by `exam_id`
order by exam_id asc

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
select count(`id`), `department_id`
from `degrees`
group by department_id
order by department_id asc


-- __prova