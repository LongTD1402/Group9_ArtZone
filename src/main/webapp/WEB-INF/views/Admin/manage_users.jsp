<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/User/layout/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/meta.jsp"></jsp:include>
<title>Manage User</title>
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
						<li class="breadcrumb-item"><a href="/index">Admin</a></li>
						<li class="breadcrumb-item active">Tables</li>
					</ol>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> DataTable User
						</div>
						
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>ID</th>
											<th>Avatar</th>
											<th>Name</th>
											<th>Email</th>
											<th>Phone</th>
											<th>Roles</th>
											<th>Status</th>
											
											<th></th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>ID</th>
											<th>Avatar</th>
											<th>Name</th>
											<th>Email</th>
											<th>Phone</th>
											<th>Roles</th>
											<th>Status</th>
											
											<th></th>
										</tr>
									</tfoot>
									<tbody id="list_pro">
										<c:forEach items="${users }" var="u">
											<tr class="data">
												<th><c:out value="${u.getId() }" /></th>
												<th><img
													src="${base}/upload/${u.getAvatar() }"
													style="width: 60px;height:60px; border-radius: 60px;object-fit: cover;"></th>
												<th ><c:out value="${u.fullname }" /></th>
												<th><c:out
														value="${u.email }" /></th>
												<th><c:out value="${u.phone }" /></th>
												<th>
													<c:forEach items="${u.listRoles }" var="r">
														+ ${r.name }<br>
													</c:forEach>
												</th>
												<th id="user_status_${u.id }">
												 <c:choose>
													<c:when test="${u.status }">
														<span class="badge badge-primary">Active</span>
													</c:when>
													<c:otherwise>
														<span class="badge badge-warning">InActive</span>
													</c:otherwise>
												</c:choose>
												</th>
												<th><button type="button" class="btn" onclick="lock_user(${u.id})">
														<i class="fas fa-lock"></i>
													</button>
													<button type="button" class="btn">
														<a href="${base }/Admin/user_admin_detail?id=${u.id }"><i
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
		function lock_user(idUser) {
			// javascript object.
			var data = {};

			// $ === jQuery
			$.ajax({
						url : "/Admin/lock_user?idUser=" + idUser,
						type : "post",
						contentType : "application/json",
						data : JSON.stringify(data),

						dataType : "json",
						success : function(jsonResult) {
							if (jsonResult.code == 200) {

								$("#user_status_" + idUser)
										.html("<span class=\"badge badge-warning\">InActive</span>");
								alert("Successful Lock");

							} else if (jsonResult.code == 300) {

								$("#user_status_" + idUser)
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
