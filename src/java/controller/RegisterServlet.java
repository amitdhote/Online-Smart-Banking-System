package controller;

import config.DbConfig;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/RegisterProcess")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String cname = request.getParameter("cname");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String adhar = request.getParameter("adhar");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String picname=DbConfig.generatePicID()+".jpg";
            String signpic=DbConfig.generateSignID()+".jpg";
            Part pic=request.getPart("pic");
            Part sign=request.getPart("signature");

            String path=getServletContext().getRealPath("/cpics/");
            Files.copy(pic.getInputStream(), Paths.get(path, picname), StandardCopyOption.REPLACE_EXISTING);
            path=getServletContext().getRealPath("/csign/");
            Files.copy(sign.getInputStream(), Paths.get(path, signpic), StandardCopyOption.REPLACE_EXISTING);
            
            Connection con = DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("insert into customer(cname,address,gender,dob,"
                    + "adhar,phone,email,pic,signature) values(?,?,?,?,?,?,?,?,?)");

            ps.setString(1, cname);
            ps.setString(2, address);
            ps.setString(3, gender);
            ps.setString(4, dob);
            ps.setString(5, adhar);
            ps.setString(6, phone);
            ps.setString(7, email);
            ps.setString(8, picname);
            ps.setString(9, signpic);

            ps.executeUpdate();
            session.setAttribute("success", "Customer Registration Successfully");
            if (request.getParameter("from").equals("bank")) {
                response.sendRedirect("admin/AddCustomer");
            } else {
                response.sendRedirect("Register");
            }
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

}
