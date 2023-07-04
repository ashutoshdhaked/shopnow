<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopnow.com </title>
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<%@include file="component/font_style_css_js.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>
<div class="container-fluid" >
<div class="row-mt-5">
<div class="col-md-5 offset-md-4" >


<div class="card my-5 bg-light shadow-lg p-3 mb-5 bg-body-tertiary rounded " >

<div  class="mt-1"><%@include file="component/message.jsp"%></div>
 <div class="card-body px-5" >
 <div class="text-center">
 <img class="rounded-circle" style="width: 100px"alt="person image " src="images/person.png">
 </div>
 
 
 <h3 class="text-center my-3">Register Here</h3>
<form action="RegisterationServlet" method="post">

<div class="mb-3">
    <label for="usename" class="form-label">Username</label>
    <input type="text" name="username" class="form-control" id="username" aria-describedby="emailHelp" required="required">
  </div>
<div class="mb-3">
    <label for="email" class="form-label">Email</label>
    <input type="email" name="email"  class="form-control" id="email" aria-describedby="emailHelp" required="required">
  </div>
 <div class="mb-3">
    <label for="password" class="form-label">Password</label>
    <input type="password"  name="password" class="form-control" id="passord" aria-describedby="emailHelp" required="required">
  </div> 
<div class="mb-3">
    <label for="phone" class="form-label">Phone Number</label>
    <input type="text"  name="phone" class="form-control" id="phone" aria-describedby="emailHelp" required="required">
  </div>
 <div class="mb-3">
    <label for="address" class="form-label">Address</label>
    <textarea rows="5"  name="address" cols="50" id="address" placeholder="enter address here" class="form-control" aria-describedby="emailHelp" required="required"></textarea>
  </div> 
 <div class="mb-3">
   <p>select user type </p>
   <input class="form-check-input" type="radio" name="usertype" id="radioNoLabel1" value="admin" aria-label="..." required="required" > 
  <label class="form-check-label" for="radioNoLabel1"> Admin</label>
  <input class="form-check-input" type="radio" name="usertype" id="radioNoLabel1" value="normal" aria-label="..." required="required">
  <label class="form-check-label" for="radioNoLabel1"> Normal</label>
</div> 
  <div class="container text-center">
    <button class="btn btn-outline-success mx-3">Register</button>
    <button class="btn btn-outline-warning">Clear</button>
  </div>
   
</form>
 
 </div>
</div>
</div>
</div>

</div>

</body>
</html>