<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %> <!-- ADDED -->
<!DOCTYPE html>
<html>
<head>
    <title>Lamborghini Register</title>

    <!-- Premium Font -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to bottom, #000, #111);
            color: #fff;
            font-family: 'Montserrat', sans-serif;
            text-align: center;
            margin: 0;
            padding-top: 120px;
        }

        .logo1 {
            position: absolute;
            top: 20px;
            left: 30px;
        }

        .logo1 img {
            height: 45px;
            transition: 0.3s;
            cursor: pointer;
        }

        .logo1 img:hover {
            transform: scale(1.1);
        }

        h2 {
            font-weight: 600;
            letter-spacing: 2px;
            margin-bottom: 30px;
        }

        form {
            background: rgba(255,255,255,0.05);
            display: inline-block;
            padding: 30px 40px;
            border-radius: 12px;
            backdrop-filter: blur(10px);
        }

        input {
            padding: 12px;
            margin: 12px;
            width: 260px;
            border-radius: 6px;
            border: 1px solid #333;
            background: #111;
            color: #fff;
            font-size: 14px;
            transition: 0.3s;
        }

        input:focus {
            border-color: #fdd835;
            outline: none;
        }

        button {
            padding: 12px 25px;
            background: #fdd835;
            color: #000;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            letter-spacing: 1px;
            transition: 0.3s;
        }

        button:hover {
            background: #ffc107;
        }

        .msg {
            margin-top: 20px;
            font-size: 14px;
        }
    </style>

    <!-- 🔥 ADDED JS VALIDATION -->
    <script>
        function validateForm() {
            let pass = document.forms[0]["password"].value;
            let confirm = document.forms[0]["confirm_password"].value;

            // Password pattern: 8+, uppercase, lowercase, number, symbol
            let pattern = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&*!]).{8,}$/;

            if (!pattern.test(pass)) {
                alert("Password must be at least 8 characters with uppercase, lowercase, number, and special symbol.");
                return false;
            }

            if (pass !== confirm) {
                alert("Passwords do not match!");
                return false;
            }

            return true;
        }
    </script>

</head>

<body>

<div class="logo1">
    <a href="index.html">
        <img src="images/lambologo.png" alt="Lamborghini" width="70" height="35">
    </a>
</div>

<h2>Lamborghini Owner Registration</h2>

<!-- 🔥 ADDED onsubmit -->
<form method="post" onsubmit="return validateForm()">
    <input type="text" name="name" placeholder="Enter Name" required><br>
    <input type="email" name="email" placeholder="Enter Email" required><br>
    <input type="password" name="password" placeholder="Enter Password" required><br>

    <!-- 🔥 ADDED CONFIRM PASSWORD -->
    <input type="password" name="confirm_password" placeholder="Confirm Password" required><br>

    <button type="submit">Register</button>
</form>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String pass = request.getParameter("password");
String confirm = request.getParameter("confirm_password"); // ADDED

if(name != null && email != null && pass != null && confirm != null) {

    // 🔥 SERVER SIDE CHECK
    if(!pass.equals(confirm)) {
%>
        <div class="msg" style="color:red;">Passwords do not match!</div>
<%
    } else {
    try {
        Class.forName("org.postgresql.Driver");

        // 🔥 PASSWORD ENCRYPTION (SHA-256)
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(pass.getBytes());
        byte[] bytes = md.digest();

        StringBuilder sb = new StringBuilder();
        for(byte b : bytes) {
            sb.append(String.format("%02x", b));
        }

        String encryptedPassword = sb.toString(); // hashed password

        Connection con = DriverManager.getConnection(
            "jdbc:postgresql://192.168.1.17:5432/cse_db24",
            "24bcsg21",
            "24bcsg21"
        );

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO lambo (name, email, password) VALUES (?, ?, ?)"
        );

        ps.setString(1, name);
        ps.setString(2, email);

        // 🔥 STORE ENCRYPTED PASSWORD
        ps.setString(3, encryptedPassword);

        int i = ps.executeUpdate();

        if(i > 0) {
%>
            <div class="msg" style="color:lightgreen;">Registration Successful </div>
<%
        } else {
%>
            <div class="msg" style="color:red;">Registration Failed</div>
<%
        }

        con.close();

    } catch(Exception e) {
%>
        <div class="msg" style="color:red;">Error: <%= e.getMessage() %></div>
<%
    }
    }
}
%>

</body>
</html>