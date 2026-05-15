<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <title>HireWire Help Center</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family: Arial, sans-serif;
        }

        body{
            background:#f4f7fb;
        }

        .navbar{
            background:#0f172a;
            color:white;
            padding:18px 40px;
            display:flex;
            justify-content:space-between;
            align-items:center;
        }

        .navbar h2{
            color:#38bdf8;
        }

        .hero{
            text-align:center;
            padding:60px 20px;
            background:linear-gradient(to right,#2563eb,#1e3a8a);
            color:white;
        }

        .hero h1{
            font-size:48px;
            margin-bottom:15px;
        }

        .hero p{
            font-size:18px;
        }

        .container{
            width:85%;
            margin:auto;
            padding:40px 0;
        }

        .cards{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
            gap:25px;
        }

        .card{
            background:white;
            padding:25px;
            border-radius:15px;
            box-shadow:0 5px 15px rgba(0,0,0,0.1);
            transition:0.3s;
        }

        .card:hover{
            transform:translateY(-5px);
        }

        .card h3{
            color:#2563eb;
            margin-bottom:10px;
        }

        .footer{
            background:#0f172a;
            color:white;
            text-align:center;
            padding:20px;
            margin-top:40px;
        }

        .time{
            margin-top:15px;
            font-size:16px;
            opacity:0.9;
        }

    </style>
</head>

<body>

<div class="navbar">
    <h2>HireWire</h2>
    <div>Help Center</div>
</div>

<div class="hero">
    <h1>How Can We Help You?</h1>
    <p>Support for Jobseekers, Recruiters and Admins</p>

    <div class="time">
        Current Time:
        <%= new Date() %>
    </div>
</div>

<div class="container">

    <div class="cards">

        <div class="card">
            <h3>Jobseeker Help</h3>
            <p>
                Learn how to apply for jobs,
                upload resumes and track applications.
            </p>
        </div>

        <div class="card">
            <h3>Recruiter Support</h3>
            <p>
                Post jobs, manage candidates
                and track hiring activities.
            </p>
        </div>

        <div class="card">
            <h3>Admin Assistance</h3>
            <p>
                Monitor users, activities
                and maintain the platform.
            </p>
        </div>

    </div>

</div>

<div class="footer">
    © 2026 HireWire | All Rights Reserved
</div>

</body>
</html>