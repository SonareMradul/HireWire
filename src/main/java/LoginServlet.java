import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hirewire",
                    "root",
                    ""
            );

            String query =
                    "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                String role = rs.getString("role");
                HttpSession session = request.getSession();

                session.setAttribute("user", email);

                session.setAttribute("role", role);

                if(role.equals("jobseeker")) {

                    response.sendRedirect("jobseeker_dashboard.jsp");

                } else {

                    response.sendRedirect("recruiter_dashboard.jsp");
                }

            } else {

                out.println("<h1>Invalid Email or Password</h1>");
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}