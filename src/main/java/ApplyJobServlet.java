import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ApplyJobServlet")

public class ApplyJobServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        try {

            HttpSession session =
                    request.getSession();

            String email =
                    (String) session.getAttribute("user");

            int jobId =
                    Integer.parseInt(
                            request.getParameter("job_id")
                    );

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://yamanote.proxy.rlwy.net:40575/railway",
                    "root",
                    "XXiHNjHkKEmeYjWVsElVzKcroodbOoFo"
            );

            String query =
                    "INSERT INTO applications(user_email, job_id) VALUES(?, ?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, email);

            ps.setInt(2, jobId);

            ps.executeUpdate();

            response.sendRedirect("jobseeker_dashboard.jsp");

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}
