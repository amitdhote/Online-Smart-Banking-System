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

@WebServlet("/CheckName")
public class CheckNameServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {
            String accno = request.getParameter("accno");
            Connection con = DbConfig.connect();
            final String sql = "select cname from customer where id="
                    + "(select cid from account where accno=?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, accno);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                response.getWriter().println(rs.getString("cname"));
            } else {
                response.getWriter().println("no");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
