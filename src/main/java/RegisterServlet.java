import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://yamanote.proxy.rlwy.net:40575/railway",
                    "root",
                    "XXiHNjHkKEmeYjWVsElVzKcroodbOoFo"
            );

            String query =
                    "INSERT INTO users(name,email,password,role) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, role);

            int rows = ps.executeUpdate();

            if(rows > 0) {
                out.println("<h1>Registration Successful</h1>");
            }
            else {
                out.println("<h1>Registration Failed</h1>");
            }

            con.close();

        } catch(Exception e) {

            out.println(e);

        }
    }
}