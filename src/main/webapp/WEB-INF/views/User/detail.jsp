<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.Group9.ArtZone.Entities.Users"%>
<%@page
	import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%
String username = null;
Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
if (principal instanceof UserDetails) {
	username = ((Users) principal).getUsername();
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Product detail</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/WEB-INF/views/User/layout/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/User/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/User/layout/js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/User/layout/slick_slide_css_js.jsp"></jsp:include>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/User/layout/header.jsp"></jsp:include>
	<!-- /Header -->
	<!-- Slick-slide -->
	<jsp:include page="/WEB-INF/views/User/layout/slick_slide_category.jsp"></jsp:include>
	<!-- / Slick-slide-->
	<div class="container line-pro"></div>
	<div class="container d-flex flex-wrap mb10 linkzone">
		<div class="mp-navbar-item">
			<a href="#">Market /</a>
		</div>
		<div class="mp-navbar-item">
			<a href="#">${proSeo.getCategories().getName() }/</a>
		</div>
		<div class="mp-navbar-item"></div>
	</div>
	<div class="container-fluid title-pro-zone">
		<span class="title-product"> ${proSeo.title } </span><br> by <span>
			<a href="#">${proSeo.user.fullname }</a>
		</span><span class="level-pro">PRO</span>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-9 col-md-8 ">
				<div class="row">
					<div class="boxx col-xl-12">
					<div class="scroll" style="scroll-snap-type: y mandatory;max-height: 600px;overflow-y: auto;
 							margin-left: auto; margin-right: auto; padding: 1rem; scroll-padding: 2rem;">
						 <div style="margin-bottom: 10px;"> <a href="${base }/upload/${proSeo.avatar}"><img
							src="${base }/upload/${proSeo.avatar} " 
							style="max-height: 500px;" ></a></div>
						<c:forEach items="${proSeo.listImage }" var="listImg">
						<div style="margin-bottom: 10px;"> <a href="${base }/upload/${listImg.path}">
						<img style="max-height: 500px;"
								src="${base }/upload/${listImg.getPath()}"></a></div>
						</c:forEach>
					</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-4 ">
			<div class="scroll" style="scroll-snap-type: y mandatory;max-height: 600px;overflow-y: auto;
 							margin-left: auto; margin-right: auto; padding: 1rem; scroll-padding: 2rem;">
				<div class="artist-info">
					<div class="avar" style="display:flex;">
						<img src="${base }/upload/${proSeo.user.avatar}" style="width: 70px;">
						<div style="margin-top: 7px;">
							<a href="#" id="name-nametag">
								<span style="font-size: 24px">${proSeo.user.fullname }</span>
							</a><br>
							<button class="btn follow" style="margin-left: 0px;">Follow</button>
						</div>
					</div>
					<div class="cont-artist">

						<div class="cont">
							<ul>
								<li><a href="#"><i class="fab fa-facebook"></i>abc</a></li>
								<li><a href="#"><i class="fas fa-at"></i>sfa@gmail.com</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="pro-info">
					<div class="price_sale">
						<span class="pro_price"> &nbsp;&nbsp;&nbsp;USD $<span>${proSeo.price }</span>
						</span>&nbsp;&nbsp;&nbsp; <span class="old_price"> USD $<span>${proSeo.price_sale }</span>
						</span>
					</div>
					<div class="me">
						<div class="add_cart">
							
							<%
								if (username != null) {
								%>
								<button class="btn_market btn btn-block btn-md btn-success" type="button"
									onclick="Cart.addItemToCart(${proSeo.id})">
									<i class="fas fa-cart-plus"></i>Add to Cart
								</button>
								<%
								} else {
								%>
								<a href="${base }/login">
								<button class="btn_market btn btn-block btn-md" type="button"">
									<i class="fas fa-cart-plus"></i>Add to Cart
								</button></a>
								<%
								}
							%>
							
						</div>
						<div class="buy-now">
							<button class="btn btn-success btn-block btn-md" type="button">
								<i class="far fa-clipboard"></i>Note
							</button>
						</div>
					</div>
					<div class="rate">
						<div class="star">
							<i class="fas fa-star"></i><span>5</span>
						</div>
						<div class="sold">
							<i class="fas fa-hand-holding-usd"></i><span>12</span>
						</div>
						<div class="liked">
							<i class="far fa-heart"></i><span>19</span>
						</div>
					</div>
				</div>
				<div class="pro-detail">
					<div class="form-group">
					  <label style="font-style:italic;" >Comment</label>
					  <input type="text" class="form-control" style="width: 80%;margin-left: 5px;" value="...">
					</div>
				</div>
				</div>
				
			</div>
			<div class="col-xl-9 col-md-8 " >
			<div style="padding-left: 20px">
				${proSeo.detail_description }</div>
			</div>
		</div>
	</div>
	<footer class="bg-dark" id="tempaltemo_footer">
		<div class="container">
			<div class="row">

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-success border-bottom pb-3 border-light logo">ArtZone</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><i class="fas fa-map-marker-alt fa-fw"></i> Hanoi</li>
						<li><i class="fa fa-phone fa-fw"></i> <a
							class="text-decoration-none" href="tel:0123456789">0123456789</a>
						</li>
						<li><i class="fa fa-envelope fa-fw"></i> <a
							class="text-decoration-none" href="mailto:info@company.com">abc@gmail.com</a>
						</li>
					</ul>
				</div>

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><a class="text-decoration-none" href="#">All</a></li>
						<li><a class="text-decoration-none" href="#">Tutorials</a></li>
						<li><a class="text-decoration-none" href="#">Game Assets</a></li>
						<li><a class="text-decoration-none" href="#">Brushes</a></li>
						<li><a class="text-decoration-none" href="#">Artworks</a></li>
						<li><a class="text-decoration-none" href="#">Books&Comics</a></li>
					</ul>
				</div>

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-light border-bottom pb-3 border-light">Further
						Info</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><a class="text-decoration-none" href="#">Home</a></li>
						<li><a class="text-decoration-none" href="#">About Us</a></li>
						<li><a class="text-decoration-none" href="#">Contact</a></li>
					</ul>
				</div>

			</div>

			<div class="row text-light mb-4">
				<div class="col-12 mb-3">
					<div class="w-100 my-3 border-top border-light"></div>
				</div>
				<div class="col-auto me-auto">
					<ul class="list-inline text-left footer-icons">
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="http://facebook.com/"><i
								class="fab fa-facebook-f fa-lg fa-fw"></i></a>
						</li>
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://www.instagram.com/"><i
								class="fab fa-instagram fa-lg fa-fw"></i></a>
						</li>
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://twitter.com/"><i
								class="fab fa-twitter fa-lg fa-fw"></i></a>
						</li>
						<li
							class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
							href="https://www.linkedin.com/"><i
								class="fab fa-linkedin fa-lg fa-fw"></i></a>
						</li>
					</ul>
				</div>
				<div class="col-auto">
					<label class="sr-only" for="subscribeEmail">Email address</label>
					<div class="input-group mb-2">
						<input type="text" class="form-control bg-dark border-light"
							id="subscribeEmail" placeholder="Email address">
						<div class="input-group-text btn-success text-light">Subscribe</div>
					</div>
				</div>
			</div>
		</div>

		<div class="w-100 bg-black py-3">
			<div class="container">
				<div class="row pt-2">
					<div class="col-12">
						<p class="text-left text-light">
							Copyright &copy; 2021 -self | Designed by <a rel="sponsored"
								href="#" target="_blank">GonL</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>