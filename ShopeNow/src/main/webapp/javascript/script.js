function addToCart(pid,pname,price){
	let cart = localStorage.getItem("cart");
	if(cart==null){
		let products=[];
		let product ={productId:pid,productName:pname,productQuantity:1,productPrice:price};
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		console.log("first product is added");
	}
	else{
		// if cart is already present
         let pcart = JSON.parse(cart);		
		let oldProduct = pcart.find((item)=>item.productId==pid);
		if(oldProduct){
			oldProduct.productQuantity = oldProduct.productQuantity +1;
			pcart.map((item)=>{
				if(item.productId==oldProduct.productId){
					item.productQuantity = oldProduct.productQuantity;
				}
				
			})
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("product quantity is increased ");
		}else{
			let product ={productId:pid,productName:pname,productQuantity:1,productPrice:price};
			pcart.push(product);
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("new  product is added");
		}
		
	}
	goToPage('index.jsp');
	
}

function updateCart(){
	
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	
	if(cart==null||cart.length==0){
		console.log("cart is empty");
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3> There is no any item </h3>");
		$(".checkout-btn").addClass('disabled');
	}
	else{
		console.log("cart");
		$(".cart-items").html(`(${cart.length})`);
		let table=`
		 <table class='table'>
		 <thead class='thead-light'>
		  <tr>
		    <th>Item Name </th>
		    <th>Item price </th>
		    <th>Item Quantity </th>
		    <th>Total Price </th>
		    <th>Action</th>
		    <th>Increase</th>
		    <th>Decrease</th>
		 </tr>
		 </thead>
		`;
		let totalprice =0;
		cart.map((item)=>{
			table+=
			`<tr>
			<td>${item.productName}</td>
			<td>&#8377;${item.productPrice}</td>
			<td>${item.productQuantity}</td>
			<td>&#8377;${item.productQuantity * item.productPrice}</td>
			<td><button class='btn btn-dan btn-sm' onclick='deleteItemFromCart(${item.productId})'>Remove</button></td>
			<td><button class='btn btn-dan btn-sm' onclick='increaseQuantity(${item.productId})'>increase</button></td>
			<td><button class='btn btn-dan btn-sm'onclick='decreaseQuantity(${item.productId})'>decrease</button></td>
			</tr>`
			totalprice+=item.productQuantity * item.productPrice;
		})
		table=table+`
		<tr><td colspan='5' class='text-right'> Total Price :&nbsp;&nbsp;<b>&#8377; ${totalprice}</b></td></tr>
		</table>`
		$(".cart-body").html(table);
		$(".checkout-btn").removeClass('disabled');
	}	
}
// make increase and decresase productQuantity  function

function increaseQuantity(productId) {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    cart.forEach((item) => {
        if (item.productId === productId) {
            item.productQuantity++;
        }
    });

    localStorage.setItem("cart", JSON.stringify(cart));
    updateCart();
}

function decreaseQuantity(productId) {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    cart.forEach((item) => {
        if (item.productId === productId && item.productQuantity > 1) {
            item.productQuantity--;
        }
    });

    localStorage.setItem("cart", JSON.stringify(cart));
    updateCart();
}

 
// render page again when any item is added in cart
function goToPage(url) {
  window.location.href = url;
}


// delete item 
function deleteItemFromCart(pid){
	let cart=JSON.parse(localStorage.getItem('cart'));
	let newcart=cart.filter((item)=>item.productId != pid)
	localStorage.setItem('cart',JSON.stringify(newcart))
	updateCart();
}

$(document).ready(function (){
	updateCart();
});




// reset password script 
 function validatePassword() {
      var password = document.getElementById("password").value;
      var confirmPassword = document.getElementById("confirmPassword").value;
      
      if (password !== confirmPassword) {
        document.getElementById("error").innerHTML = "Error: Passwords do not match.";
      } else {
        document.getElementById("error").innerHTML = "";
        // Proceed with further actions or form submission
      }
    }



