<jsp:include page="nbheader.jsp" />
<h2 class="text-center m-2">Change Password</h2>
<div class="row">
    <div class="col-5 mx-auto">
        <jsp:include page="message.jsp" />                                        
        <form method="post" action="../ChangePassProcess">
            <input type="hidden" name="userid" value="${sessionScope.userid}">
            <input type="hidden" name="from" value="nb">
            <div class="form-group">
                <label>Current Password</label>
                <input type="password" required name="pwd" class="form-control"
                       placeholder="Current Password">
            </div>
            <div class="form-group">
                <label>New Password</label>
                <input type="password" required name="npwd" class="form-control"
                       placeholder="Current Password">
            </div>
            <div class="form-group">
                <label>Confirm Password</label>
                <input type="password" required name="cpwd" class="form-control"
                       placeholder="Current Password">
            </div>
            <input type="submit" value="Change Password" class="btn btn-primary btn-block">
        </form>            
    </div>
</div>
<jsp:include page="footer.jsp" />