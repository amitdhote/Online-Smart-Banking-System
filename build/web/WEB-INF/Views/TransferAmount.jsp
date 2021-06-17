<jsp:include page="header.jsp" />
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DbConfig"%>
<%@page import="java.sql.Connection"%>
<h3 class="text-center m-2 border-bottom p-2">Transfer Amount</h3>
<jsp:include page="message.jsp" />
<jsp:include page="searchsection.jsp" />
<div class="row">
    <div class="col-8 mx-auto">
        <%
            if (request.getParameter("accno") != null) {
                String accno = request.getParameter("accno");
                Connection con = DbConfig.connect();
                final String sql = "select * from account a inner join customer c on a.cid=c.id where accno=? and active='Y'";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, accno);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
        %>            
        <div class="alert alert-success text-center">
            <strong>Account Number Found</strong>                
        </div>
        <table class="table table-bordered">
            <tr>
                <th>Account Number</th>
                <th><%= rs.getString("accno")%></th>
                <th>Customer Name</th>
                <th><%= rs.getString("cname")%></th>
            </tr>
            <tr class="table-success">
                <th>Account Type</th>
                <th><%= rs.getString("atype")%></th>
                <th>Balance Available</th>
                <th>&#8377; <%= rs.getString("bal")%></th>
            </tr>            
        </table>   
        <form method="post" action="../TransferProcess">
            <input type="hidden" name="accno" value="<%= rs.getString("accno")%>" >
            <input type="hidden" name="from" value="bank">
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label>Receiver Account Number</label>
                        <input type="text" id="recaccno" name="recaccno" class="form-control">
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label>Receiver Name</label>
                        <input type="text" id="recname" readonly class="form-control">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label>Transaction Date</label>
                        <input type="date" id="tdate" name="tdate" class="form-control">
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label>Transfer Amount</label>
                        <input type="number" min="1" name="amount" class="form-control">
                    </div>
                </div>
            </div>
            <button id="transfer" disabled class="btn btn-primary float-right">Transfer Now</button>
        </form>
        <%
        } else {
        %>
        <div class="alert alert-danger text-center">
            <strong>Invalid Account Number</strong>
        </div>
        <%
                }
            }
        %>

    </div>
</div>
<script>
    document.getElementById("tdate").valueAsDate = new Date();
    $("#recaccno").blur(function(){
       //alert(this.value); 
       $.post("../CheckName",{"accno":this.value},function(output){
          console.log(output);
           if(output.trim()==="no"){
               $("#transfer").attr("disabled","disabled");
               $("#recaccno").css({'border':'2px solid red'});
           }else{
               $("#transfer").removeAttr("disabled");  
               $("#recname").val(output); 
               $("#recaccno").css({'border':'2px solid green'});
           }
          
       });
    });
</script>
<jsp:include page="footer.jsp" />