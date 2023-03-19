<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Paypal Payment with Spring Boot - ShareEverythings.com</title>
</head>
<body>
	<h1>Payment Success !</h1>
</body>
<script>
document.addEventListener("DOMContentLoaded", function() {
	  const cart = {
	    getListItemFromLocalStorage() {
	      return JSON.parse(localStorage.getItem("listItem")) || [];
	    },
	    saveToLocalStorage(newListItem) {
	      return localStorage.setItem("listItem", JSON.stringify(newListItem));
	    },
	  };

	  const ids_product = cart.getListItemFromLocalStorage().map((item) => {
	    return {
	      id: item.product.id,
	      quantity: item.quantity,
	    };
	  });

	  fetch("http://localhost:8080/order", {
	    method: "POST",
	    headers: {
	      "Content-Type": "application/json",
	    },
	    body: JSON.stringify({ products: ids_product, userID: 1 }),
	  })
	    .then((res) => {
	      if (res.status === 200) {
	        localStorage.removeItem("listItem");

	        setTimeout(() => {
	          window.location.href = "http://localhost:8080/shop";
	        }, 1000);
	      }
	    });
	});
</script>
</html>