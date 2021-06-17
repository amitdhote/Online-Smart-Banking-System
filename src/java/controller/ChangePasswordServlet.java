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

@WebServlet("/ChangePassProcess")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {
            String userid = request.getParameter("userid");
            String pwd = request.getParameter("pwd");
            String npwd = request.getParameter("npwd");
            String from = request.getParameter("from");

            Connection con = DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("select * from users where userid=? and pwd=?");
            ps.setString(1, userid);
            ps.setString(2, pwd);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ps = con.prepareStatement("update users set pwd=? where userid=?");
                ps.setString(2, userid);
                ps.setString(1, npwd);
                ps.executeUpdate();
                session.setAttribute("success", "Password Updated Successfully..!!");
            } else {
                session.setAttribute("error", "Invalid current password");
            }
            if(from.equals("nb")){
            response.sendRedirect("customer/NBChangePwd");
            }else{
            response.sendRedirect("admin/ChangePwd");    
            }
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
