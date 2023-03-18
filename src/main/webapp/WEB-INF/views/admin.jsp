<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>SB Admin 2 - Tables</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />

<!-- Custom styles for this template -->
<link href='<c:url value = "/css/sb-admin-2.min.css"/>' rel="stylesheet" />

<!-- Custom styles for this page -->
<link href='<c:url value = "/css/dataTables.bootstrap4.min.css"/>'
	rel="stylesheet" />


</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<c:import url="/WEB-INF/views/layout/admin-topnav.jsp"></c:import>

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<form method="post" action="/add-product" class="mb-3"
						enctype="application/x-www-form-urlencoded">
						<div class="form-row" style="align-items: center;">
							<div class="form-group col-md-4">
								<label for="inputEmail4">Tên sản phẩm</label> <input type="text"
									required name="name" class="form-control" id="inputEmail4"
									placeholder="Tên sản phẩm">
							</div>
							<div class="form-group col-md-3 ">
								<label for="inputPassword4">Số lượng</label> 
								<input
									type="number" class="form-control" id="inputPassword4" required
									name="quantity" placeholder="ex:0,1..">
							</div>
							<div class="form-group col-md-3">
							<label for="select-group">Danh mục</label> 
								<select class="form-control form-select mb-0" style="width: 100%" required
									aria-label="Default select example" name="categoryID" id="select-group">
									<option disabled selected>Chọn danh mục</option>

									<c:forEach var="c" items="${categories}">
										<option value="${c.id}">${c.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-md-2">
								<label for="inputAddress">Price</label> 
								<input class="form-control" id="inputAddress" type="text"
									name="price" pattern="\d+(\.\d{1,2})?" required
									placeholder="ex: 10.99, 20.99">
							</div>
						</div>
						<div class="form-group col-md-12">
							<label for="inputAddress">Mô tả</label>
							<textarea required style="width: 100%; padding: 10px"
								name="description" placeholder="Mô tả"></textarea>
						</div>
						<div class="form-group">
							<label for="inputAddress2">Link ảnh</label> <input type="text"
								name="thumbnail" class="form-control" id="inputAddress2"
								placeholder="Apartment, studio, or floor">
						</div>
						<button type="submit" class="btn btn-primary ml-auto">
						Thêm sản phẩm</button>
					</form>



					<!-- Page Heading -->

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">DataTables
								Example</h6>
						</div>
						<form action = "/admin">
							<div class="form-group col-md-2">
								<label for="exampleInputEmail1">Search: </label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="ex: Túi.." name = "name">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
						</form>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Name</th>
											<th>Description</th>
											<th>Price</th>
											<th>Supplier</th>
											<th>Quantity</th>
											<th>Price</th>
										</tr>
									</thead>
									<tfoot>
										<c:forEach begin="1" end="${totalPage}" var="p">
											<a href="?page=${p}">${p}</a>
										</c:forEach>
									</tfoot>
									<tbody>
										<c:forEach var="p" items="${products}">
											<tr>
												<td>${p.name}</td>
												<td>${p.description }</td>
												<td>${p.price}</td>
												<td>${p.supplier}</td>
												<td>${p.quantity }</td>
												<td>${p.price }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="/logout">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src='<c:url value = "/js/jquery.min.js" />'></script>


	<script src='<c:url value = "/js/bootstrap.bundle.min.js" />'></script>
	<!-- Core plugin JavaScript-->
	<script src='<c:url value = "/js/jquery.easing.min.js" />'></script>
	<!-- Custom scripts for all pages-->
	<script src='<c:url value = "/js/sb-admin-2.min.js" />'></script>
	<!-- Page level plugins -->
	<script src='<c:url value = "/js/jquery.dataTables.min.js" />'></script>
	<script src='<c:url value = "/js/dataTables.bootstrap4.min.js" />'></script>
	<!-- Page level custom scripts -->
	<script src='<c:url value = "/js/datatables-demo.js" />'></script>
	​
	<script type="text/javascript">
		setTimeout(()=> {
			document.querySelector(".pagination").style.display = 'none';
			document.querySelector("#dataTable_filter").style.display = 'none';
		}, 200) 
	</script>

</body>
</html>
