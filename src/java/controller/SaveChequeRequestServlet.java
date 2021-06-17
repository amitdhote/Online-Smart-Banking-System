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

@WebServlet("/SaveRequest")
public class SaveChequeRequestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String tdate = request.getParameter("tdate");
            String qty = request.getParameter("qty");
            String accno = request.getParameter("accno");  
            String from=request.getParameter("from");

            Connection con = DbConfig.connect();
            PreparedStatement ps = null;
            ps = con.prepareStatement("insert into requests(rdate,accno,description,qty,status)"
                    + " values(?,?,?,?,?)");
            ps.setString(1, tdate);
            ps.setString(2, accno);
            ps.setString(3, "Cheque Request");
            ps.setString(4, qty);
            ps.setString(5, "Pending");
            ps.executeUpdate();
            con.close();
            session.setAttribute("success", "Request made Successfully");
            if(from.equalsIgnoreCase("nb")){
                response.sendRedirect("customer/NBChequebookRequest");
            }else{
                response.sendRedirect("admin/RequestChequebook?accno="+accno);
            }
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
