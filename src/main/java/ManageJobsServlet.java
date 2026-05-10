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

@WebServlet("/ManageJobsServlet")

public class ManageJobsServlet
        extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out =
                response.getWriter();

        try {

            Class.forName(
                    "com.mysql.cj.jdbc.Driver"
            );

            Connection con =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/hirewire",
                            "root",
                            ""
                    );

            String query =
                    "SELECT * FROM jobs";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            out.println("<h1>All Jobs</h1>");

            out.println(
                    "<table border='1' cellpadding='10'>"
            );

            out.println(
                    "<tr>" +
                            "<th>ID</th>" +
                            "<th>Title</th>" +
                            "<th>Company</th>" +
                            "<th>Location</th>" +
                            "<th>Salary</th>" +
                            "<th>Action</th>" +
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
                                rs.getString("title") +
                                "</td>"
                );

                out.println(
                        "<td>" +
                                rs.getString("company") +
                                "</td>"
                );

                out.println(
                        "<td>" +
                                rs.getString("location") +
                                "</td>"
                );

                out.println(
                        "<td>" +
                                rs.getString("salary") +
                                "</td>"
                );

                out.println(
                        "<td>" +

                                "<a href='DeleteJobServlet?id=" +

                                rs.getInt("id") +

                                "'>" +

                                "Delete" +

                                "</a>" +

                                "</td>"
                );

                out.println("</tr>");
            }

            out.println("</table>");

        } catch(Exception e) {

            response.getWriter().println(e);
        }
    }
}
