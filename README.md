# 🏠 Hostel/PG Booking Web Application

A **dynamic hostel/PG booking system** built using **JSP, Servlets, MySQL, and CSS**, enabling students to book rooms and administrators to manage rooms and bookings. This is a full-stack project with responsive design and real-time database updates.

---

## **Table of Contents**

1. [Project Overview](#project-overview)
2. [Features](#features)

   * [Student Features](#student-features)
   * [Admin Features](#admin-features)
   * [General Features](#general-features)
3. [Project Structure](#project-structure)
4. [Database Structure](#database-structure)
5. [How to Run the Project](#how-to-run-the-project)
6. [Future Improvements](#future-improvements)
7. [Screenshots](#screenshots)
8. [Credits](#credits)

---

## **Project Overview**

This **Hostel/PG Booking Web Application** allows users to:

* Register and login securely.
* Browse and book available hostel rooms.
* View booking history and cancel bookings.
* Admins can add/delete rooms, manage bookings, and view histories.

---

## **Features**

### **Student Features**

* ✅ Register and login securely.
* ✅ View available rooms with capacity details.
* ✅ Book rooms with dates and number of students.
* ✅ View and cancel own bookings.
* ✅ Access personalized dashboard.

### **Admin Features**

* ✅ Add new rooms with capacities.
* ✅ Delete rooms.
* ✅ Cancel bookings.
* ✅ View all bookings and histories.
* ✅ Delete booking history records.
* ✅ Access admin dashboard.

### **General Features**

* ✅ Responsive UI for all screen sizes.
* ✅ Home page with hero section, features, and services.
* ✅ Modern CSS styling with hover effects.
* ✅ Real-time updates from MySQL database.

---

## **Project Structure**

### **1. JSP Pages (`webapp/`)**

* `AddRoom.jsp` – Add new rooms.
* `adminDashboard.jsp` – Admin landing page.
* `booking.jsp` – Student room booking page.
* `bookingHistory.jsp` – Student booking history.
* `index.jsp` – Home page with hero, features, and services.
* `login.jsp` – Login page.
* `logout.jsp` – Logout page.
* `myBookings.jsp` – Student current bookings.
* `register.jsp` – Registration page.
* `studentDashboard.jsp` – Student dashboard.
* `viewAllBookings.jsp` – Admin view of all bookings.

---

### **2. Servlets (`com.servlet`)**

* `AddRoomServlet` – Adds rooms to database.
* `AdminCancelBookingServlet` – Admin cancels student booking.
* `BookingServlet` – Handles room booking.
* `CancelBookingServlet` – Student cancels booking.
* `DeleteHistoryServlet` – Admin deletes booking history.
* `DeleteRoomServlet` – Admin deletes a room.
* `LoginServlet` – Handles login.
* `RegisterServlet` – Handles user registration.

---

### **3. Utility Class**

* `DBConnection` (`com.dao`) – Manages MySQL database connection.

---

### **4. CSS Files (`webapp/css/`)**

* `home.css` – Styles for `index.jsp`.
* `style.css` – Styles for all other JSP pages except login/register.
* Login and register pages have their own embedded CSS.

---

## **Database Structure**

* **users** – `username`, `email`, `password`
* **rooms** – `room_id`, `room_number`, `capacity`, `available_capacity`, `status`
* **bookings** – `booking_id`, `username`, `room_id`, `num_students`, `start_date`, `end_date`
* **booking_history** – `id`, `username`, `room_id`, `cancelled_by`, `cancelled_date`

> Ensure MySQL database and tables are created before running the project.

---

## **How to Run the Project**

1. Import project in **Eclipse Enterprise Edition** → extract all files and put the servlet file in src/main/java in a package and in the same src/main/java in other a package
   put the DBConnection file .
2. Place all the jsp files in webapp and open css folder in webapp and put the css files.
3. Add MySQLconnector jar files for API to connect mysql. 
4. Update `DBConnection.java` with your **MySQL credentials**.
5. Place all images used in `index.jsp` or room features inside `webapp/images/`.
6. Run the project on **Tomcat Server**: Right-click project → `Run As` → `Run on Server`.
7. Access in browser:

   ```
   http://localhost:8080/YourProjectName/index.jsp
   ```

---

## **Future Improvements**

* Integrate a **payment gateway** for room booking.
* Use **modern frameworks** like Bootstrap or Tailwind for better UI.
* Implement **role-based authentication** and permissions.

---
## Watch Demo Vedio [ https://drive.google.com/file/d/1TVhWyF6jMT7LuYHp8-AegTOhMsQnQiwR/view?usp=drivesdk ]
## **Screenshots**

* Home Page with Hero Section [ https://github.com/jebastin2003/Hostel-PG-booking-web-Application/blob/36e260bf8b9287567a1f6905aa5c73cc57c0722f/Screenshots%20of%20the%20project/Home%20page.png ]
* homepage 2 [ https://github.com/jebastin2003/Hostel-PG-booking-web-Application/blob/36e260bf8b9287567a1f6905aa5c73cc57c0722f/Screenshots%20of%20the%20project/homepage2.png ]
* homepage 3[ https://github.com/jebastin2003/Hostel-PG-booking-web-Application/blob/36e260bf8b9287567a1f6905aa5c73cc57c0722f/Screenshots%20of%20the%20project/homepage%203.png ]
* login page [ https://github.com/jebastin2003/Hostel-PG-booking-web-Application/blob/36e260bf8b9287567a1f6905aa5c73cc57c0722f/Screenshots%20of%20the%20project/Login%20page.png ]
* Register page [ https://github.com/jebastin2003/Hostel-PG-booking-web-Application/blob/36e260bf8b9287567a1f6905aa5c73cc57c0722f/Screenshots%20of%20the%20project/Register%20page.png ]
* Student Dashboard[ https://github.com/jebastin2003/Hostel-PG-booking-web-Application/blob/36e260bf8b9287567a1f6905aa5c73cc57c0722f/Screenshots%20of%20the%20project/student%20Dashboard%20page.png ]
* Student booking page [ https://github.com/jebastin2003/Hostel-PG-booking-web-Application/blob/36e260bf8b9287567a1f6905aa5c73cc57c0722f/Screenshots%20of%20the%20project/student%20booking%20page.png ]
* Student booking view and cancelling [ https://github.com/jebastin2003/Hostel-PG-booking-web-Application/blob/36e260bf8b9287567a1f6905aa5c73cc57c0722f/Screenshots%20of%20the%20project/Studentbooking%20view%20and%20cancelling%20page.png ]
* Admin Dashboard [ https://github.com/jebastin2003/Hostel-PG-booking-web-Application/blob/36e260bf8b9287567a1f6905aa5c73cc57c0722f/Screenshots%20of%20the%20project/admin%20dashboard%20page.png ]
* Admin addroom [ https://github.com/jebastin2003/Hostel-PG-booking-web-Application/blob/36e260bf8b9287567a1f6905aa5c73cc57c0722f/Screenshots%20of%20the%20project/admin%20addroom%20page.png ]
* Admin viewall booking [ https://github.com/jebastin2003/Hostel-PG-booking-web-Application/blob/36e260bf8b9287567a1f6905aa5c73cc57c0722f/Screenshots%20of%20the%20project/admin%20view%20all%20booking%20page.png ]
* Booking History Page [ https://github.com/jebastin2003/Hostel-PG-booking-web-Application/blob/36e260bf8b9287567a1f6905aa5c73cc57c0722f/Screenshots%20of%20the%20project/admin%20booking%20history%20page.png ]

---

* Developed by **[Jebastin]**
---

✅ **Project Status:** Complete and fully functional.

---
