import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStatusServlet")

public class UpdateStatusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        String email =
                request.getParameter("email");

        String job =
                request.getParameter("job");

        String status =
                request.getParameter("status");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/hirewire",
                            "root",
                            ""
                    );

            String query =

                    "UPDATE applications " +

                            "SET status=? " +

                            "WHERE user_email=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, status);

            ps.setString(2, email);

            ps.executeUpdate();

            response.sendRedirect(
                    "recruiter_dashboard.jsp"
            );

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}
