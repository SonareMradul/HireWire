<%@ page import="java.sql.*" %>

<%

    if(session.getAttribute("user") == null ||
            !session.getAttribute("role").equals("recruiter")) {

        response.sendRedirect("login.html");
    }

%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Recruiter Dashboard</title>

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

        <a href="recruiter_dashboard.jsp">
            Dashboard
        </a>

        <a href="ViewJobs.html">
            View Jobs
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
                Recruiter Dashboard
            </h1>

            <p>
                Post jobs and manage applicants easily
            </p>

        </div>

        <!-- STATS -->

        <div class="stats">

            <div class="stat-card">

                <h2>20+</h2>

                <p>
                    Active Jobs
                </p>

            </div>

            <div class="stat-card">

                <h2>100+</h2>

                <p>
                    Applications
                </p>

            </div>

            <div class="stat-card">

                <h2>10+</h2>

                <p>
                    Hiring Companies
                </p>

            </div>

        </div>

        <!-- POST JOB FORM -->

        <div class="upload-box">

            <h2>
                Post New Job
            </h2>

            <br>

            <form action="PostJobServlet"
                  method="post">

                <input type="text"
                       name="title"
                       placeholder="Job Title"
                       class="form-input">

                <br><br>

                <input type="text"
                       name="company"
                       placeholder="Company"
                       class="form-input">

                <br><br>

                <input type="text"
                       name="location"
                       placeholder="Location"
                       class="form-input">

                <br><br>

                <input type="text"
                       name="salary"
                       placeholder="Salary"
                       class="form-input">

                <br><br>

                <textarea name="description"
                          placeholder="Description"
                          class="form-input"
                          rows="5"></textarea>

                <br><br>

                <button type="submit">
                    Post Job
                </button>

            </form>

        </div>

        <!-- APPLICANTS -->

        <h1 style="margin-bottom:20px;">
            Applicants
        </h1>

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

                    String query =

                            "SELECT applications.user_email, " +

                                    "applications.status, " +

                                    "jobs.title " +

                                    "FROM applications " +

                                    "JOIN jobs " +

                                    "ON applications.job_id = jobs.id";

                    PreparedStatement ps =
                            con.prepareStatement(query);

                    ResultSet rs =
                            ps.executeQuery();

                    while(rs.next()) {

            %>

            <!-- APPLICANT CARD -->

            <div class="job-card">

                <h2>
                    <%= rs.getString("title") %>
                </h2>

                <p>

                    <strong>Applicant:</strong>

                    <%= rs.getString("user_email") %>

                </p>

                <p>

                    <strong>Status:</strong>

                    <%= rs.getString("status") %>

                </p>

                <br>

                <form action="UpdateStatusServlet"
                      method="post">

                    <input type="hidden"
                           name="email"
                           value="<%= rs.getString("user_email") %>">

                    <input type="hidden"
                           name="job"
                           value="<%= rs.getString("title") %>">

                    <button type="submit"
                            name="status"
                            value="Accepted">

                        Accept

                    </button>

                    <button type="submit"
                            name="status"
                            value="Rejected"
                            style="background:#dc2626; margin-left:10px;">

                        Reject

                    </button>

                </form>

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