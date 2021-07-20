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
					<h1 class="mt-4">Contact detail</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="/index">Admin</a></li>
						<li class="breadcrumb-item active">Contact</li>
					</ol>
					
					<h3>Time</h3>
					<p>${con.createdDate }</p>
					<div class="row mt-2">
	                    <div class="col-md-12">
	                    	<p><span class="accent">Name: </span>${con.full_name }</p>
							<p><span class="accent">Email: </span>${con.email }</p>
						</div>
						<div class="col-md-12">
							<p><span class="accent">Content: </span> ${con.message }</p>
						</div>
						<div class="col-md-12">
						
							<a href="${base }/Admin/contact"><button class="btn btn-primary">Done</button></a>
						
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