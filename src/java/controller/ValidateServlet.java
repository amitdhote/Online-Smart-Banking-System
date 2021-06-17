package controller;

import config.DbConfig;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Validate")
public class ValidateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {
            String userid = request.getParameter("userid");
            String pwd = request.getParameter("pwd");
            Connection con = DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("SELECT * from users where userid=? and pwd=?");
            ps.setString(1, userid);
            ps.setString(2, pwd);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                session.setAttribute("userid", userid);
                response.sendRedirect("admin/AdminHome");
            } else {
                session.setAttribute("error", "Invalid username or password");
                response.sendRedirect("Login");
            }
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
