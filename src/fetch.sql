-- 1. Отримання всіх записів Homework
SELECT * FROM public."Homework";

-- 2. Отримання всіх записів Lesson, включаючи дані Homework
SELECT l.*, h.name AS homework_name, h.description
FROM public."Lesson" l
         LEFT JOIN public."Homework" h ON l.homework_id = h.id;

-- 3. Отримання всіх записів Lesson (включаючи дані Homework) відсортовані за часом оновлення
SELECT l.*, h.name AS homework_name, h.description
FROM public."Lesson" l
         LEFT JOIN public."Homework" h ON l.homework_id = h.id
ORDER BY l.updatedAt;

-- 4. Отримання всіх записів Schedule, включаючи дані Lesson
SELECT s.*, l.name AS lesson_name, l.updatedAt AS lesson_updatedAt, l.homework_id
FROM public."Schedule" s
         LEFT JOIN public."Schedule_Lesson" sl ON s.id = sl.schedule_id
         LEFT JOIN public."Lesson" l ON sl.lesson_id = l.id;

-- 5. Отримання кількості Lesson для кожного Schedule
SELECT s.id, s.name, COUNT(sl.lesson_id) AS lesson_count
FROM public."Schedule" s
         LEFT JOIN public."Schedule_Lesson" sl ON s.id = sl.schedule_id
GROUP BY s.id, s.name;
