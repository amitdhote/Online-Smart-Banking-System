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

@WebServlet("/ProcessReq")
public class ProcessRequestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String rid = request.getParameter("rid");
            String op = request.getParameter("op");
                

            Connection con = DbConfig.connect();
            PreparedStatement ps = null;
            ps = con.prepareStatement("update requests set status=? where rid=?");
            ps.setString(1, op.equalsIgnoreCase("Y") ? "Confirm":"Cancelled");
            ps.setString(2, rid);            
            ps.executeUpdate();
            con.close();
            session.setAttribute("success", "Request updated Successfully");
            response.sendRedirect("admin/ProcessRequest");

        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
