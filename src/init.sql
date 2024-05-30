-- Table: Homework
DROP TABLE IF EXISTS public."Homework";
CREATE TABLE IF NOT EXISTS public."Homework"
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
    );

-- Table: Lesson
DROP TABLE IF EXISTS public."Lesson";
CREATE TABLE IF NOT EXISTS public."Lesson"
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    updatedAt TIMESTAMP,
    homework_id INTEGER,
    CONSTRAINT fk_homework
    FOREIGN KEY(homework_id)
    REFERENCES public."Homework"(id)
    );

-- Table: Schedule
DROP TABLE IF EXISTS public."Schedule";
CREATE TABLE IF NOT EXISTS public."Schedule"
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    updatedAt TIMESTAMP
    );

-- Table: Schedule_Lesson (Many-to-Many relationship)
DROP TABLE IF EXISTS public."Schedule_Lesson";
CREATE TABLE IF NOT EXISTS public."Schedule_Lesson"
(
    schedule_id INTEGER,
    lesson_id INTEGER,
    CONSTRAINT fk_schedule
    FOREIGN KEY(schedule_id)
    REFERENCES public."Schedule"(id),
    CONSTRAINT fk_lesson
    FOREIGN KEY(lesson_id)
    REFERENCES public."Lesson"(id),
    PRIMARY KEY (schedule_id, lesson_id)
    );
