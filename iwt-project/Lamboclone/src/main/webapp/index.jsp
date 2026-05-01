<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lamborghini Clone - Home</title>

    <!-- Navbar Font -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="style.css">
    <script src="script.js" defer></script>
</head>
<body>

<header>
    <div class="logo">
        <img src="images/lambologo.png" alt="Lamborghini">
    </div>
    <nav>
        <a href="index.jsp" class="active">Home</a>
        <a href="models.jsp">Models</a>
        <a href="history.jsp">History</a>
        <a href="contact.jsp">Contact</a>
    </nav>
</header>

<section class="hero">
    <video autoplay muted loop id="bgVideo">
        <source src="videos/cars-video.mp4" type="video/mp4">
    </video>
    <div class="hero-text">
        <h1>INSPIRING FUTURE SINCE 1963</h1>
        <h2>DRIVEN BY DREAMS</h2>
        <button onclick="discoverMore()">DISCOVER MORE →</button>
    </div>
</section>

<section class="event-section">
    <div class="event-content">
        <h1>JOIN THE EVENT</h1>
        <p>
            ON MAY 9 AND 10, 2026, AUTOMOBILI LAMBORGHINI BRINGS ARENA BACK 
            TO THE AUTODROMO DI IMOLA FOR ITS SECOND EDITION.
        </p>
        <button class="event-btn">TICKETS →</button>
    </div>
</section>

<!-- MOTORSPORT NEWS -->
<section class="motorsport-news">
    <h1>MOTORSPORT NEWS</h1>
    <div class="news-grid">

        <div class="news-card">
            <img src="images/news1.jfif" alt="Motorsport Race">
            <div class="news-info">
                <span class="date">14 April 2026</span>
                <h2>Lamborghini Super Trofeo Europe: Gilardoni-Iaquinta and Strignano-Pujatti Split the Wins as 2026 Season Kicks Off at Paul Ricard</h2>
            </div>
        </div>

        <div class="news-card">
            <img src="images/news2.jpeg" alt="GT3 Debut">
            <div class="news-info">
                <span class="date">10 April 2026</span>
                <h2>Lamborghini Temerario GT3 to Make European Debut in GTWC Opener</h2>
            </div>
        </div>

        <div class="news-card">
            <img src="images/news3.jfif" alt="Paul Ricard">
            <div class="news-info">
                <span class="date">7 April 2026</span>
                <h2>Lamborghini Super Trofeo Europe: Paul Ricard to Kick Off 2026 Season</h2>
            </div>
        </div>

    </div>
</section>


<section class="museum-section">
    <div class="museum-overlay">
        <h1>AUTOMOBILI LAMBORGHINI MUSEUM</h1>
        <p>Discover the legacy of Lamborghini through iconic models and artistic presentations.</p>
    </div>
    <div class="museum-slider">
        <div class="museum-slide">
            <img src="images/museum1.avif" alt="Lamborghini Museum Car">
        </div>
        <div class="museum-slide">
            <img src="images/museum2" alt="Classic Lamborghini Miura">
        </div>
        <div class="museum-slide">
            <img src="images/museum3.avif" alt="Exploded Lamborghini Artwork">
        </div>
    </div>
</section>

<footer>
    <p>&copy; 2026 Lamborghini Clone | Designed for learning</p>
</footer>

</body>
</html>
