-- Active: 1791816930597@@127.0.0.1@5432@assignment
create table users (
 user_id serial PRIMARY key,
 name varchar(80),
 role varchar(20) not null,
 email varchar(40) unique not null,
 password varchar(20) not null,
 phone_number varchar(15) unique not null

);
drop TABLE users
 alter table users add COLUMN role varchar(20) ;

create table Vehicles (
 vehicles_id serial primary key,
 user_id int REFERENCES users(user_id),
 vehicles_name VARCHAR(50) not null,
 vehicles_type varchar(40) not null,
 registration_number  varchar(20) unique not null,
 rent_price NUMERIC(10,2) not null,
 availability_status VARCHAR(20) not null


)

create table bookings (
 booking_id serial primary key,
 user_id int REFERENCES users(user_id),
 vehicles_id int REFERENCES Vehicles(vehicles_id),
 start_date date not null,
 end_date date not null,
 booking_status varchar(20) not null,
 booking_cost NUMERIC(10,2) not null

)


insert into users ( name,role,email,password,phone_number) VALUES
('Alex Mercer', 'customer', 'alex.mercer@example.com', 'Pass123!Secure', '+4915123456781'),
('Sophia Chen', 'host', 'sophia.chen@example.com', 'P@ssword2026', '+4915123456782'),
('Marcus Vance', 'customer', 'marcus.vance@example.com', 'Vance#8901', '+4915123456783'),
('Elena Rostova', 'admin', 'elena.rostova@example.com', 'E_Rostova!456', '+4915123456784'),
('Liam O''Connor', 'customer', 'liam.oconnor@example.com', 'IrishL1am#99', '+4915123456785'),
('David Miller', 'host', 'david.miller@example.com', 'D_Miller!789', '+4915123456786'),
('Hannah Schmidt', 'customer', 'hannah.schmidt@example.com', 'H#Schmidt2026', '+4915123456787'),
('Carlos Gomez', 'admin', 'carlos.gomez@example.com', 'C_Gomez!321', '+4915123456788');

select * from users;

insert into Vehicles (user_id,vehicles_name, vehicles_type,registration_number,rent_price,availability_status) values 
(1, 'Tesla Model 3', 'Electric Sedan', 'E-AM-2026', 85.00, 'available'),
(1, 'BMW X5', 'SUV', 'B-MW-1099', 110.50, 'booked'),
(2, 'Volkswagen Golf', 'Hatchback', 'VW-GO-4021', 45.00, 'available'),
(3, 'Ford Mustang GT', 'Coupe', 'FM-GT-5000', 130.00, 'maintenance'),
(4, 'Mercedes-Benz Sprinter', 'Van', 'MB-SP-8821', 95.00, 'available');
select * from Vehicles;


insert into bookings (user_id,vehicles_id,start_date,end_date,booking_status,booking_cost) values

(2, 2, '2026-10-20', '2026-10-23', 'confirmed', 331.50),
(3, 1, '2026-10-01', '2026-10-05', 'completed', 340.00),
(4, 3, '2026-09-15', '2026-09-18', 'completed', 135.00),
(5, 5, '2026-11-01', '2026-11-04', 'pending', 285.00),
(1, 4, '2026-08-10', '2026-08-12', 'cancelled', 260.00);


select * from bookings




select name,vehicles_name,start_date,end_date,booking_status,booking_cost from users
inner join bookings on users.user_id= bookings.user_id
INNER join Vehicles on users.user_id=Vehicles.user_id




SELECT *
FROM Vehicles v
WHERE NOT EXISTS (
    SELECT 1 
    FROM bookings b 
    WHERE b.vehicles_id = v.vehicles_id
);




select * from Vehicles
where vehicles_type='SUV'





select vehicles_name, count(bookings.booking_id) from Vehicles
inner join bookings on Vehicles.vehicles_id=bookings.vehicles_id GROUP BY  Vehicles.vehicles_name
HAVING count(bookings.booking_id)>2


SELECT v.vehicles_name, COUNT(b.booking_id) AS total_bookings
FROM Vehicles v
JOIN bookings b ON v.vehicles_id = b.vehicles_id 
GROUP BY v.vehicles_id, v.vehicles_name
HAVING COUNT(b.booking_id) > 2;


