package org.apache.jsp.WEB_002dINF.Views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import config.DbConfig;

public final class BankReport_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<h3 class=\"text-center border-bottom border-primary p-2\">Transaction Between Dates</h3>\n");
      out.write("<form class=\"form-inline\" style=\"justify-content: center;\">\n");
      out.write("    <label>Start Date</label>\n");
      out.write("    <input type=\"date\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.from}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"from\" class=\"form-control mx-2\">            \n");
      out.write("    <label>End Date</label>\n");
      out.write("    <input type=\"date\" name=\"to\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.to}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" class=\"form-control mx-2\">            \n");
      out.write("    <input name=\"search\" value=\"Show Me\" type=\"submit\" class=\"btn btn-primary\">            \n");
      out.write("</form>\n");

    if (request.getParameter("search") != null) {

      out.write("\n");
      out.write("<table id=\"tbl\" class=\"table table-bordered table-striped table-sm\">\n");
      out.write("    <thead class=\"table-primary\">\n");
      out.write("        <tr>\n");
      out.write("            <th>Transaction Date</th>\n");
      out.write("            <th>Account Number</th>\n");
      out.write("            <th>Particulars</th>\n");
      out.write("            <th>Dr Amount</th>\n");
      out.write("            <th>Cr Amount</th>                         \n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("        ");

            Connection con = DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("select * from trans where tdate between ? and ?");
            ps.setString(1, request.getParameter("from"));
            ps.setString(2, request.getParameter("to"));
            ResultSet rs2 = ps.executeQuery();
            while (rs2.next()) {
                int dr = rs2.getInt("dramount");
                int cr = rs2.getInt("cramount");
        
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print( DbConfig.formatDate(rs2.getString("tdate")) );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( rs2.getString("accno"));
      out.write("</td>\n");
      out.write("            <td>");
      out.print( rs2.getString("ttype"));
      out.write("</td>\n");
      out.write("            <td>");
      out.print( dr == 0 ? "" : dr);
      out.write("</td>\n");
      out.write("            <td>");
      out.print( cr == 0 ? "" : cr);
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        ");

            }
        
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("</table>\n");
 }
      out.write("\n");
      out.write("<script>\n");
      out.write("$(function(){\n");
      out.write("    $(\"#tbl\").dataTable({\n");
      out.write("        ordering:false               \n");
      out.write("    });    \n");
      out.write("});\n");
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
