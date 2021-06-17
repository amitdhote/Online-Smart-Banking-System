package org.apache.jsp.WEB_002dINF.Views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import config.DbConfig;
import java.sql.Connection;

public final class CheckDeposit_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<h3 class=\"text-center m-2 border-bottom p-2\">Check Deposit Module</h3>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "message.jsp", out, false);
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "searchsection.jsp", out, false);
      out.write("\n");
      out.write("<div class=\"row\">\n");
      out.write("    <div class=\"col-8 mx-auto\">\n");
      out.write("        ");

            if (request.getParameter("accno") != null) {
                String accno = request.getParameter("accno");
                Connection con = DbConfig.connect();
                final String sql = "select * from account a inner join customer c "
                        + "on a.cid=c.id where accno=? and active='Y'";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, accno);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
        
      out.write("            \n");
      out.write("        <table class=\"table table-bordered\">\n");
      out.write("            <tr>\n");
      out.write("                <th>Account Number</th>\n");
      out.write("                <th>");
      out.print( rs.getString("accno"));
      out.write("</th>\n");
      out.write("                <th>Customer Name</th>\n");
      out.write("                <th>");
      out.print( rs.getString("cname"));
      out.write("</th>\n");
      out.write("            </tr>\n");
      out.write("            <tr class=\"table-success\">\n");
      out.write("                <th>Account Type</th>\n");
      out.write("                <th>");
      out.print( rs.getString("atype"));
      out.write("</th>\n");
      out.write("                <th>Balance Available</th>\n");
      out.write("                <th>&#8377; ");
      out.print( rs.getString("bal"));
      out.write("</th>\n");
      out.write("            </tr>            \n");
      out.write("        </table>\n");
      out.write("            <form method=\"post\" action=\"../CheckDepositProcess\">\n");
      out.write("            <input type=\"hidden\" name=\"accno\" value=\"");
      out.print( rs.getString("accno") );
      out.write("\" >\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-6\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label>Transaction Date</label>\n");
      out.write("                        <input type=\"date\" id=\"tdate\" name=\"tdate\" class=\"form-control\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-6\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label>Check Bank Name</label>\n");
      out.write("                        <input type=\"text\" name=\"bank\" class=\"form-control\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-6\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label>Check Number</label>\n");
      out.write("                        <input type=\"number\" pattern=\"[0-9]{6,6}\" name=\"chkno\" class=\"form-control\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-6\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label>Check Amount</label>\n");
      out.write("                        <input type=\"number\" min=\"1\" name=\"amount\" class=\"form-control\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <button class=\"btn btn-primary float-right\">Deposit</button>\n");
      out.write("        </form>\n");
      out.write("        ");

        } else {
        
      out.write("\n");
      out.write("        <div class=\"alert alert-danger text-center\">\n");
      out.write("            <strong>Invalid Account Number</strong>\n");
      out.write("        </div>\n");
      out.write("        ");

                }
            }
        
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<script>\n");
      out.write("    document.getElementById(\"tdate\").valueAsDate=new Date();\n");
      out.write("</script>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
