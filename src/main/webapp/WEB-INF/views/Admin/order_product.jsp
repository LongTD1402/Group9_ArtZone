<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/User/layout/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/meta.jsp"></jsp:include>
<title>Order</title>
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
					<h1 class="mt-4">Sale order product</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="/index">Dashboard</a></li>
						<li class="breadcrumb-item active">Order</li>
					</ol>
					
					<h3>CODE:</h3>
					<p>${saleOr.getCode() }</p>
					<h3>Created:</h3>
					<p>${saleOr.getCreatedDate() }</p>
					<div class="row mt-2">
	                    <div class="col-md-3">
	                    	<p><span class="accent">Name: </span>${saleOr.getCustomer_name() }</p>
							<p><span class="accent">Email: </span>${saleOr.getCustomer_email() }</p>
						</div>
	                    <div class="col-md-3">
	                    	<p><span class="accent">Phone: </span>${saleOr.getCustomer_phone() }</p>
							<p><span class="accent">Address: </span>${saleOr.getCustomer_address() }</p>
						</div>
						<div class="col-md-3">
							<p><span class="accent">Total: </span>$ ${saleOr.getTotal() }</p>
							<p><span class="accent">Total items: </span>${totalItems }</p>
						</div>
	                </div>
					
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> DataTable Sale Order Products
						</div>
						<div class="container mt-5 mb-5">
    <div class="d-flex justify-content-center row">
        <div class="col-md-10">
        <c:forEach items="${listPro }" var="opro">
            <div class="row p-2 bg-white border rounded">
                <div class="col-md-3 mt-1"><img class="img-fluid img-responsive rounded product-image" 
                	src="${base }/upload/${opro.getAvatar()}"></div>
                <div class="col-md-6 mt-1">
                    <h5>${opro.getTitle()}</h5>
                    <div class="d-flex flex-row">
                        <img class="rounded-circle" 
                        		src="${base }/upload/user/default_avatar/—Pngtree—cat default avatar_5416936.png" width="45">
                        		<span style="margin-top: 5px;">${opro.user.fullname }</span>
                    </div>
                    <div class="mt-1 mb-1 spec-1"><h5>${opro.getCategories().getName() }</h5><span class="dot"></span></div>
                    <p class="text-justify text-truncate para mb-0">${opro.getShort_description() }</p>
                </div>
                <div class="align-items-center align-content-center col-md-3 border-left mt-1">
                    <div class="d-flex flex-row align-items-center">
                        <h4 class="mr-1">$ ${opro.getPrice() }</h4><span class="strike-text">$ ${opro.getPrice_sale() }</span>
                    </div>
                    <h6 class="text-success">${stage }</h6>
                    <div class="d-flex flex-column mt-4"><a href="${base}/detail/${opro.seo}"><button class="btn btn-primary btn-sm" type="">Details</button></a></div>
                </div>
            </div>
         </c:forEach>
        </div>
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
