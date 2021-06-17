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

@WebServlet("/NBRegister")
public class NBRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String uname = request.getParameter("uname");
            String userid = request.getParameter("userid");
            String pwd = request.getParameter("pwd");
            String accno = request.getParameter("accno");
            String adhar = request.getParameter("adhar");
            String phone = request.getParameter("phone");

            Connection con = DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("select cid from account where accno=? and active='Y'");
            ps.setString(1, accno);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                ps = con.prepareStatement("select * from customer where adhar=? and phone=?");
                ps.setString(1, adhar);
                ps.setString(2, phone);
                ResultSet rs2 = ps.executeQuery();
                if (rs2.next()) {
                    ps = con.prepareStatement("insert into users(uname,userid,pwd,cid)"
                            + " values(?,?,?,?)");
                    ps.setString(1, uname);
                    ps.setString(2, userid);
                    ps.setString(3, pwd);
                    ps.setString(4,rs.getString("cid"));
                    ps.executeUpdate();
                    session.setAttribute("error", "Registration Successfully");
                    response.sendRedirect("NetBanking");
                } else {
                    session.setAttribute("error", "Invalid Adhar or Phone Number");        
                    response.sendRedirect("NetBanking");
                }

            } else {
                session.setAttribute("error", "Invalid Account Number");
                response.sendRedirect("NetBanking");
            }
            con.close();            
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
