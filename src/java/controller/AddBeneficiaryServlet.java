package controller;

import config.DbConfig;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddBeneficiary")
public class AddBeneficiaryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String bname = request.getParameter("bname");
            String userid = request.getParameter("userid");
            String bank = request.getParameter("bank");
            String accno = request.getParameter("accno");
            String ifsc = request.getParameter("ifsc");
            String maxlimit = request.getParameter("maxlimit");

            Connection con = DbConfig.connect();
            PreparedStatement ps = null;
            ps = con.prepareStatement("insert into beneficiary(bname,bankname,ifsc,accno,maxlimit,userid)"
                    + " values(?,?,?,?,?,?)");
            ps.setString(1, bname);
            ps.setString(2, bank);
            ps.setString(3, ifsc);
            ps.setString(4, accno);
            ps.setString(5, maxlimit);
            ps.setString(6, userid);
            ps.executeUpdate();
            con.close();
            session.setAttribute("success", "Beneficiary Added Successfully");
            response.sendRedirect("customer/Beneficiary");

        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
