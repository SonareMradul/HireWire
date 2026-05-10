import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ManageUsersServlet")

public class ManageUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hirewire",
                    "root",
                    ""
            );

            String query = "SELECT * FROM users";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            out.println("<html>");
            out.println("<head>");

            out.println(
                    "<link rel='stylesheet' href='css/style.css'>"
            );

            out.println("</head>");

            out.println("<body>");

            out.println("<div class='content'>");

            out.println("<h1>All Users</h1>");

            out.println("<div class='table-container'>");

            out.println(
                    "<table border='1' cellpadding='10'>"
            );

            out.println(
                    "<tr>" +
                            "<th>ID</th>" +
                            "<th>Name</th>" +
                            "<th>Email</th>" +
                            "<th>Role</th>" +
                            "<th>Action</th>"+
                            "</tr>"
            );

            while(rs.next()) {

                out.println("<tr>");

                out.println(
                        "<td>" +
                                rs.getInt("id") +
                                "</td>"
                );

                out.println(
                        "<td>" +
                                rs.getString("name") +
                                "</td>"
                );

                out.println(
                        "<td>" +
                                rs.getString("email") +
                                "</td>"
                );

                out.println(
                        "<td>" +
                                rs.getString("role") +
                                "</td>"
                );

                out.println("<td>");

                out.println(
                        "<a class='delete-btn' href='DeleteUserServlet?id="
                                + rs.getInt("id")
                                + "'>Delete</a>"
                );

                out.println("</td>");

                out.println("</tr>");
            }

            out.println("</table>");

            out.println("</div>");

            out.println("</div>");

            out.println("</body>");

            out.println("</html>");

        } catch (Exception e) {

            response.getWriter().println(e);
        }
    }
}