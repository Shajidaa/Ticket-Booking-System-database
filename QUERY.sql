-- =========================================================================
-- SYSTEM: Football Ticket Booking System Database Setup Template
-- DESCRIPTION: Completed DDL with Exact Data Types & Relational Keys
-- =========================================================================

DROP TABLE IF EXISTS Bookings;


DROP TABLE IF EXISTS Matches;


DROP TABLE IF EXISTS Users;


-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
  user_id int,
  full_name varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  role varchar(30) NOT NULL,
  phone_number varchar(20),
 
  CONSTRAINT pk_users PRIMARY KEY (user_id),
 
  CONSTRAINT uq_user_email UNIQUE (email),

  CONSTRAINT chk_user_role CHECK (role IN ('Ticket Manager', 'Football Fan'))
);


-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
  match_id int,
  fixture varchar(150) NOT NULL,
  tournament_category varchar(100) NOT NULL,
  base_ticket_price decimal(10, 2) NOT NULL,
  ে match_status varchar(30) NOT NULL,
  CONSTRAINT pk_matches PRIMARY KEY (match_id),
  CONSTRAINT chk_base_price CHECK (base_ticket_price >= 0),
  CONSTRAINT chk_match_status CHECK (
    match_status IN (
      'Available',
      'Selling Fast',
      'Sold Out',
      'Postponed'
    )
  )
);


-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
  booking_id int,
  user_id int NOT NULL,
  match_id int NOT NULL,
  seat_number varchar(10),
  payment_status varchar(30),
  total_cost decimal(10, 2) NOT NULL,

  CONSTRAINT pk_bookings PRIMARY KEY (booking_id),

  CONSTRAINT fk_bookings_user FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE RESTRICT,
 
  CONSTRAINT fk_bookings_match FOREIGN KEY (match_id) REFERENCES Matches (match_id) ON DELETE RESTRICT,

  CONSTRAINT chk_total_cost CHECK (total_cost >= 0),

  CONSTRAINT chk_payment_status CHECK (
    payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
  )
);


-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO USERS
-- =========================================================================
INSERT INTO
  Users (user_id, full_name, email, role, phone_number)
VALUES
  (
    1,
    'Tanvir Rahman',
    'tanvir@mail.com',
    'Football Fan',
    '+8801711111111'
  ),
  (
    2,
    'Asif Haque',
    'asif@mail.com',
    'Football Fan',
    '+8801722222222'
  ),
  (
    3,
    'Sajjad Rahman',
    'sajjad@mail.com',
    'Ticket Manager',
    '+8801733333333'
  ),
  (
    4,
    'Jannat Ara',
    'jannat@mail.com',
    'Football Fan',
    NULL
  );


-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO MATCHES
-- =========================================================================
INSERT INTO
  Matches (
    match_id,
    fixture,
    tournament_category,
    base_ticket_price,
    match_status
  )
VALUES
  (
    101,
    'Real Madrid vs Barcelona',
    'Champions League',
    150.00,
    'Available'
  ),
  (
    102,
    'Man City vs Liverpool',
    'Premier League',
    120.00,
    'Selling Fast'
  ),
  (
    103,
    'Bayern Munich vs PSG',
    'Champions League',
    130.00,
    'Available'
  ),
  (
    104,
    'AC Milan vs Inter Milan',
    'Serie A',
    90.00,
    'Sold Out'
  ),
  (
    105,
    'Juventus vs Roma',
    'Serie A',
    80.00,
    'Available'
  );


-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO BOOKINGS
-- =========================================================================
INSERT INTO
  Bookings (
    booking_id,
    user_id,
    match_id,
    seat_number,
    payment_status,
    total_cost
  )
VALUES
  (501, 1, 101, 'A-12', 'Confirmed', 150.00),
  (502, 1, 102, 'B-04', 'Confirmed', 120.00),
  (503, 2, 101, 'A-13', 'Confirmed', 150.00),
  (504, 2, 101, NULL, NULL, 150.00),
  (505, 3, 102, 'C-20', 'Pending', 120.00);


--Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.
SELECT 
    match_id, 
    fixture, 
    base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League' 
  AND match_status = 'Available';


--Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).


SELECT 
    user_id, 
    full_name, 
    email
FROM users
WHERE full_name LIKE 'Tanvir%' 
   OR LOWER(full_name) LIKE '%haque%';