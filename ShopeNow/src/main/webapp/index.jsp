<%@page import="helper.DesReduce"%>
<%@page import="entities.Category"%>
<%@page import="dao.CategoryDao"%>
<%@page import="entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@page import="helper.FactoryProvider"%>
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
<%@include file="component/message.jsp" %>
<%
CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
List<Category> listofcat = cdao.getCategories();
%>
<div class="row mt-5 mx-3">
<!-- show categories -->
<div class="col-md-2 mt-4">
<div class="list-group">
<a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
    All Categories
  </a>
<%for(Category c:listofcat){%>
<a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTittle()%></a>
<%}%>
</div>
</div>
<% 
ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
List<Product> listofpro = pdao.getAllProducts();
  String cat = request.getParameter("category");
  if(cat==null){
	  listofpro=pdao.getAllProducts();
  }
  else if(cat.trim().equals("all")){ 
    listofpro=pdao.getAllProducts();
  }
  else{
	  int cid = Integer.parseInt(cat.trim());
	  listofpro = pdao.getProductById(cid);
  }
 %>
<!-- show Products -->
<div class="col-md-10">
<div class="row mt-4">
<div class="col-md-12">
<div class="row row-cols-1 row-cols-md-2 g-4">
<%for(Product p:listofpro){
%>
<div class="card mb-3 col m-2" style="max-width: 500px;">
  <div class="row g-0">
    <div class="col-md-4 mt-2">
     <div class="container text-center">
      <img src="images/products/<%=p.getpPhoto()%>" class="img-fluid rounded-start container-fluid" alt="product image">
     </div>
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%=p.getpName()%></h5>
        <p class="card-text"><%=DesReduce.get10Words(p.getpDesc())%>.....<button class="btn"data-bs-toggle="modal" data-bs-target="#see-more-model-<%=p.getpId()%>">see more</button></p>
      </div>
    </div>
  </div>
   <div class="footer mt-2 text-center">
      <p class="btn" style="color:#009688;"><b>&#8377;&nbsp;<%=p.getPriceAfterDiscount()%></b>/- &nbsp;<span class="text-secondary duscount-label"><%=p.getpDiscount()%>%&nbsp;off&nbsp;&nbsp;<s>&nbsp;&#8377;<%=p.getpPrice()%></s></span></p>
      <button class="btn custom-bg text-white"  onClick="addToCart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getpPrice()%>)" >Add Cart</button>
      </div>
</div>
 <!-- model is start from here  -->
   <div class="modal fade" id="see-more-model-<%=p.getpId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog model-lg">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h1 class="modal-title fs-5" id="exampleModalLabel"><%=p.getpName()%></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <p><strong>Product description </strong></p>
      <p><%=p.getpDesc()%></p>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- model is end from here  -->
<%}
if(listofpro.size()==0){
%>
<div class="container text-center"><p><strong style="font-size: 30px; color:#009688; "> Sorry there is no product available </strong></p></div>
<%
}
%>
</div>
</div>
</div>
</div>
</div>
<%@include file="component/cartmodel.jsp" %>
</body>
</html>