create database assignment3

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    role VARCHAR(20) CHECK (role IN ('admin', 'customer')) NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    phone VARCHAR(20)
);


CREATE TABLE vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(20) CHECK (type IN ('car', 'bike', 'truck')) NOT NULL,
    model VARCHAR(50),
    registration_no VARCHAR(50) UNIQUE NOT NULL,
    price_per_day DECIMAL(10,2) NOT NULL,
    availability_status VARCHAR(20)
        CHECK (availability_status IN ('available', 'rented', 'maintenance'))
        NOT NULL
);

CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    booking_status VARCHAR(20)
        CHECK (booking_status IN ('pending', 'confirmed', 'completed', 'cancelled'))
        NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_vehicle
        FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id)
        ON DELETE CASCADE
);

INSERT INTO users (user_id, name, email, phone, role, password) VALUES
(1, 'Alice', 'alice@example.com', '1234567890', 'customer', 'password123'),
(2, 'Bob', 'bob@example.com', '0987654321', 'admin', 'admin123'),
(3, 'Charlie', 'charlie@example.com', '1122334455', 'customer', 'charlie123');


INSERT INTO vehicles (
    vehicle_id, name, type, model, registration_no, price_per_day, availability_status
) VALUES
(1, 'Toyota Corolla', 'car', 2022, 'ABC-123', 50, 'available'),
(2, 'Honda Civic', 'car', 2021, 'DEF-456', 60, 'rented'),
(3, 'Yamaha R15', 'bike', 2023, 'GHI-789', 30, 'available'),
(4, 'Ford F-150', 'truck', 2020, 'JKL-012', 100, 'maintenance');


INSERT INTO bookings (
    booking_id, user_id, vehicle_id, start_date, end_date, booking_status, total_cost
) VALUES
(1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(2, 1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
(4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);


SELECT 
    b.booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN vehicles v ON b.vehicle_id = v.vehicle_id;


SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.vehicle_id
);

SELECT *
FROM vehicles
WHERE type = 'car'
AND availability_status = 'available';


SELECT 
v.name AS vehicle_name,
COUNT (b.booking_id) AS total_bookings
From bookings b
JOIN vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY v.name 
HAVING COUNT (b.booking_id) > 2;