<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
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

        <a href="admin_dashboard.jsp">
            Dashboard
        </a>

        <a href="ManageUsersServlet">
            Manage Users
        </a>

        <a href="ManageJobsServlet">
            Manage Jobs
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
                Admin Dashboard
            </h1>

            <p>
                Manage users, jobs and platform activity
            </p>

        </div>

        <!-- STATS -->

        <div class="stats">

            <div class="stat-card">

                <h2>
                    500+
                </h2>

                <p>
                    Registered Users
                </p>

            </div>

            <div class="stat-card">

                <h2>
                    100+
                </h2>

                <p>
                    Active Jobs
                </p>

            </div>

            <div class="stat-card">

                <h2>
                    50+
                </h2>

                <p>
                    Recruiters
                </p>

            </div>

        </div>

        <!-- ADMIN ACTIONS -->

        <div class="jobs-grid">

            <div class="job-card">

                <h2>
                    Manage Users
                </h2>

                <p>
                    View, monitor and manage all registered users.
                </p>

                <br>

                <a href="ManageUsersServlet">

                    <button>
                        Open Users Panel
                    </button>

                </a>

            </div>

            <div class="job-card">

                <h2>
                    Manage Jobs
                </h2>

                <p>
                    View and control all posted job listings.
                </p>

                <br>

                <a href="ManageJobsServlet">

                    <button>
                        Open Jobs Panel
                    </button>

                </a>

            </div>

        </div>

    </div>

</div>

</body>
</html>