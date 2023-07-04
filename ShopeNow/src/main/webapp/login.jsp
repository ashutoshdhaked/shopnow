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
<div class="container text-center">
<div class="row justify-content-center">
<div class="col-md-6 offeset-md-3 ">
<div class="card mt-5">
<div  class="mt-1"><%@include file="component/message.jsp" %></div>
<div class="card-header text-center">
 <div class="text-center">
 <img class="rounded-circle" style="width: 50px"alt="person image " src="images/person.png">
 </div>
<h3>Login Here</h3>
</div>
<div class="card-body">
<form action="LoginServlet" method="post">
<div class="mb-3">
    <label for="email" class="form-label"><strong>Email</strong></label>
    <input type="email" name="loginemail"  class="form-control" id="email" aria-describedby="emailHelp" required="required">
  </div>
 <div class="mb-3">
    <label for="password" class="form-label"><strong>Password</strong></label>
    <input type="password"  name="loginpassword" class="form-control" id="passord" aria-describedby="emailHelp" required="required">
  </div> 
<div class="container text-center">
    <button class="btn btn-outline-success mx-3">Login Now</button>
</div>
</form>
</div>
<div class="card-footer">
<div class="text-blue custom-bg p-2">
<a href="#" class="text-white" data-bs-toggle="modal" data-bs-target="#forgotpassword" >forgot password</a>
</div>
<div class="text-blue custom-bg mt-2 p-2">
<a href="#" class="text-white" >google sineup</a>
</div>
</div>
</div>
</div>
</div>
</div>


<!-- Modal -->
<div class="modal fade" id="forgotpassword" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog model-lg" style="max-width:800px">
    <div class="modal-content">
      <div class="modal-header custom-bg">
        <h1 class="modal-title fs-5 text-white" id="exampleModalLabel">Please fill details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="ForgotEmail" method="post">
      <div class="mb-3">
      <label for="email" class="form-label">Email</label>
       <input type="email" name="forgotemail"  class="form-control" id="email" aria-describedby="emailHelp" required="required">
       </div>
       <div class="container text-center">
        <button class="btn btn-outline-success mx-3">Submit</button>
       </div>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>