<%
  if(session.getAttribute("cid")!=null){
    session.invalidate();    
    response.sendRedirect("../NetBanking");
  }else{
      session.invalidate();
      response.sendRedirect("../Login");
  }
  
  
%>