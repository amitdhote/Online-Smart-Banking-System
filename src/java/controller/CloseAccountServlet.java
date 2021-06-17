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

@WebServlet("/CloseAccount")
public class CloseAccountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {
            String accno = request.getParameter("accno");
            Connection con = DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("update account set active='N' where accno=?");
            ps.setString(1, accno);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("admin/CloseAccount");

            session.setAttribute("success", "Account Closed Successfully");
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
