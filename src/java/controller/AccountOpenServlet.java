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

@WebServlet("/OpenProcess")
public class AccountOpenServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String cid = request.getParameter("cid");
            String actype = request.getParameter("actype");
            String bal = request.getParameter("bal");
            String accno = DbConfig.generateAccountnumber();
            Connection con = DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("insert into account(cid,atype,bal,"
                    + "accno,active) values(?,?,?,?,'Y')");
            ps.setString(1, cid);
            ps.setString(2, actype);
            ps.setString(3, bal);
            ps.setString(4, accno);
            ps.executeUpdate();

            ps = con.prepareStatement("insert into trans(tdate,ttype,accno,cramount)"
                    + "values(current_date(),'Account Opened',?,?)");
            ps.setString(1, accno);
            ps.setString(2, bal);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("admin/OpenAccount");

            session.setAttribute("success", "Account Opened Successfully");
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
