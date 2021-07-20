<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/User/layout/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/meta.jsp"></jsp:include>
<title>User detail</title>
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
					<h1 class="mt-4">User</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="/index">Admin</a></li>
						<li class="breadcrumb-item active">Detail</li>
					</ol>
					
					<h3>Id:</h3>
					<p>${userD.id }</p>
					<h3>Created:</h3>
					<p>${userD.getCreatedDate() }</p>
					<div class="row mt-2">
	                    <div class="col-md-3">
	                    	<p><span class="accent">Name: </span>${userD.fullname }</p>
							<p><span class="accent">Email: </span>${userD.email }</p>
						</div>
	                    <div class="col-md-3">
	                    	<p><span class="accent">Phone: </span>${userD.phone }</p>
							<p><span class="accent">Address: </span>${userD.address }</p>
						</div>
						<div class="col-md-3">
							<p><span class="accent">Total products: </span>${userD.listPro.size() }</p>
						</div>
	                </div>
					<form action="${base }/Admin/user_admin_detail" 
					method="post">
					<input type="hidden" value="${userD.id }" name="userId">
						<div class="form-group">
							<label>Add role:</label>
							<select name="roleA">
									<option>null</option>
								<c:forEach items="${roles }" var="ra">
									<option>${ra.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>Remove role:</label>
							<select name="roleR">
									<option>null</option>
								<c:forEach items="${userD.listRoles }" var="rr">
									<option>${rr.name }</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">Save</button>
					</form>
					
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