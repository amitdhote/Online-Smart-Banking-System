package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/customer/*")
public class NBSecurePageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //System.out.println("Path "+req.getPathInfo());
        //req.getRequestDispatcher("/WEB-INF/Views/AdminHome.jsp").forward(req, resp);
        String path = req.getPathInfo().substring(1);
        String page = String.format("/WEB-INF/Views/%s.jsp", path);
        System.out.println("Page " + path);        
        resp.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        resp.setHeader("Pragma", "no-cache");
        resp.setDateHeader("Expires", -1);
        HttpSession session=req.getSession();
        if(session.getAttribute("userid")!=null){
            req.getRequestDispatcher(page).forward(req, resp);
        }else{
            session.setAttribute("error", "Session Expired..! Login again..!!");
            resp.sendRedirect("../NetBanking");
        }
   
    }

}
