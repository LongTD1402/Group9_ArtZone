<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/Admin/layout/meta.jsp"></jsp:include>
<title>Categories</title>
<jsp:include page="/WEB-INF/views/Admin/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/link_summernote.jsp"></jsp:include>
<script src="${base}/Admin/js/chart-area-demo.js"></script>
<script src="${base}/Admin/js/chart-bar-demo.js"></script>
<script src="${base}/Admin/js/chart-pie-demo.js"></script>
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
							<i class="fas fa-table mr-1"></i> DataTable Categories
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>ID</th>
											<th>Name</th>
											<th>Description</th>
											<th>Parent_id</th>
											<th>Seo</th>
											<th>Status</th>
											<th></th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>ID</th>
											<th>Name</th>
											<th>Description</th>
											<th>Parent_id</th>
											<th>Seo</th>
											<th>Status</th>
											<th></th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach items="${cate }" var="cate">
											<tr class="data">
												<th><c:out value="${cate.getId() }" /></th>
												<th><c:out value="${cate.getName() }" /></th>
												<th><c:out value="${cate.getDescription() }" /></th>
												<th><c:out value="1" /></th>
												<th><c:out value="${cate.getSeo() }" /></th>
												<th><c:out value="${cate.getStatus() }" /></th>
												<th><i class="fas fa-info-circle"></i><i class="far fa-trash-alt"></i><a
													href="/Admin/Edit_category?id=${cate.id }"><i
														class="far fa-edit"></i></a></th>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>ID</th>
											<th>Created date</th>
											<th>Created by</th>
											<th>Updated date</th>
											<th>Updated by</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>ID</th>
											<th>Created date</th>
											<th>Created by</th>
											<th>Updated date</th>
											<th>Updated by</th>
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<th></th>
											<th></th>
											<th></th>
											<th></th>
											<th></th>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
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
	</div>

</body>
</html>
