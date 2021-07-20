<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.Group9.ArtZone.Entities.SaleOrder"%>

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
						<li class="breadcrumb-item active">Order</li>
					</ol>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> DataTable Orders
						</div>
						
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr class="top_title">
											<th>ID</th>
											<th>Total</th>
											<th>Customer name</th>
											<th>Phone</th>
											<th>Email</th>
											<th>Address</th>
											<th>Created date</th>
											<th>Status</th>
											<th></th>
										</tr>
									</thead>
									<tfoot>
										<tr class="top_title">
											<th>ID</th>
											<th>Total</th>
											<th>Customer name</th>
											<th>Phone</th>
											<th>Email</th>
											<th>Address</th>
											<th>Created date</th>
											<th>Status</th>
											<th></th>
										</tr>
									</tfoot>
									<tbody id="list_order">
										<c:forEach items="${order }" var="ord">
											<tr class="data">
												<th >${ord.getId() }</th>
												<th >${ord.getTotal() }</th>
												<th >${ord.getCustomer_name() }</th>
												<th>${ord.getCustomer_phone() }</th>
												<th>${ord.getCustomer_email() }</th>
												<th>${ord.getCustomer_address() }</th>
												<th>${ord.getCreatedDate() }</th>
												<th id="saleOrder_status_${ord.id }">
												 <c:choose>
													<c:when test="${ord.status }">
														<span class="badge badge-primary">Active</span>
													</c:when>
													<c:otherwise>
														<span class="badge badge-warning">UnKnown</span>
													</c:otherwise>
												</c:choose>
												</th>
												<th>
													<button type="button" class="btn" onclick="lock_saleOrder(${ord.id});">
													<i class="fas fa-lock"></i></button>
				
													<button type="button" class="btn"
														onclick="DeleteProduct(${pro.id});">
														<i class="fas fa-forward"></i>
													</button>
													
													<button type="button" class="btn">
														<a href="/Admin/check_saleOrder?id=${ord.id }"><i
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
		function lock_saleOrder(saleOrderId) {
			// javascript object.
			var data = {};

			// $ === jQuery
			$.ajax({
						url : "/Admin/lock_saleOrder?saleOrderId=" + saleOrderId,
						type : "post",
						contentType : "application/json",
						data : JSON.stringify(data),

						dataType : "json",
						success : function(jsonResult) {
							if (jsonResult.code == 200) {

								$("#saleOrder_status_" + saleOrderId)
										.html("<span class=\"badge badge-warning\">InActive</span>");
								alert("Successful Lock");

							} else if (jsonResult.code == 300) {

								$("#saleOrder_status_" + saleOrderId)
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
