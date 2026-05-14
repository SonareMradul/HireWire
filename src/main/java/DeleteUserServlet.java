import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteUserServlet")

public class DeleteUserServlet
        extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(
                    request.getParameter("id")
            );

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con =
                    DriverManager.getConnection(
                            "jdbc:mysql://yamanote.proxy.rlwy.net:40575/railway",
                            "root",
                            "XXiHNjHkKEmeYjWVsElVzKcroodbOoFo"
                    );

            String query =
                    "DELETE FROM users WHERE id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, id);

            ps.executeUpdate();

            response.sendRedirect(
                    "ManageUsersServlet"
            );

        } catch(Exception e) {

            response.getWriter().println(e);
        }
    }
}
