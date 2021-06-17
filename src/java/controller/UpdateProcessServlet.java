package controller;

import config.DbConfig;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/UpdateProcess")
@MultipartConfig
public class UpdateProcessServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String cname = request.getParameter("cname");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");
            String adhar = request.getParameter("adhar");
            String phone = request.getParameter("phone");
            String cid = request.getParameter("cid");
            
            Part sign = request.getPart("sign");
            Part pic = request.getPart("pic");
            System.out.println("sign "+sign.getSubmittedFileName());            
            String picname = "Pic" + cid + ".jpg";
            String signpic = "Sign" + cid + ".jpg";
            if (pic.getSubmittedFileName().length()>1) {                
                String cpath = getServletContext().getRealPath("/cpics/");
                pic.write(cpath + picname);
                System.out.println("Hello "+pic);
            }
                        
            
            if (sign.getSubmittedFileName().length()>1) {                
                String path = getServletContext().getRealPath("/csign/");
                sign.write(path + signpic);
                System.out.println("Sign "+sign.getSubmittedFileName());
            }
            Connection con = DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("update customer set cname=?,address=?,gender=?,email=?,"
                    + "adhar=?,phone=?,pic=?,signature=? where id=?");

            ps.setString(1, cname);
            ps.setString(2, address);
            ps.setString(3, gender);
            ps.setString(4, email);
            ps.setString(5, adhar);
            ps.setString(6, phone);
            ps.setString(7, picname);
            ps.setString(8, signpic);
            ps.setString(9, cid);

            ps.executeUpdate();
            session.setAttribute("success", "Information Updated Successfully");
            response.sendRedirect("admin/EditCustomer");
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
