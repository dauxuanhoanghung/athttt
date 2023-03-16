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


    <c:import url="/WEB-INF/views/layout/css.jsp" />

</head>

<body>

    <!-- Header Section Begin -->
    <c:import url="/WEB-INF/views/layout/header.jsp" />
    <!-- Header Section End -->


	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Shopping Cart</h4>
						<div class="breadcrumb__links">
							<a href="./">Home</a> <a href="./shop">Shop</a> 
							<span>Shopping Cart</span>
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
    <c:import url="/WEB-INF/views/layout/footer.jsp" />
    <!-- Footer Section End -->

    <!-- Js Plugins -->
	<c:import url="/WEB-INF/views/layout/js.jsp" />
	
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