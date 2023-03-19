<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Male-Fashion | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<c:import url="/WEB-INF/views/layout/css.jsp" />
</head>

<body>

	<c:import url="/WEB-INF/views/layout/header.jsp" />


	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Check Out</h4>
						<div class="breadcrumb__links">
							<a href="./">Home</a> <a href="./shop">Shop</a> <span>Check
								Out</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form class="form_product" action="/payment" method="post">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<h6 class="coupon__code">
								<span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click
									here</a> to enter your code
							</h6>
							<h6 class="checkout__title">Billing Details</h6>
							<div class="col-lg-12">
								<div class="checkout__input">
									<p>
										Full Name<span>*</span>
									</p>
									<input type="text" value="${ currentUser.fullname }">
								</div>
							</div>
							<div class="checkout__input">
								<p>
									Address<span>*</span>
								</p>
								<input type="text" placeholder="Street Address"
									class="checkout__input__add" value="${ currentUser.address }"
									name="address">
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Phone<span>*</span>
										</p>
										<input type="text" name="phone" value="${ currentUser.phone }">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Email<span>*</span>
										</p>
										<input type="email" name="email"
											value="${ currentUser.email }">
									</div>
								</div>
							</div>
							<div class="checkout__input__checkbox">
								<label for="acc"> Create an account? <input
									type="checkbox" id="acc"> <span class="checkmark"></span>
								</label>
								<p>Create an account by entering the information below. If
									you are a returning customer please login at the top of the
									page</p>
							</div>
							<div class="checkout__input">
								<p>
									Account Password<span>*</span>
								</p>
								<input type="text">
							</div>
							<div class="checkout__input__checkbox">
								<label for="diff-acc"> Note about your order, e.g,
									special noe for delivery <input type="checkbox" id="diff-acc">
									<span class="checkmark"></span>
								</label>
							</div>
							<div class="checkout__input">
								<p>
									Order notes<span>*</span>
								</p>
								<input type="text"
									placeholder="Notes about your order, e.g. special notes for delivery.">
							</div>
						</div>



						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4 class="order__title">Your order</h4>
								<div class="checkout__order__products">
									Product <span>Total</span>
								</div>
								<ul class="checkout__total__products">
									<li>01. Vanilla salted caramel <span>$ 300.0</span></li>
									<li>02. German chocolate <span>$ 170.0</span></li>
									<li>03. Sweet autumn <span>$ 170.0</span></li>
									<li>04. Cluten free mini dozen <span>$ 110.0</span></li>
								</ul>
								<ul class="checkout__total__all">
									<li>Subtotal <span>$750.99</span></li>
									<li>Total <span>$750.99</span></li>
								</ul>
								<div class="checkout__input__checkbox">
									<label for="acc-or"> Create an account? <input
										type="checkbox" id="acc-or"> <span class="checkmark"></span>
									</label>
								</div>
								<div class="checkout__input__checkbox">
									<label for="payment"> Check Payment <input
										type="checkbox" id="payment"> <span class="checkmark"></span>
									</label>
								</div>
								<div class="checkout__input__checkbox">
									<label for="paypal"> Paypal <input type="checkbox"
										id="paypal"> <span class="checkmark"></span>
									</label>
								</div>
								<button type="submit" class="site-btn">PLACE ORDER</button>
							</div>
						</div>
					</div>
				</form>
			</div>



		</div>
	</section>
	<!-- Checkout Section End -->

	<c:import url="/WEB-INF/views/layout/footer.jsp" />

	<!-- Js Plugins -->
	<c:import url="/WEB-INF/views/layout/js.jsp" />

	<script>
	
	const form = document.querySelector(".form_product")
	const button = document.querySelector(".form_product button")
	
	form.addEventListener("submit", (e) => {
		e.preventDefault()
		let ids_product =  cart.getListItemFromLocalStorage().map(item => {
			  return {
				    id: item.product.id,
				    quantity: item.quantity,
				  };
		});
	 
		fetch("http://localhost:8080/payment", {
			method: "post",
			headers: {
			      "Content-Type": "application/json"
			    },
		    body: JSON.stringify( ids_product)
		})
		
		setTimeout(()=> {
			window.location.href = "http://localhost:8080/payment-test";
		}, 200)

	})
	
    document.addEventListener("DOMContentLoaded", function() {
      cart.updateOrder()
      cart.updatePrice(cart.getListItemFromLocalStorage())
      cart.updateQuantity(cart.getListItemFromLocalStorage())
    })
    const cart = {
      getListItemFromLocalStorage () {
        return JSON.parse(localStorage.getItem("listItem")) || []
      },
      saveToLocalStorage (newListItem) {
        return localStorage.setItem("listItem", JSON.stringify(newListItem));
      },
      updateOrder() {
        let listItem = this.getListItemFromLocalStorage();
        let containerOrder = document.querySelector(".checkout__total__products")
        let HTML = ''
        for (let i = 0; i < listItem.length; i++) {
          HTML += "<li>" + (i + 1) + ". " + listItem[i].product.name + " <span>$ " + listItem[i].product.price + "</span></li>";
        }
        containerOrder.innerHTML = HTML;
      },
      updatePrice (listItem = []) {
        let totalAmount
        if (listItem.length == 0)
          totalAmount = 0
        else {
          totalAmount = listItem.reduce((accumulator, item) => {
            const productPrice = item.product.price;
            const quantity = item.quantity;
            const itemTotal = productPrice * quantity;
            return accumulator + itemTotal;
          }, 0);
        }

        document.querySelector(".checkout__total__all li span").innerHTML =  "$" + totalAmount.toFixed(2);
        document.querySelector(".checkout__total__all li:nth-child(2) span").innerHTML =  "$" +  totalAmount.toFixed(2)
      },
      updateQuantity(listItem = []) {
        const totalQuantity = listItem.reduce((accumulator, currentValue) => {
          return accumulator + currentValue.quantity;
        }, 0);
        document.querySelector(".header__nav__option .number").innerHTML = totalQuantity;
      },
    }
</script>
</body>

</html>