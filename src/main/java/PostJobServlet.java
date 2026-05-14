import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PostJobServlet")

public class PostJobServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        String title = request.getParameter("title");

        String company = request.getParameter("company");

        String location = request.getParameter("location");

        String salary = request.getParameter("salary");

        String description =
                request.getParameter("description");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://yamanote.proxy.rlwy.net:40575/railway",
                    "root",
                    "XXiHNjHkKEmeYjWVsElVzKcroodbOoFo"
            );

            String query =
                    "INSERT INTO jobs(title,company,location,salary,description) VALUES(?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, title);

            ps.setString(2, company);

            ps.setString(3, location);

            ps.setString(4, salary);

            ps.setString(5, description);

            ps.executeUpdate();

            response.sendRedirect("recruiter_dashboard.jsp");

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
