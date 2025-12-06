# Student Attendance System Using QR Code

A dynamic, web-based Student Attendance System built using Java JSP, MySQL, and QR code technology. This application streamlines the attendance process by allowing administrators to register students, generate unique QR codes, and mark attendance in real-time using a webcam scanner.

## 🌟 Key Features

* **Smart Student Registration**:
    * [cite_start]Register new students with ID, Name, and Email[cite: 10].
    * [cite_start]**Duplicate Protection**: Automatically checks if a Student ID already exists in the database before registration[cite: 11, 13].
* **Dynamic QR Code Generation**:
    * [cite_start]Instantly generates unique QR codes for registered students containing their ID and Name data[cite: 3, 4, 8].
    * [cite_start]Allows selection from a dropdown of all currently registered students[cite: 2].
* **Contactless Attendance Marking**:
    * [cite_start]**Webcam Scanner**: Integrated `html5-qrcode` scanner to read QR codes directly from the browser[cite: 72].
    * [cite_start]**Daily Validation**: Prevents double-marking by checking if the student has already clocked in for the current date[cite: 58, 60].
* **Attendance Records & Filtering**:
    * [cite_start]View detailed logs including Student ID, Name, Date, and Time[cite: 43, 49].
    * [cite_start]**Filter System**: Filter records by specific dates or specific students to easily track history[cite: 36, 37].
* **Modern UI**:
    * Features a responsive "Dark Dynamic Theme" with neon accents.
    * [cite_start]Single-page application feel using a central controller (`index.jsp`) for navigation[cite: 31, 32].

## 🛠️ Technologies Used

* **Backend**: Java Server Pages (JSP), JDBC
* **Database**: MySQL
* **Frontend**: HTML5, CSS3, JavaScript
* **Libraries**:
    * `qrcode.js` (for generation)
    * `html5-qrcode` (for scanning)

## 📂 File Structure

| File Name | Description |
| :--- | :--- |
| `index.jsp` | [cite_start]Main controller that handles navigation between tabs[cite: 32]. |
| `database.jsp` | [cite_start]Manages MySQL database connection settings[cite: 27]. |
| `addStudent.jsp` | [cite_start]Handles student registration and database insertion[cite: 14]. |
| `generateQR.jsp` | [cite_start]Selects a student and renders their QR code[cite: 1]. |
| `markAttendance.jsp` | [cite_start]Scans QR codes and marks attendance with duplicate checks[cite: 55]. |
| `viewRecords.jsp` | [cite_start]Displays attendance history with filtering options[cite: 36]. |
| `styles.css` | Custom dark theme styling. |

## ⚙️ Setup & Installation

### 1. Database Configuration
Create a MySQL database named `attendance_db` and run the following SQL queries to set up the required tables:

```sql
-- Create Database
CREATE DATABASE attendance_db;
USE attendance_db;

-- Create Students Table
CREATE TABLE students (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

-- Create Attendance Table
CREATE TABLE attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(50),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id)
);
