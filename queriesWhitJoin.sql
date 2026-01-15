-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select `students`.*, `degrees`.`name` as `Degree Name`
from `degrees`
inner join `students`
on `degrees`.`id` = `students`.`degree_id`
where `degrees`.`name` = "Corso di Laurea in Economia "


-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
select `degrees`.*, `departments`.`name` as `department_name`
from `departments`
inner join `degrees`
on `degrees`.`department_id` = `departments`.`id`
where `departments`.`name` = "Dipartimento di neuroscienze"
and `degrees`.`level` = "magistrale"

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
select `courses`.*, `teachers`.`name` as `teacher_name`, `teachers`.`surname` as `teacher_surname`
from `courses`
inner join `course_teacher`
on `courses`.`id` = `course_teacher`.`course_id`
inner join `teachers`
on `teachers`.`id` = `course_teacher`.`teacher_id`
where `teachers`.`id` = 44

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
-- relativo dipartimento, in ordine alfabetico per cognome e nome
select `students`.*, `degrees`.`name` as `degree_name`, `departments`.`name` as `department_name`
from `students`
inner join `degrees`
on `degrees`.`id` = `students`.`degree_id`
inner join `departments`
on `departments`.`id` = `degrees`.`department_id`
order by `students`.`surname`, `students`.`name`

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
select `degrees`.*, `courses`.`name` as `course_name`, `courses`.`description`, `teachers`.`name` as `teacher_name` ,`teachers`.`surname` as `teacher_surname`
from `degrees`
inner join `courses`
on `degrees`.`id` = `courses`.`degree_id`
inner join `course_teacher`
on `courses`.`id` = `course_teacher`.`course_id`
inner join `teachers`
on `teachers`.`id` = `course_teacher`.`teacher_id`
order by `degrees`.`name`

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
select distinct `teachers`.*, `departments`.`name`
from `departments`
inner join `degrees`
on `departments`.`id` = `degrees`.`department_id`
inner join `courses`
on `degrees`.`id` = `courses`.`degree_id`
inner join `course_teacher`
on `courses`.`id` = `course_teacher`.`course_id`
inner join `teachers`
on `teachers`.`id` = `course_teacher`.`teacher_id`
where `departments`.`name` = "Dipartimento di Matematica"

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
-- superare ciascuno dei suoi esami

select `courses`.`name`,`students`.`id`, `students`.`name`, `students`.`surname`,count(`students`.`id`)
from `exams`
inner join `exam_student`
on `exams`.`id` = `exam_student`.`exam_id`
inner join `students`
on `students`.`id` = `exam_student`.`student_id`
inner join `courses`
on `courses`.`id` = `exams`.`course_id`
group by  `students`.`id`, `courses`.`id`