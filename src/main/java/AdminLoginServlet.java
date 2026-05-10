import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminLoginServlet")

public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(email.equals("admin@gmail.com")
                && password.equals("admin123")) {

            response.sendRedirect("admin_dashboard.jsp");

        } else {

            response.getWriter().println(
                    "<h1>Invalid Admin Credentials</h1>"
            );
        }
    }
}
