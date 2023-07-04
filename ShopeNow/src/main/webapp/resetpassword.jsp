<%
   String checkexist = (String)session.getAttribute("mailexist");
   String email = (String)session.getAttribute("yourmail");
     if(checkexist==null){
	   session.setAttribute("msg", "fail");
	   	response.sendRedirect("index.jsp"); 
	   return;
   }
   if(!(checkexist.equals("yes"))){
	   session.setAttribute("msg", "fail");
	   	response.sendRedirect("index.jsp"); 
	   	session.removeAttribute("mailexist");
	   	session.removeAttribute("yourmail");
		return ;  
   }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopnow.com</title>
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<%@include file="component/font_style_css_js.jsp" %>
</head>
<body>
<div class="container text-center">
<div class="row justify-content-center">
<div class="col-md-6 offeset-md-3 ">
<div class="card mt-5">
<div class="card-header text-center">
 <div class="text-center">
 <img class="rounded-circle" style="width: 50px"alt="person image " src="images/person.png">
 </div>
<h3>Reset Password</h3>
</div>
<div class="card-body">
<form action="UpdatePassword" method="post">
 <input type="hidden" value=<%=email%> name="email" >
<div class="mb-3">
    <label for="password" class="form-label"><strong>Password</strong></label>
    <input type="password" name="password"  class="form-control" id="password" aria-describedby="emailHelp" required="required">
  </div>
 <div class="mb-3">
    <label for="confirmPassword" class="form-label"><strong>Confirm  Password</strong></label>
    <input type="password"  name="confirmPassword" class="form-control" id="confirmPassword" aria-describedby="emailHelp" required="required">
  </div> 
<div class="container text-center">
    <button class="btn btn-outline-success mx-3" onclick="validatePassword()">Reset Now</button>
</div>
<%
session.removeAttribute("mailexist");
session.removeAttribute("yourmail");
%>

</form>
</div>
</div>
</div>
</div>
</div>

</body>
</html>