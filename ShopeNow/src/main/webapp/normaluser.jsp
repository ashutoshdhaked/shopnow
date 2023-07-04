<%@page import="entities.UserData"%>
<%
   UserData user = (UserData)session.getAttribute("currentuser");
   if(user==null){
	   session.setAttribute("msg","fail");
	   response.sendRedirect("login.jsp");
	   return;
   }
   else{
	   if(user.getUserTyope().equals("admin")){
		   session.setAttribute("msg","fail");
		   response.sendRedirect("login.jsp");
		   return;
	   }
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
<%@include file="component/navbar.jsp" %>
<h3>normal user page</h3>
<%@include file="component/cartmodel.jsp" %>
</body>
</html>