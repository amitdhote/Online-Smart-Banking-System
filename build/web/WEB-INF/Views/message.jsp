<%
    if (session.getAttribute("success") != null) {
%>
<div class="alert alert-success text-center">
    <strong><%= session.getAttribute("success")%></strong>
</div>
<%
        session.removeAttribute("success");
    }
%>
<%
    if (session.getAttribute("error") != null) {
%>
<div class="alert alert-danger text-center">
    <strong><%= session.getAttribute("error")%></strong>
</div>
<%
        session.removeAttribute("error");
    }
%>