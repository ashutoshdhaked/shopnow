<%@page import="java.util.Map"%>
<%@page import="helper.Help"%>
<%@page import="entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="helper.FactoryProvider"%>
<%@page import="dao.CategoryDao"%>
<%@page import="entities.UserData"%>
<%
   UserData user = (UserData)session.getAttribute("currentuser");
   if(user==null){
	   session.setAttribute("msg","fail");
	   response.sendRedirect("login.jsp");
	   return;
   }
   else{
	   if(user.getUserTyope().equals("normal")){
		   session.setAttribute("msg","fail");
		   response.sendRedirect("login.jsp");
		   return;
	   }
	   
   }
%>
 <% 
     CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
     List<Category>	list= categoryDao.getCategories();
     // getting count of user and products
        Map<String,Long> map =Help.getCounts(FactoryProvider.getFactory());
     
     
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
 <div class="container admin ">
 <div class="mt-2"><%@include file="component/message.jsp" %></div>
 <!-- first row elements  -->
 <div class="row mt-5">
 <!-- first box -->
 <div class="col-md-4">
 <div class="card"> 
 <div class="card-body text-center custom-bg p-2">
 <div class="container mb-1">
  <img class="img-fluid rounded-circle" style="max-width:140px" src="images/users.png" alt="usericon">
 </div>
 <h3 class="text-white"><%=map.get("userCount")%></h3>
 <h3 class="text-white">Users</h3>
 
 
 </div>
 </div>
 </div>
 <!-- second box -->
 <div class="col-md-4">
 <div class="card"> 
 <div class="card-body text-center custom-bg p-2">
  <div class="container mb-1 ">
  <img class="img-fluid rounded-circle" style="max-width:140px" src="images/list.png" alt="usericon">
 </div>
 <h3 class="text-white"><%=list.size()%></h3>
 <h3 class="text-white">Categories</h3>
 
 </div>
 </div>
 </div>
 <!-- third box -->
 <div class="col-md-4">
 <div class="card"> 
 <div class="card-body text-center custom-bg p-2">
  <div class="container mb-1">
  <img class="img-fluid rounded-circle" style="max-width:140px" src="images/product.png" alt="usericon">
 </div>
 <h3 class="text-white"><%=map.get("productCount")%></h3>
 <h3 class="text-white">Products</h3>
 </div>
 </div>
 </div>
 </div>
 <!-- second row elements  -->
 <div class="row mt-3">
 
 <!-- second row first card  -->
 <div class="col-md-6">
 <div class="card" data-bs-toggle="modal" data-bs-target="#add-category-model"> 
 <div class="card-body text-center custom-bg p-2">
  <div class="container mb-1">
  <img class="img-fluid rounded-circle" style="max-width:140px" src="images/key.png" alt="usericon">
 </div>
 <p class="mt-2 text-white">Click here to add new category</p>
 <h3 class="text-white">Add Category</h3>
 
 </div>
 </div> 
 </div>
 <!-- second row second card  -->
 <div class="col-md-6">
 <div class="card" data-bs-toggle="modal" data-bs-target="#add-product-model"> 
 <div class="card-body text-center custom-bg p-2">
  <div class="container mb-1">
  <img class="img-fluid rounded-circle" style="max-width:140px" src="images/plus.png" alt="usericon">
 </div>
 <p class="mt-2 text-white">Click here to add new product</p>
 <h3 class="text-white">Add Product</h3>
 
  </div>
 </div>
 </div>
 </div>
 </div>
 
 
 <!-- Add category model -->

<!-- Modal -->
<div class="modal fade" id="add-category-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog model-lg">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Category Details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form action="ProductOperationServlet" method="post">
       <input type="hidden" name="operation" value="addcategory"/>
        <div class="form-group">
       <div class="mb-3">
         <label for="cattitle" class="form-label"><strong>Category Title</strong></label>
         <input type="text" name="cattitle"  class="form-control" id="cattitle" aria-describedby="emailHelp" required="required">
        </div>
        <div class="mb-3">
         <label for="carddesc" class="form-label"><strong>Category Description</strong></label>
         <textarea name="carddesc"  class="form-control" id="carddesc" aria-describedby="emailHelp"  required="required"></textarea>
          </div>
          <div class="container text-center">
                 <button class="btn btn-outline-success mx-3">Add Category</button>
            </div>
        </div>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
  
 <!-- End Add Category Model -->
 
 <!--  Add Product Model -->
 
 <!-- Modal -->
<div class="modal fade" id="add-product-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog model-lg">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Product Details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
       <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
       <input type="hidden" name="operation" value="addproduct"/>
        <div class="form-group">
       <div class="mb-3">
         <label for="proname" class="form-label"><strong>Product Name</strong></label>
         <input type="text" name="proname"  class="form-control" id="proname" required="required">
        </div>
        <div class="mb-3">
         <label for="prodesc" class="form-label"><strong>Product Description</strong></label>
         <textarea name="prodesc"  class="form-control" id="prodesc" required="required"></textarea>
          </div>
          <div class="mb-3">
         <label for="proprice" class="form-label"><strong>Product Price</strong></label>
         <input type="number" name="proprice"  class="form-control" id="proprice" required="required">
        </div>
          <div class="mb-3">
         <label for="prodiscount" class="form-label"><strong>Product Discount</strong></label>
         <input type="number" name="prodiscount"  class="form-control" id="prodiscount" required="required">
        </div>
           <div class="mb-3">
         <label for="proquantity" class="form-label"><strong>Product Quantity</strong></label>
         <input type="number" name="proquantity"  class="form-control" id="proquantity" required="required">
        </div>
        <!-- fetching all type of categories  -->
        
          <div class="mb-3">
          <label for="selectcat" class="form-label"><strong>Select Category</strong></label>
          <div class="mb-3">
           <select name="selectcategory" id="selectcat" class="form-control">
           <%
            for(Category c : list){
           %>
           <option value="<%=c.getCategoryId()%>" ><%=c.getCategoryTittle()%></option>
          <%
          }
           %>
           </select>
          </div>
          </div>
          <div class="mb-3">
          <label for="pic" class="form-label"><strong>Select Picture Of Product</strong></label>
           <input id="pic" type="file" name="pic" required="required">
          </div>   
          <div class="container text-center">
                 <button class="btn btn-outline-success mx-3">Add Product</button>
            </div>
        </div>
       </form>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
 <!-- End Product Model -->
 <%@include file="component/cartmodel.jsp" %>
</body>
</html>