<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hostel Management System | Home</title>
    <link rel="stylesheet" href="css/home.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

    <!-- ===== Navbar ===== -->
    <header>
        <div class="container">
            <h1 class="logo">Hostel<span>Ease &amp; Amore</span></h1>
            <nav>
                <ul id="nav-links">
                    <li><a href="#home" class="active">Home</a></li>
                    <li><a href="#features">Features</a></li>
                    <li><a href="#rooms">Rooms</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li><a href="login.jsp" class="btn">Login</a></li>
                    <li><a href="register.jsp" class="btn btn-primary">Register</a></li>
                </ul>
                <div class="hamburger" onclick="toggleMenu()">☰</div>
            </nav>
        </div>
    </header>

    <!-- ===== Hero Section ===== -->
    <section class="hero" id="home">
        <div class="hero-content">
            <h2>Find Your Perfect Hostel Stay</h2>
            <p>Affordable, comfortable, and secure rooms for students and professionals.</p>
            <a href="register.jsp" class="btn btn-primary">Book Now</a>
        </div>
    </section>

    <!-- ===== Features ===== -->
    <section class="features" id="features">
        <h2>Our Key Features</h2>
        <div class="feature-container">
            <div class="feature-card">
                <img src="images/securitycam.jpg" alt="Security">
                <h3>24/7 Security</h3>
                <p>Round-the-clock safety with CCTV and guards.</p>
            </div>
            <div class="feature-card">
                <img src="images/wifi.jpg" alt="WiFi">
                <h3>Free WiFi</h3>
                <p>High-speed internet access for all residents.</p>
            </div>
            <div class="feature-card">
                <img src="images/mealsss.jpeg" alt="Food">
                <h3>Healthy Meals</h3>
                <p>Nutritious food served in a clean dining area.</p>
            </div>
        </div>
    </section>

    <!-- ===== Rooms Section ===== -->
    <section class="rooms" id="rooms">
        <h2>Our Rooms Galary</h2>
        <div class="room-container">
            <div class="room-card">
                <img src="images/room1.webp" alt="Single Room">
                <h3>Neat and clean</h3>
                <p>Perfect for privacy and comfort.</p>
            </div>
            <div class="room-card">
                <img src="images/room3.jpeg" alt="Double Room">
                <h3>Spacious Rooms</h3>
                <p>Shared accommodation with modern amenities.</p>
            </div>
            <div class="room-card">
                <img src="images/hallway.webp" alt="Deluxe Room">
                <h3>Comfy and big Hallway</h3>
                <p>Spacious and well-furnished for premium comfort.</p>
            </div>
        </div>
    </section>

    <!-- ===== About Section ===== -->
    <section class="about" id="about">
        <h2>About Us</h2>
        <p>We provide comfortable and secure hostel accommodations for students and working professionals. 
           Our mission is to make finding and booking a hostel easy, reliable, and affordable for everyone.</p>
    </section>

    <!-- ===== Contact Section ===== -->
    <section class="contact" id="contact">
        <h2>Contact Us</h2>
        <p>Email: <a href="mailto:jebastinn2003@gmail.com">jebastinn2003@gmail.com</a></p>
        <p>Phone: <a href="tel:+916381586768">+91 6381586768</a></p>
    </section>

    <!-- ===== Footer ===== -->
    <footer>
        <p>&copy; 2025 HostelEase and Amore | All Rights Reserved</p>
    </footer>

    <script>
        function toggleMenu() {
            const nav = document.getElementById("nav-links");
            nav.classList.toggle("active");
        }
    </script>
</body>
</html>
