<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
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
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4></h4>
                        <div class="breadcrumb__links">
                            <a href="./">Home</a>
                            <span>Profile</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	<div class="container rounded bg-white mt-5 mb-5">
		<form class="row" action="/profile" method="post">
		<%
		    String success = (String) request.getAttribute("success");
		    if (success != null) {
			%>
			        <div class="alert alert-success col-md-12" role="alert">
			            <%= success %>
			        </div>
			<%
			    }
			%>
			<div class="col-md-12 border-right">
				<div class="p-3 py-5">
					<div class="d-flex justify-content-between align-items-center mb-3">
						<h4 class="text-right">Profile Settings</h4>
					</div>
					<div class="row mt-2">
						<div class="col-md-6">
							<label class="labels">Name</label>
							<input type="text" class="form-control" placeholder="first name" value="${ currentUser.username }" name="username" disabled>
						</div>
						<div class="col-md-6">
							<label class="labels">Fullname</label>
							<input type="text" class="form-control" value="${ currentUser.fullname }" placeholder="Enter your name..." name="fullname">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col-md-4">
							<label class="labels">Current Password</label>
							<input type="password" class="form-control" placeholder="Password" value="" name="currentPass">
						</div>
						<div class="col-md-4">
							<label class="labels">New Password</label>
							<input type="password" class="form-control" value="" placeholder="Your name..." name="newPass">
						</div>
						<div class="col-md-4">
							<label class="labels">Confirm Password</label>
							<input type="password" class="form-control" placeholder="first name" value="" name="confirmPass">
						</div>
					</div>
					
					<div class="row mt-3">
						<div class="col-md-6">
							<label class="labels">PhoneNumber</label><input type="text"
								class="form-control" placeholder="Enter your phone number..." value="${ currentUser.phone }" name="phone">
						</div>
						<div class="col-md-6">
							<label class="labels">Address</label><input type="text"
								class="form-control" placeholder="" value="${ currentUser.address }" name="address">
						</div>
						<div class="col-md-6">
							<label class="labels">Email ID</label><input type="text"
								class="form-control" placeholder="${ currentUser.email }" value="${ currentUser.email }" name="email">
						</div>
						<div class="col-md-6">
							<label class="labels">Account number</label><input type="text"
								class="form-control" placeholder="Your number..." value="${ currentUser.accountNumber }" name="account_number">
						</div>
					</div>
					<div class="mt-5 text-center">
						<button class="btn btn-primary profile-button" type="submit">Save
							Profile</button>
					</div>
				</div>
			</div>

		</form>
	</div>
	<!-- Checkout Section End -->

    <c:import url="/WEB-INF/views/layout/footer.jsp" />

    <!-- Js Plugins -->
    <c:import url="/WEB-INF/views/layout/js.jsp" />
</body>
</html>