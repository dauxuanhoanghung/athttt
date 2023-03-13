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
<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>' />
<link rel="stylesheet" href='<c:url value="/css/font-awesome.min.css"/>' />
<link rel="stylesheet" href='<c:url value="/css/elegant-icons.css"/>' />
<link rel="stylesheet" href='<c:url value="/css/magnific-popup.css"/>' />
<link rel="stylesheet" href='<c:url value="/css/nice-select.css"/>' />
<link rel="stylesheet" href='<c:url value="/css/owl.carousel.min.css"/>' />
<link rel="stylesheet" href='<c:url value="/css/slicknav.min.css"/>' />
<link rel="stylesheet" href='<c:url value="/css/style.css"/>' />
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__option">
			<div class="offcanvas__links">
				<a href="#">Sign in</a> <a href="#">FAQs</a>
			</div>
			<div class="offcanvas__top__hover">
				<span>Usd <i class="arrow_carrot-down"></i></span>
				<ul>
					<li>USD</li>
					<li>EUR</li>
					<li>USD</li>
				</ul>
			</div>
		</div>
		<div class="offcanvas__nav__option">
			<a href="#" class="search-switch"><img src="img/icon/search.png"
				alt=""></a> <a href="#"><img src="img/icon/heart.png" alt=""></a>
			<a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
			<div class="price">$0.00</div>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__text">
			<p>Free shipping, 30-day return or refund guarantee.</p>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-7">
						<div class="header__top__left">
							<p>Free shipping, 30-day return or refund guarantee.</p>
						</div>
					</div>
					<div class="col-lg-6 col-md-5">
						<div class="header__top__right">
							<div class="header__top__links">
								<a href="#">Sign in</a> <a href="#">FAQs</a>
							</div>
							<div class="header__top__hover">
								<span>Usd <i class="arrow_carrot-down"></i></span>
								<ul>
									<li>USD</li>
									<li>EUR</li>
									<li>USD</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="header__logo">
						<a href="./index.html"><img src="img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<nav class="header__menu mobile-menu">
						<ul>
							<li><a href="./index.html">Home</a></li>
							<li class="active"><a href="./shop.html">Shop</a></li>
							<li><a href="#">Pages</a>
								<ul class="dropdown">
									<li><a href="./about.html">About Us</a></li>
									<li><a href="./shop-details.html">Shop Details</a></li>
									<li><a href="./shopping-cart.html">Shopping Cart</a></li>
									<li><a href="./checkout.html">Check Out</a></li>
									<li><a href="./blog-details.html">Blog Details</a></li>
								</ul></li>
							<li><a href="./blog.html">Blog</a></li>
							<li><a href="./contact.html">Contacts</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="header__nav__option">
						<a href="#" class="search-switch"><img
							src="img/icon/search.png" alt=""></a> <a href="#"><img
							src="img/icon/heart.png" alt=""></a> <a href="#"><img
							src="img/icon/cart.png" alt=""> <span class="number">0</span></a>
						
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Shopping Cart</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a> <a href="./shop.html">Shop</a> <span>Shopping
								Cart</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shopping Cart Section Begin -->
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="shopping__cart__table">
						<table>
							<thead>
								<tr>
									<th>Product</th>
									<th>Quantity</th>
									<th>Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody class="tbody-shopping">
								
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="continue__btn">
								<a href="#">Continue Shopping</a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="continue__btn update__btn">
								<a href="#"><i class="fa fa-spinner"></i> Update cart</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="cart__discount">
						<h6>Discount codes</h6>
						<form action="#">
							<input type="text" placeholder="Coupon code">
							<button type="submit">Apply</button>
						</form>
					</div>
					<div class="cart__total">
						<h6>Cart total</h6>
						<ul>
							<li>Subtotal <span>$ 169.50</span></li>
							<li>Total <span>$ 169.50</span></li>
						</ul>
						<a href="#" class="primary-btn">Proceed to checkout</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shopping Cart Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__logo">
							<a href="#"><img src="img/footer-logo.png" alt=""></a>
						</div>
						<p>The customer is at the heart of our unique business model,
							which includes design.</p>
						<a href="#"><img src="img/payment.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
					<div class="footer__widget">
						<h6>Shopping</h6>
						<ul>
							<li><a href="#">Clothing Store</a></li>
							<li><a href="#">Trending Shoes</a></li>
							<li><a href="#">Accessories</a></li>
							<li><a href="#">Sale</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="footer__widget">
						<h6>Shopping</h6>
						<ul>
							<li><a href="#">Contact Us</a></li>
							<li><a href="#">Payment Methods</a></li>
							<li><a href="#">Delivary</a></li>
							<li><a href="#">Return & Exchanges</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
					<div class="footer__widget">
						<h6>NewLetter</h6>
						<div class="footer__newslatter">
							<p>Be the first to know about new arrivals, look books, sales
								& promos!</p>
							<form action="#">
								<input type="text" placeholder="Your email">
								<button type="submit">
									<span class="icon_mail_alt"></span>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="footer__copyright__text">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						<p>
							Copyright ©
							<script>
                                document.write(new Date().getFullYear());
                            </script>
							2020 All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
						</p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search End -->
	<script src='<c:url value="js/jquery-3.3.1.min.js"/>'></script>
	<script src='<c:url value="js/bootstrap.min.js"/>'></script>
	<script src='<c:url value="js/jquery.nice-select.min.js" />'></script>
	<script src='<c:url value="js/jquery.nicescroll.min.js"/>'></script>
	<script src='<c:url value="js/jquery.magnific-popup.min.js"/>'></script>
	<script src='<c:url value="js/jquery.countdown.min.js" />'></script>
	<script src='<c:url value="js/jquery.slicknav.js"/>'></script>
	<script src='<c:url value="js/mixitup.min.js"/>'></script>
	<script src='<c:url value="js/owl.carousel.min.js" />'></script>
	<script src='<c:url value="js/main.js" />'></script>

	<!-- Js Plugins -->
	 <script>
      document.addEventListener("DOMContentLoaded", function() {
        let listItem = JSON.parse(localStorage.getItem("listItem")) || []
        let body = document.querySelector(".tbody-shopping")
        let HTML = ``
        for (let item of listItem) {
          HTML += "<tr>" +
                  "<td class='product__cart__item'>" +
                  "<div class='product__cart__item__pic'>" +
                  "<img style='width: 100px;height:100px ;object-fit: contain' src='" + item.product.thumbnail + "' alt=''>" +
                  "</div>" +
                  "<div class='product__cart__item__text'>" +
                  "<h6>" + item.product.name + "</h6>" +
                  "<h5>$" + item.product.price + "</h5>" +
                  "</div>" +
                  "</td>" +
                  "<td class='quantity__item'>" +
                  "<div class='quantity' >" +
                  "<div class='pro-qty-2' style='display: flex; gap: 10px' >" +
                  "<span class='fa fa-angle-left dec qtybtn' onclick='cart.decreaseItem(event," + item.product.id + ", " +  item.product.price + ")'> </span>" +
                  "<input readonly type='text'  value='" + item.quantity + "'>" +
                  "<span class='fa fa-angle-right inc qtybtn' onclick='cart.increaseItem(event, " + item.product.id + ", " +  item.product.price + ")'></span>" +
                  "</div>" +
                  "</div>" +
                  "</td>" +
                  "<td class='cart__price'>" + item.product.price * item.quantity + "</td>" +
                  "<td class='cart__close' style='cursor: pointer' onclick='cart.removeItem(event, " + item.product.id + ")'> <i class='fa fa-close'></i></td>" +
                  "</tr>";
        }
        body.innerHTML = HTML


          cart.updatePrice(cart.getListItemFromLocalStorage())
          cart.updateQuantity(cart.getListItemFromLocalStorage())
      });



      const cart = {
            getListItemFromLocalStorage () {
              return JSON.parse(localStorage.getItem("listItem")) || []
            },
            saveToLocalStorage (newListItem) {
              return localStorage.setItem("listItem", JSON.stringify(newListItem));
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

              document.querySelector(".cart__total ul li span").innerHTML =  "$" + totalAmount.toFixed(2);
              document.querySelector(".cart__total ul li:nth-child(2) span").innerHTML =  "$" +  totalAmount.toFixed(2)
            },
            updateQuantity(listItem = []) {
              const totalQuantity = listItem.reduce((accumulator, currentValue) => {
                return accumulator + currentValue.quantity;
              }, 0);
              document.querySelector(".header__nav__option .number").innerHTML = totalQuantity;
            },
            removeItem (e, id) {
              document.querySelector(".fa.fa-close").parentElement.parentElement.remove();
              let listItem = this.getListItemFromLocalStorage();
              listItem = listItem.filter(item => item.product.id !== id)
              console.log(listItem)
              this.updatePrice(listItem);
              this.updateQuantity(listItem);
              this.saveToLocalStorage((listItem))
            },
            increaseItem(e, id, price) {
              let currentValue =   e.target.parentElement.querySelector("input").value
              let totalPrice = e.target.parentElement.parentElement.parentElement.parentElement.querySelector(".cart__price")
              e.target.parentElement.querySelector("input").value = parseInt(currentValue) + 1

              totalPrice.innerHTML = (parseInt(currentValue) + 1) * price


              let listItem = this.getListItemFromLocalStorage();
              listItem.reduce((result, item) => {
                if (item.product.id === id) {
                  result.push({ ...item, quantity: item.quantity + 1 });
                } else {
                  result.push(item);
                }
                cart.updatePrice(result)
                cart.updateQuantity(result)
                this.saveToLocalStorage(result)
                return result;
              }, []);

            },
            decreaseItem(e, id, price ) {
              let currentValue =   e.target.parentElement.querySelector("input").value
              let totalPrice = e.target.parentElement.parentElement.parentElement.parentElement.querySelector(".cart__price")

              if (currentValue == 1) return;
              e.target.parentElement.querySelector("input").value = parseInt(currentValue) - 1
              totalPrice.innerHTML = (parseInt(currentValue) - 1) * price


              let listItem = this.getListItemFromLocalStorage();
              listItem.reduce((result, item) => {
                if (item.product.id === id) {
                  result.push({ ...item, quantity: item.quantity - 1 });
                } else {
                  result.push(item);
                }
                cart.updatePrice(result)
                cart.updateQuantity(result)
                this.saveToLocalStorage(result)
                return result;
              }, []);

            }
      }
    </script>
</body>

</html>