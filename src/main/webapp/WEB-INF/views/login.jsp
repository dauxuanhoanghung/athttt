<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="<c:url value = "/css/login.css"/>" />
<title>Animated login signup</title>
</head>

<body>
	<div id="container" class="container">
		<!-- FORM SECTION -->
		<div class="row">
			<!-- SIGN UP -->
			<div class="col align-items-center flex-col sign-up">
				<div class="form-wrapper align-items-center">
				
				
					<form class="form sign-up" action="/register" method="post">
						<div class="input-group">
							<i class='bx bxs-user'></i> 
							<input type="text" placeholder="Username" name="username">
						</div>
						<div class="input-group">
							<i class='bx bx-mail-send'></i> 
							<input type="email" placeholder="Email" name="email">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> 
							<input type="password" placeholder="Password" name="password">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> 
							<input type="password" placeholder="Confirm password" name="confirm">
						</div>
						<button type="submit">Sign up</button>
						<p>
							<span> Already have an account? </span> <b onclick="toggle()"
								class="pointer"> Sign in here </b>
						</p>
					</form>
				
				</div>
				<div class="form-wrapper">
					<div class="social-list align-items-center sign-up">
						<div class="align-items-center facebook-bg">
							<i class='bx bxl-facebook'></i>
						</div>
						<div class="align-items-center google-bg">
							<i class='bx bxl-google'></i>
						</div>
						<div class="align-items-center twitter-bg">
							<i class='bx bxl-twitter'></i>
						</div>
						<div class="align-items-center insta-bg">
							<i class='bx bxl-instagram-alt'></i>
						</div>
					</div>
				</div>
			</div>
			<!-- END SIGN UP -->
			<!-- SIGN IN -->
			<div class="col align-items-center flex-col sign-in">
				<div class="form-wrapper align-items-center">
				
				
					<form class="form sign-in" action="/authenticate" method="post" enctype="application/json">
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input required type="text"placeholder="Username" name="username">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> 
							<input required type="password" name = "password"placeholder="Password">
						</div>
						<button type="submit">Sign in</button>
						<p>
							<b> Forgot password? </b>
						</p>
						<p>
							<span> Don't have an account? </span> <b onclick="toggle()"
								class="pointer"> Sign up here </b>
						</p>
					</form>

				</div>
				<div class="form-wrapper">
					<div class="social-list align-items-center sign-in">
						<div class="align-items-center facebook-bg">
							<i class='bx bxl-facebook'></i>
						</div>
						<div class="align-items-center google-bg">
							<i class='bx bxl-google'></i>
						</div>
						<div class="align-items-center twitter-bg">
							<i class='bx bxl-twitter'></i>
						</div>
						<div class="align-items-center insta-bg">
							<i class='bx bxl-instagram-alt'></i>
						</div>
					</div>
				</div>
			</div>
			<!-- END SIGN IN -->
		</div>
		<!-- END FORM SECTION -->
		<!-- CONTENT SECTION -->
		<div class="row content-row">
			<!-- SIGN IN CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="text sign-in">
					<h2>Welcome back</h2>
					<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.
						Impedit obcaecati, accusantium molestias, laborum, aspernatur
						deserunt officia voluptatum tempora dicta quo ab ullam. Assumenda
						enim harum minima possimus dignissimos deserunt rem.</p>
				</div>
				<div class="img sign-in">
					<img src="<c:url value = "/img/undraw_different_love_a3rg.svg"/>"
						alt="welcome">

				</div>
			</div>
			<!-- END SIGN IN CONTENT -->
			<!-- SIGN UP CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="img sign-up">

					<img src="<c:url value = "/img/undraw_creative_team_r90h.svg"/>"
						alt="welcome">
				</div>
				<div class="text sign-up">
					<h2>Join with us</h2>
					<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.
						Impedit obcaecati, accusantium molestias, laborum, aspernatur
						deserunt officia voluptatum tempora dicta quo ab ullam. Assumenda
						enim harum minima possimus dignissimos deserunt rem.</p>
				</div>
			</div>
			<!-- END SIGN UP CONTENT -->
		</div>
		<!-- END CONTENT SECTION -->
	</div>

	<script src="<c:url value = "/js/login.js"/>"></script>
</body>

</html>
