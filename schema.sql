PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS user (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    password TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    creation_date TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS muscle (
    id INTEGER PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS exercise (
    id INTEGER PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    muscle_id INTEGER NOT NULL,
    FOREIGN KEY (muscle_id) REFERENCES muscle(id)
);
CREATE TABLE IF NOT EXISTS workout (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    date TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS performance (
    id INTEGER PRIMARY KEY,
    workout_id INTEGER NOT NULL,
    exercise_id INTEGER NOT NULL,
    set_number INTEGER NOT NULL CHECK (set_number > 0),
    reps INTEGER NOT NULL CHECK (reps > 0),
    weight REAL NOT NULL CHECK (weight >= 0),
    FOREIGN KEY (workout_id) REFERENCES workout(id) ON DELETE CASCADE,
    FOREIGN KEY (exercise_id) REFERENCES exercise(id) ON DELETE RESTRICT
);