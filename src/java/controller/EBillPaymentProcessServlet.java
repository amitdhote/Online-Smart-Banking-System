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

@WebServlet("/EBillPay")
public class EBillPaymentProcessServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {            
            String eaccno = request.getParameter("eaccno");
            String amount = request.getParameter("amount");
            String accno = request.getParameter("accno");            
            Connection con = DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("update account set bal=bal-? where accno=?");
            ps.setString(1, amount);
            ps.setString(2, accno);
            ps.executeUpdate();

            ps = con.prepareStatement("insert into trans(tdate,ttype,accno,dramount)"
                    + "values(current_date(),?,?,?)");            
            ps.setString(1, "Electricity Bill netbanking "+eaccno);
            ps.setString(2, accno);
            ps.setString(3, amount);
            ps.executeUpdate();          

            con.close();
            response.sendRedirect("customer/ElectricityBill");

            session.setAttribute("success", "Electricity Bill Paid Successfully");
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
