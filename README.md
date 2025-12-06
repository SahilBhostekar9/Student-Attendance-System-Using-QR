# Student-Attendance-System-Using-QR
Made an Java Servlet Pages To Scan and Mark Attendance for students.

A web-based Student Attendance System built using Java, JSP, and MySQL. It allows students to register, mark attendance (via QR/barcode), and enables administrators to view records—all in a dynamic, modern UI.

Features

->Student Registration: Register students with unique details and prevent duplicate records.

->Database Integration: Uses MySQL for storage and retrieval of student and attendance records.

->Attendance Marking: QR/Barcode-based attendance with duplicate prevention for each day.

->Attendance Records: View attendance history including timestamp, student ID, and name.

->Responsive UI: Stylish, accessible design using custom CSS for easy navigation.

File Overview

File Name	Purpose
addStudent.jsp	Registers new students, inserts them to DB.
markAttendance.jsp	Marks attendance for students (QR/Barcode supported).
viewRecords.jsp	Displays detailed attendance records.
database.jsp	Manages DB connection parameters.
styles.css	Custom dark theme styling for UI.
Setup Instructions

1)Clone the Repository https://github.com/S-Venky-06/Student-Attendance-System-Using-QR-Code.git

2)Configure MySQL Database

  Create a MySQL database attendance_db.
3)Edit Database Credentials

   Update database.jsp with your MySQL username and password.
4)Deploy JSP Files

  Place .jsp files inside your web server (Apache Tomcat recommended).
5)Run the Project

   Start MySQL and Tomcat.

   Access the application at:
        http://localhost:8080/<webapp-directory>/
6)Usage

->   Register students via the Add Student page.

 ->  Mark attendance via the Attendance page.

 ->  View or filter records in the Records page.
Technologies Used

-> Java, JSP, Servlets

-> MySQL

-> HTML, CSS

-> JDBC

-> QR/Barcode

Refer to the scrrenshots for the reference.....
