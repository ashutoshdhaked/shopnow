<%@page import="entities.UserData"%>
<%@include file="font_style_css_js.jsp" %>
<%
UserData user1 = (UserData)session.getAttribute("currentuser");
// takinf user1 not user because in adminpage we already have UserData
// object with user varibale name
%>
<nav class="navbar navbar-expand-lg bg-body-tertiary navbar-dark  custom-bg">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">ShopNow</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            More Option
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="aboutus.jsp">About Us</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
      <%
      if(user1==null){
    	  %>
    	  <li class="nav-item">
    	  <div class=" " style="color:#ffffff;font-size:20px; margin-right: 40px;">
    	  <a class="nav-link active" aria-current="page" href="#" data-bs-toggle="modal" data-bs-target="#cart-model">
    	  <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
          <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
         </svg>
         <span class="cart-items" style="font-size:13px;">(0)</span></a>
         </div>
    	  </li>
    	  <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="register.jsp">Register</a>
        </li> 
    	  <%  
      }
      else{
    	  %> 
    	  <li class="nav-item">
    	  <div class=" " style="color:#ffffff;font-size:20px; margin-right: 40px;">
    	  <a class="nav-link active" aria-current="page" href="#" data-bs-toggle="modal" data-bs-target="#cart-model">
    	  <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
          <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
         </svg>
         <span class="cart-items" style="font-size:13px;">(0)</span></a>
         </div>
    	  </li> 	  
    	  
    	   <li class="nav-item">
    	   <img class="rounded-circle"  style="width: 40px" src="images/default.jpg">
    	   </li>
    	  <li class="nav-item">
          <a class="nav-link active" style="color: red;" aria-current="page" href="<%=user1.getUserTyope().equals("admin")?"admin.jsp":"normaluser.jsp"%>"><i>Welcome &nbsp;<%=user1.getUserName() %></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="logout.jsp">Logout</a>
        </li>    
      <%
      }
      %>
      
      </ul>
    </div>
  </div>
</nav>