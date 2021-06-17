<%@page import="config.DbConfig"%>
<jsp:include page="nbheader.jsp" />

<h3 class="text-center border-bottom border-primary p-2">Same Bank Transfer</h3>
<div class="row">
    <div class="col-sm-6 mx-auto">        
        <form method="post" action="../TransferProcess">
            <%
                String accno=DbConfig
                        .findAccountByCustID(session.getAttribute("cid").toString());
                %>
            <input type="hidden" name="accno" value="<%= accno %>" >
            <input type="hidden" name="from" value="nb" >
            <div class="form-group">
                <label>Receiver Account Number</label>
                <input type="text" id="recaccno" name="recaccno" class="form-control">
            </div>
            <div class="form-group">
                <label>Receiver Name</label>
                <input type="text" id="recname" readonly class="form-control">
            </div>
            <div class="form-group">
                <label>Available Balance</label>
                <input type="text" id="recname" value="<%= DbConfig.findAccountBalance(accno) %>" readonly class="form-control">
            </div>
            <div class="form-group">
                <label>Transfer Amount</label>
                <input type="number" min="1" name="amount" class="form-control">
            </div>
            <button id="transfer" disabled class="btn btn-primary float-right">Transfer Now</button>
        </form>
    </div>
</div>
<script>
    $("#recaccno").blur(function () {
        //alert(this.value); 
        $.post("../CheckName", {"accno": this.value}, function (output) {
            console.log(output);
            if (output.trim() === "no") {
                $("#transfer").attr("disabled", "disabled");
                $("#recaccno").css({'border': '2px solid red'});
            } else {
                $("#transfer").removeAttr("disabled");
                $("#recname").val(output);
                $("#recaccno").css({'border': '2px solid green'});
            }

        });
    });
</script>
<jsp:include page="message.jsp" />