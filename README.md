# 🚗 Vehicle Rental System – Database Design & SQL Queries

## 📌 Project Overview
This project focuses on designing and implementing a **relational database system** for a simplified **Vehicle Rental System**.  
The assignment evaluates understanding of **ERD design**, **database relationships**, **primary and foreign keys**, and **SQL querying techniques**.

The system manages users, vehicles, and bookings while following real-world business rules commonly used in rental platforms.

GitHub Repo: https://github.com/razaulkarim2410/assignment3

ERD Link: https://lucid.app/lucidchart/66dbcc08-aa58-41f6-a0e5-353600173cec/edit?viewport_loc=-2903%2C379%2C2693%2C1158%2C0_0&invitationId=inv_5d15f160-2e9a-4d13-a75d-7526dec2e31c

Viva Video Link: https://drive.google.com/file/d/1Dj3fjfzzoM1Nu87ttmch-QwWNlWbRSCS/view?usp=sharing

---

## 🎯 Objectives
By completing this project, the following skills are demonstrated:

- Designing an **Entity Relationship Diagram (ERD)**
- Implementing **One-to-One**, **One-to-Many**, and **Many-to-One** relationships
- Understanding and applying **Primary Keys (PK)** and **Foreign Keys (FK)**
- Writing SQL queries using:
  - `JOIN`
  - `EXISTS`
  - `WHERE`
  - `GROUP BY`
  - `HAVING`

---

## 🗄️ Database Design & Business Logic

The system consists of three core entities:

- **Users**
- **Vehicles**
- **Bookings**

### 🔹 Business Rules
- A user can make multiple bookings
- A vehicle can be booked multiple times
- Each booking is associated with **exactly one user and one vehicle**
- Emails and vehicle registration numbers must be unique

---

## 📘 Table Structure

### **Users Table**
Stores:
- User role (Admin / Customer)
- Name
- Email (unique)
- Password
- Phone number

---

### **Vehicles Table**
Stores:
- Vehicle name
- Vehicle type (car / bike / truck)
- Model year
- Registration number (unique)
- Rental price per day
- Availability status (available / rented / maintenance)

---

### **Bookings Table**
Stores:
- User who made the booking (FK → Users)
- Vehicle that was booked (FK → Vehicles)
- Rental start and end dates
- Booking status (pending / confirmed / completed / cancelled)
- Total booking cost


প্রশ্ন ১: Foreign Key কী এবং relational database-এ এটি কেন গুরুত্বপূর্ণ?

Foreign Key হলো একটি টেবিলের এমন একটি কলাম (বা কলামসমূহ), যা অন্য একটি টেবিলের Primary Key-কে রেফার করে।

গুরুত্ব:

টেবিলগুলোর মধ্যে সম্পর্ক (relationship) তৈরি করে

ডাটা consistency বজায় রাখে

ভুল বা অবৈধ ডাটা ঢোকা প্রতিরোধ করে

Parent টেবিলে ডাটা না থাকলে Child টেবিলে ডাটা insert হতে দেয় না

উদাহরণ:
orders টেবিলের user_id যদি users টেবিলের id-কে রেফার করে, তাহলে user_id একটি Foreign Key।

প্রশ্ন ২: SQL-এ WHERE এবং HAVING clause-এর পার্থক্য কী?
WHERE	HAVING
Group করার আগে ডাটা ফিল্টার করে	Group করার পরে ডাটা ফিল্টার করে
Aggregate function (COUNT, SUM) ব্যবহার করা যায় না	Aggregate function ব্যবহার করা যায়
সাধারণ শর্তে ব্যবহৃত হয়	GROUP BY-এর সাথে ব্যবহৃত হয়

উদাহরণ:

WHERE salary > 20000
HAVING COUNT(*) > 5

প্রশ্ন ৩: Primary Key কী এবং এর বৈশিষ্ট্যগুলো কী?

Primary Key হলো একটি টেবিলের এমন একটি কলাম (বা কলামসমূহ), যা প্রতিটি রেকর্ডকে ইউনিকভাবে শনাক্ত করে।

বৈশিষ্ট্য:

প্রতিটি মান Unique হতে হবে

NULL হতে পারে না

একটি টেবিলে শুধুমাত্র একটি Primary Key থাকতে পারে

ডাটা দ্রুত খুঁজে পেতে সাহায্য করে

উদাহরণ:
users টেবিলের id

প্রশ্ন ৪: SQL-এ INNER JOIN এবং LEFT JOIN-এর পার্থক্য কী?
INNER JOIN	LEFT JOIN
দুই টেবিলের matching ডাটা দেখায়	Left টেবিলের সব ডাটা দেখায়
Non-matching ডাটা বাদ পড়ে	Right টেবিলে match না থাকলে NULL দেখায়

উদাহরণ:

INNER JOIN → শুধু যেগুলো দুই টেবিলেই আছে

LEFT JOIN → বাম টেবিলের সব, ডান টেবিল না মিললে NULL
