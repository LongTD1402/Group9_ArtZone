<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>ArtZone</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/WEB-INF/views/User/layout/variables.jsp"></jsp:include>
<link rel="icon" type="image/png" href="${base}/User/images/icons/favicon.ico" />
<jsp:include page="/WEB-INF/views/User/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/User/layout/js.jsp"></jsp:include>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/User/layout/header.jsp"></jsp:include>
	<!-- /Header -->
	<div style="height: 15px"></div>
	<div class="container-fluid after_fixed">
		<div class="row">
			<div class="col">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="User/images/learning1.jpg"
								alt="First slide">
							<div class="carousel-caption d-none d-md-block">
								<h2>Anatomy HelpBrushes [ 300 CHETBRUSHES to Push Anatomy
									skills ]</h2>
								<p>Special Offer! Get 15% off when you buy 2 products. Get
									20% off when you by 3 or more products</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="User/images/Untitled1.png"
								alt="Second slide">
							<div class="carousel-caption d-none d-md-block">
								<h2>BRUSHPACK - from Winter Scene tutorial</h2>
								<p>Recommend this product and earn at least 15% commission</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="User/images/learning3.jpg"
								alt="Third slide">
							<div class="carousel-caption d-none d-md-block">
								<h2>How to draw a digital art?</h2>
								<p>Come here</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="trending container">
		<i class="fas fa-star"></i>&nbsp;&nbsp;<a href="#">Trending</a> 
	</div>
	<div class="list-product container">
		<div class="row">
			<c:forEach items="${hotPro }" var="pro">
				<div
					class="product-item col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xl-3">
					<div class="box">
						<a href="${base}/detail/${pro.seo}">
							<div class="image">
								<div class="view">View</div>
								<div class="is_hot">Trending</div>
								<img src="${base}/upload/${pro.getAvatar() }">

							</div>
							<div class="info">
								<span id="art"><c:out
										value="${pro.getCategories().getName() }"></c:out></span>
								<div id="title-pro">
									<c:out value="${pro.getTitle() }"></c:out>
								</div>
								<div class="avar" style="display:flex;">
									<img src="${base }/upload/${pro.user.avatar}" style="width: 45px;">
									<div style="margin-top: 10px;">
										<a href="#" id="name-nametag">
											<span style="font-size: 18px">${pro.user.fullname }</span>
										</a>
									</div>
								</div>
								<div class="sale_zone">
									<span class="price"> $<c:out value="${pro.getPrice() }"></c:out>
									</span> <span class="discount"> $<c:out value="${pro.getPrice_sale() }"></c:out> </span>
								</div>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="trending container">
		<i class="fas fa-cubes"></i>&nbsp;&nbsp;<a href="#">All product</a> 
	</div>
	<div class="list-product container">
		<div class="row">
			<c:forEach items="${product }" var="pro">
				<div
					class="product-item col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xl-3">
					<div class="box">
						<a href="#">
							<div class="image">
								<div class="view">View</div>
								<c:choose>
									<c:when test="${pro.is_hot }">
										<div class="is_hot">Hot</div>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
								<img src="${base}/upload/${pro.getAvatar() }">

							</div>
							<div class="info">
								<span id="art"><c:out
										value="${pro.getCategories().getName() }"></c:out></span>
								<div id="title-pro">
									<c:out value="${pro.getTitle() }"></c:out>
								</div>
								<div class="avar" style="display:flex;">
									<img src="${base }/upload/${pro.user.avatar}" style="width: 45px;">
									<div style="margin-top: 10px;">
										<a href="#" id="name-nametag">
											<span style="font-size: 18px">${pro.user.fullname }</span>
										</a>
									</div>
								</div>
								<div class="sale_zone">
									<span class="price"> $<c:out value="${pro.getPrice() }"></c:out>
									</span> <span class="discount"> <c:out value="${pro.getPrice_sale() }"></c:out> </span>
								</div>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/User/layout/footer.jsp"></jsp:include>
	<!-- /Footer -->
	<!-- Back-to-top -->
	<jsp:include page="/WEB-INF/views/User/layout/back-to-top.jsp"></jsp:include>
	<!-- /back-to-top -->
</body>
</html>