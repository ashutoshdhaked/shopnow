<%@include file="font_style_css_js.jsp" %>
<!-- Modal -->
<div class="modal fade" id="cart-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog model-lg" style="max-width:800px">
    <div class="modal-content">
      <div class="modal-header custom-bg">
        <h1 class="modal-title fs-5 text-white" id="exampleModalLabel">your cart</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <div class="cart-body">
       
       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary custom-bg checkout-btn"><a class="text-white" style="text-decoration:none; "href="checkout.jsp">Check-Out</a></button>
      </div>
    </div>
  </div>
</div>