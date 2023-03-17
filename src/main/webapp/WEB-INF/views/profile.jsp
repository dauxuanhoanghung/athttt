<%@ taglib prefix="c" uri = "http://java.sun.com/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <c:import url="/WEB-INF/views/layout/css.jsp" />
</head>
<body>
	<c:import url="/WEB-INF/views/layout/header.jsp" />
	<div class="container rounded bg-white mt-5 mb-5">
		<div class="row">
			<div class="col-md-12 border-right">
				<div class="p-3 py-5">
					<div class="d-flex justify-content-between align-items-center mb-3">
						<h4 class="text-right">Profile Settings</h4>
					</div>
					<div class="row mt-2">
						<div class="col-md-6">
							<label class="labels">Name</label>
							<input type="text" class="form-control" placeholder="first name" value="" name="">
						</div>
						<div class="col-md-6">
							<label class="labels">Surname</label>
							<input type="text" class="form-control" value="" placeholder="surname">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-12">
							<label class="labels">PhoneNumber</label><input type="text"
								class="form-control" placeholder="" value="" name="phone">
						</div>
						<div class="col-md-12">
							<label class="labels">Address</label><input type="text"
								class="form-control" placeholder="" value="" name="address">
						</div>
						<div class="col-md-12">
							<label class="labels">Email ID</label><input type="text"
								class="form-control" placeholder="${ currentUser.email }" value="${ currentUser.email }" name="email">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-6">
							<label class="labels">Account number</label><input type="text"
								class="form-control" placeholder="Your number..." value="" name="account_number">
						</div>
						<div class="col-md-6">
							<label class="labels">State/Region</label><input type="text"
								class="form-control" value="" placeholder="state">
						</div>
					</div>
					<div class="mt-5 text-center">
						<button class="btn btn-primary profile-button" type="submit">Save
							Profile</button>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- Checkout Section End -->

    <c:import url="/WEB-INF/views/layout/footer.jsp" />

    <!-- Js Plugins -->
    <c:import url="/WEB-INF/views/layout/js.jsp" />
</body>
</html>