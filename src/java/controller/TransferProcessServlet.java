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

@WebServlet("/TransferProcess")
public class TransferProcessServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {
            String tdate = request.getParameter("tdate");
            String from =request.getParameter("from");
            String amount = request.getParameter("amount");
            String accno = request.getParameter("accno");
            String recaccno = request.getParameter("recaccno");
            Connection con = DbConfig.connect();
            System.out.println("Account "+from);
            PreparedStatement ps = con.prepareStatement("update account set bal=bal-? where accno=?");
            ps.setString(1, amount);
            ps.setString(2, accno);
            ps.executeUpdate();
            String sql= null;            
            if(from.equals("nb")){
                sql="insert into trans(ttype,accno,dramount,tdate)"
                    + "values(?,?,?,current_date())";
                ps = con.prepareStatement(sql);
            }else{
                sql="insert into trans(ttype,accno,dramount,tdate)"
                    + "values(?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(4, tdate);
            }             
            System.out.println("Account "+accno);
            ps.setString(1, "Transferred to " + recaccno);
            ps.setString(2, accno);
            ps.setString(3, amount);
            ps.executeUpdate();
            System.out.println("Account "+accno);
            ps = con.prepareStatement("update account set bal=bal+? where accno=?");
            ps.setString(2, recaccno);
            ps.setString(1, amount);
            ps.executeUpdate();

            if(from.equals("nb")){
                sql="insert into trans(ttype,accno,cramount,tdate)"
                    + "values(?,?,?,current_date())";
                ps = con.prepareStatement(sql);
            }else{
                sql="insert into trans(ttype,accno,cramount,tdate)"
                    + "values(?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(4, tdate);
            }
            
            ps.setString(1, "Transferred from " + accno);
            ps.setString(2, recaccno);
            ps.setString(3, amount);
            ps.executeUpdate();

            con.close();
            if(from.equals("nb")){
                response.sendRedirect("customer/SameBank");
            }else{
                response.sendRedirect("admin/TransferAmount");    
            }
            

            session.setAttribute("success", "Amount Transferred Successfully");
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
