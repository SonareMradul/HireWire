import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/UploadResumeServlet")

@MultipartConfig

public class UploadResumeServlet
        extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession();

            String email =
                    (String) session.getAttribute("user");

            Part filePart =
                    request.getPart("resume");

            String fileName =
                    filePart.getSubmittedFileName();
            System.out.println(fileName);

            String uploadPath =
                    getServletContext()
                            .getRealPath("") +
                            "uploads" + File.separator +
                            fileName;

            filePart.write(uploadPath);
            System.out.println(uploadPath);

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/hirewire",
                            "root",
                            ""
                    );

            String query =
                    "UPDATE users SET resume=? WHERE email=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, fileName);

            ps.setString(2, email);

            ps.executeUpdate();
            System.out.println("Resume Uploaded");

            response.sendRedirect(
                    "jobseeker_dashboard.jsp?success=1"
            );

        } catch(Exception e) {

            response.setContentType("text/html");

            PrintWriter out = response.getWriter();

            e.printStackTrace(out);
        }
    }
}
