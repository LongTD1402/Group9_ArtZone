<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/User/layout/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/meta.jsp"></jsp:include>
<title>Products</title>
<jsp:include page="/WEB-INF/views/Admin/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/link_summernote.jsp"></jsp:include>
<script src="${base}/Admin-Resources/js/chart-area-demo.js"></script>
<script src="${base}/Admin-Resources/js/chart-bar-demo.js"></script>
<script src="${base}/Admin-Resources/js/chart-pie-demo.js"></script>
</head>
<body class="sb-nav-fixed">
	<!-- Top_nav -->
	<jsp:include page="/WEB-INF/views/Admin/layout/top_nav.jsp"></jsp:include>
	<!-- /Top_nav -->
	<div id="layoutSidenav">
		<!-- Layout_nav -->
		<jsp:include page="/WEB-INF/views/Admin/layout/layout_nav.jsp"></jsp:include>
		<!-- //Layout_nav -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1 class="mt-4">Tables</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="/index">Dashboard</a></li>
						<li class="breadcrumb-item active">Tables</li>
					</ol>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> DataTable Products
						</div>
						
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>ID</th>
											<th>Name</th>
											<th>Email</th>
											<th>Content</th>
											<th>Time</th>
											<th>Status</th>
											
											<th></th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>ID</th>
											<th>Name</th>
											<th>Email</th>
											<th>Content</th>
											<th>Time</th>
											<th>Status</th>
											<th></th>
										</tr>
									</tfoot>
									<tbody id="list_pro">
										<c:forEach items="${contact }" var="con">
											<tr class="data">
												<th><c:out value="${con.getId() }" /></th>
												<th>${con.full_name }</th>
												<th><c:out value="${con.email }" /></th>
												<th>${con.message }</th>
												<th><c:out
														value="${con.createdDate }" /></th>
												<th>
												 <c:choose>
													<c:when test="${con.status }">
														<span class="badge badge-primary">Wait</span>
													</c:when>
													<c:otherwise>
														<span class="badge badge-warning">Checked</span>
													</c:otherwise>
												</c:choose>
												</th>
												<th><!--  <button type="button" class="btn" onclick="lock_product(${pro.id})">
														<i class="fas fa-lock"></i>
													</button>
													<button type="button" class="btn"
														onclick="DeleteProduct(${pro.id});">
														<i class="far fa-trash-alt"></i>
													</button>-->
													
													<button type="button" class="btn">
														<a href="${base }/Admin/contact_detail?id=${con.id}"><i
															class="far fa-edit"></i></a>
													</button></th>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async
			src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
		<script>
			window.dataLayer = window.dataLayer || [];
			function gtag() {
				dataLayer.push(arguments);
			}
			gtag('js', new Date());

			gtag('config', 'UA-23581568-13');
		</script>
		<script type="text/javascript">
		function DeleteProduct(idPro) {
			// javascript object.
			var data = {
					"id" : idPro,
			};

			// $ === jQuery
			$.ajax({
				url : "/Admin/Delete_product",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),

				dataType : "json",
				success : function(jsonResult) {
					alert('Successfull removed !');
					location.reload();
					
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 
				}
			});
		}
		</script>
		<script type="text/javascript">
		function lock_product(idPro) {
			// javascript object.
			var data = {};

			// $ === jQuery
			$.ajax({
						url : "/Admin/lock_product?idPro=" + idPro,
						type : "post",
						contentType : "application/json",
						data : JSON.stringify(data),

						dataType : "json",
						success : function(jsonResult) {
							if (jsonResult.code == 200) {

								$("#pro_status_" + idPro)
										.html("<span class=\"badge badge-warning\">InActive</span>");
								alert("Successful Lock");

							} else if (jsonResult.code == 300) {

								$("#pro_status_" + idPro)
										.html("<span class=\"badge badge-primary\">Active</span>");
								alert("Successful Unlock");

							} else {
								
								alert(jsonResult.message);
							}
						},
						error : function(jqXhr, textStatus, errorMessage) { // error callback 

						}
					});
		}
	</script>
	</div>

</body>
</html>