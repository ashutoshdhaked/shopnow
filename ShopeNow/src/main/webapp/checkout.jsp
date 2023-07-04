<%
UserData user = (UserData)session.getAttribute("currentuser");
if(user==null){
	   session.setAttribute("msg","please login before checkout");
	   response.sendRedirect("login.jsp");
	   return;
}



%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopnow.com</title>
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<%@include file="component/font_style_css_js.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>
<div class="container">

<div class="row mt-5">
<div class="col-md-6">
  <!-- cart details -->
  <div class="card">
  <h2 class="custom-bg text-white text-center p-3">Your selected items</h2>
   <div class="card-body">
   <div class="cart-body">

     </div>
   
   </div>
  </div>
</div>
<div class="col-md-6">
<!-- form details -->
  <div class="card">
  <h2 class="custom-bg text-white text-center p-3">Your details for order</h2>
   <div class="card-body">
   <form action="" method="post"> 
   <div class="mb-3">
    <label for="name" class="form-label">Name</label>
    <input value="<%=user.getUserName()%>"type="text" name="name" class="form-control" id="name" aria-describedby="emailHelp" required="required">
  </div>
<div class="mb-3">
    <label for="email" class="form-label">Email</label>
    <input value="<%=user.getUserEmail()%>" type="email" name="email"  class="form-control" id="email" aria-describedby="emailHelp" required="required">
  </div> 
<div class="mb-3">
    <label for="phone" class="form-label">Phone Number</label>
    <input value="<%=user.getUserPhone()%>"  type=" text"  name="phone" class="form-control" id="phone" aria-describedby="emailHelp" required="required">
  </div>
 <div class="mb-3">
    <label for="address" class="form-label">Address</label>
    <textarea value="<%=user.getUserAddress()%>" rows="5"  name="address" cols="50" id="address" placeholder="enter address here" class="form-control" aria-describedby="emailHelp" required="required"></textarea>
  </div> 
   <div class="container text-center">
   <button class="btn btn-outline-success m-2">Order Now</button>
   <button class="btn btn-outline-secondary m-2" ><a href="index.jsp" style="text-decoration:none;">Shop More</a></button>
   </div>
   
   
   </form>
   </div>
  </div>
</div>
</div>
</div>
<%@include file="component/cartmodel.jsp" %>
</body>
</html>