CREATE DATABASE hostel_db;

USE hostel_db;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  role VARCHAR(20) DEFAULT 'student'  -- 'student' or 'admin'
);


-- create an admin user for testing:
INSERT INTO users (username, password, email, role) VALUES ('admin','admin123','admin@example.com','admin');

select * from users;


-- First drop the bookings table because it depends on rooms
DROP TABLE IF EXISTS bookings;

-- Then drop the rooms table
DROP TABLE IF EXISTS rooms;

-- Recreate the rooms table with available_capacity
CREATE TABLE rooms (
  room_id INT AUTO_INCREMENT PRIMARY KEY,
  room_number VARCHAR(10) UNIQUE NOT NULL,
  capacity INT NOT NULL,
  available_capacity INT NOT NULL,
  status VARCHAR(20) DEFAULT 'available' 
);
select * from rooms;

-- Recreate the bookings table with foreign key to rooms
CREATE TABLE bookings (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  room_id INT NOT NULL,
  num_students INT NOT NULL DEFAULT 1,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (room_id) REFERENCES rooms(room_id) ON DELETE CASCADE);
  
INSERT INTO rooms (room_number, capacity, available_capacity) VALUES ('101',4,4);

CREATE TABLE booking_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    username VARCHAR(50),
    room_id INT,
    num_students INT,
    start_date DATE,
    end_date DATE,
    booking_date TIMESTAMP,
    cancelled_by VARCHAR(20),   -- 'student' or 'admin'
    cancelled_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
