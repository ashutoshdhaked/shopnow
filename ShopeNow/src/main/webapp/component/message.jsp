<%
String msg = (String)session.getAttribute("msg");
if(msg!=null){
if(msg.equals("success")){
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong style="color:green;">Data Successfully Submitted</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
session.removeAttribute("msg");
}
else if(msg.equals("please login before checkout")){
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong style="color:green;">Please login before checkout</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
session.removeAttribute("msg");
}
else if(msg.equals("Sorry your email is not registered!")){
%>	
<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong style="color: red;">Sorry your email is not registered!</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>	
	
<% 
session.removeAttribute("msg");
}
else if(msg.equals("Successfully Reset password email has been sent on your email")){
%>	
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong style="color:green;">Successfully Reset password email has been sent on your email</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>	
<%
session.removeAttribute("msg");
}
else{
%>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong style="color: red;">Ooops.... &nbsp;&nbsp;something went to wrong</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
session.removeAttribute("msg");
}
}
%>


