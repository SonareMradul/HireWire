<%@ page import="java.sql.*" %>

<%

    if(session.getAttribute("user") == null ||
            !session.getAttribute("role").equals("jobseeker")) {

        response.sendRedirect("login.html");
    }

    String success =
            request.getParameter("success");

    String search =
            request.getParameter("search");

%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Job Seeker Dashboard</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">

</head>

<body>

<div class="main-layout">

    <!-- SIDEBAR -->

    <div class="sidebar">

        <div class="logo">
            HireWire
        </div>

        <a href="jobseeker_dashboard.jsp">
            Dashboard
        </a>

        <a href="help.jsp">
            Help
        </a>

        <a href="LogoutServlet">
            Logout
        </a>

    </div>

    <!-- CONTENT -->

    <div class="content">

        <!-- HERO -->

        <div class="hero">

            <h1>
                Find Your Dream Job
            </h1>

            <p>
                Explore jobs and apply instantly
            </p>

        </div>

        <%

            if(success != null) {

        %>

        <h2 class="success">
            Resume Uploaded Successfully
        </h2>

        <%

            }

        %>

        <!-- SEARCH -->

        <form method="get"
              class="search-box">

            <input type="text"
                   name="search"
                   placeholder="Search by title, company or location">

            <button type="submit">
                Search
            </button>

        </form>

        <!-- STATS -->

        <div class="stats">

            <div class="stat-card">

                <h2>50+</h2>

                <p>Available Jobs</p>

            </div>

            <div class="stat-card">

                <h2>10+</h2>

                <p>Companies</p>

            </div>

            <div class="stat-card">

                <h2>100%</h2>

                <p>Free Platform</p>

            </div>

        </div>



        <!-- RESUME UPLOAD -->
        <div class="upload-box">

            <h2>Upload Resume</h2>

            <br>

            <form action="UploadResumeServlet"
                  method="post"
                  enctype="multipart/form-data">

                <input type="file"
                       name="resume">

                <button type="submit">
                    Upload
                </button>

            </form>

        </div>
         <!-- JOBS GRID -->

        <div class="jobs-grid">

            <%

                try {

                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con =
                            DriverManager.getConnection(
                                    "jdbc:mysql://yamanote.proxy.rlwy.net:40575/railway",
                                    "root",
                                    "XXiHNjHkKEmeYjWVsElVzKcroodbOoFo"
                            );

                    String query;

                    if(search != null &&
                            !search.trim().equals("")) {

                        query =

                                "SELECT * FROM jobs " +

                                        "WHERE title LIKE ? " +

                                        "OR company LIKE ? " +

                                        "OR location LIKE ?";

                    } else {

                        query = "SELECT * FROM jobs";
                    }

                    PreparedStatement ps =
                            con.prepareStatement(query);

                    if(search != null &&
                            !search.trim().equals("")) {

                        ps.setString(1,
                                "%" + search + "%");

                        ps.setString(2,
                                "%" + search + "%");

                        ps.setString(3,
                                "%" + search + "%");
                    }

                    ResultSet rs =
                            ps.executeQuery();

                    while(rs.next()) {

            %>

            <!-- JOB CARD -->

            <div class="job-card">

                <h2>
                    <%= rs.getString("title") %>
                </h2>

                <p>

                    <strong>Company:</strong>

                    <%= rs.getString("company") %>

                </p>

                <p>

                    <strong>Location:</strong>

                    <%= rs.getString("location") %>

                </p>

                <p>

                    <strong>Salary:</strong>

                    <%= rs.getString("salary") %>

                </p>

                <p>

                    <strong>Description:</strong>

                    <%= rs.getString("description") %>

                </p>

                <%

                    String currentUser =
                            (String) session.getAttribute("user");

                    int currentJobId =
                            rs.getInt("id");

                    Connection con2 =
                            DriverManager.getConnection(
                                    "jdbc:mysql://localhost:3306/hirewire",
                                    "root",
                                    ""
                            );

                    String checkQuery =

                            "SELECT * FROM applications " +

                                    "WHERE user_email=? AND job_id=?";

                    PreparedStatement checkPs =
                            con2.prepareStatement(checkQuery);

                    checkPs.setString(1, currentUser);

                    checkPs.setInt(2, currentJobId);

                    ResultSet appliedRs =
                            checkPs.executeQuery();

                    if(appliedRs.next()) {

                %>

                <button class="applied-btn">
                    Applied
                </button>

                <%

                } else {

                %>

                <form action="ApplyJobServlet"
                      method="post">

                    <input type="hidden"
                           name="job_id"
                           value="<%= rs.getInt("id") %>">

                    <button type="submit">
                        Apply
                    </button>

                </form>

                <%

                    }

                %>

            </div>

            <%

                    }

                } catch(Exception e) {

                    out.print(e);
                }

            %>

        </div>

    </div>

</div>

</body>

</html>
