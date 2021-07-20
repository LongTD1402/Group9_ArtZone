<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!-- TagLibs -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
<title>Cart</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/WEB-INF/views/User/layout/variables.jsp"></jsp:include>
<link href="${base }/User/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="css/fontawesome-all.min.css">
<link href="${base }/User/css/style.css" rel="stylesheet" type="text/css">
<link href="${base }/User/css/cart.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="User/css/templatemo.css">
<script src="https://kit.fontawesome.com/95694351a8.js"
	crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/Admin/layout/js.jsp"></jsp:include>
<script src="${base }/User/js/popper.min.js" type="text/javascript"></script>
<script src="${base }/User/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${base }/User/js/templatemo.js" type="text/javascript"></script>
<script src="${base }/User/js/templatemo.min.js" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/95694351a8.js"
	crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<link href="${base }/User/css/bootstrap.min.css" rel="stylesheet" type="text/css" type="text/css">
<link href="${base }/User/css/edit_profile.css" rel="stylesheet" type="text/css" type="text/css">
<link href="${base }/User/css/style.css" rel="stylesheet" type="text/css" type="text/css">
</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/User/layout/header.jsp"></jsp:include>
	<!-- /Header -->
	<div class="container line-pro"></div>
	<div class="container d-flex flex-wrap mb10 linkzone"
		style="margin-top: 100px;">
		<div class="mp-navbar-item">
			<a href="#">Home /</a>
		</div>
		<div class="mp-navbar-item">
			<a href="#">Cart </a>
		</div>
		<div class="mp-navbar-item">
			<a href="#"></a>
		</div>
		<div class="mp-navbar-item"></div>
	</div>
	<div class="card">
		<div class="row">
			<div class="col-md-8 cart">
				<div class="title">
					<div class="row">
						<div class="col">
							<h4>
								<b>Your Cart</b>
							</h4>
						</div>
						<div id="totalItemsInCart" class="col align-self-center text-right text-muted">${totalItems }
							<span>items</span></div>
					</div>
				</div>
					<c:if test="${not empty cartNull}">
							<h3 class="h4 text-danger">${cartNull }</h3>
					</c:if>
					<c:if test="${not empty inforNull}">
							<h3 class="h4 text-danger">${inforNull } <a href="${base }/edit_profile">
							<button class=" profile-button">Edit Profile</button></a></h3>	
					</c:if>
				<c:forEach items="${cart.cartItems}" var="item" varStatus="loop">
				
				<div class="row border-top border-bottom">
					<div class="row main align-items-center">
						<div class="col-2">
							<img class="img-fluid" src="${base }/upload/${item.avatar}">
						</div>
						<div class="col">
							<div class="row text-muted">${item.category }</div>
							<a  href="${base}/detail/${item.seo}"><div class="row">${item.productName }</div></a>
						</div>
						<div class="col">
							${item.priceUnit } <button  type="button" class="btn1 btn-outline-light" 
							style="float: right;border: none;" onclick="DeleteItemInCart(${item.productId})">
							<span class="close">&#10005;</span></button> 
						</div>
					</div>
				</div>
				
				</c:forEach>
				<div class="back-to-shop">
					<a href="${base }/market">&leftarrow;<span class="text-muted">Back to
						Market</span></a>
				</div>
			</div>
			<div class="col-md-4 summary">
				<div>
					<h5>
						<b>Summary</b>
					</h5>
				</div>
				<hr>
				<div class="row">
					<div class="col" style="padding-left: 0;">${totalItems } ITEMS </div>
					<div class="col text-right"><span>$</span> ${totalPrice }</div>
				</div>
				<form>
					<p>GIVE CODE</p>
					<input id="code" placeholder="Enter your code">
				</form>
				<div class="row"
					style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
					<div class="col">TOTAL PRICE</div>
					<div class="col text-right"><span>$</span> ${totalPrice }</div>
				</div>
				<%
						if (username != null) {
						%>
						<form action="${base }/cart_payment" method="post"><button class="btn">CHECKOUT</button></form>
						<%
						} else {
						%>
						<a href="${base }/login"><button class="btn">CHECKOUT</button></a>
						<%
						}
						%>
				
			</div>
			<div class="col-md-12 border-right" style="background: white;border-top: 2px solid #b55c5b">
            <div class="p-3 py-2">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h5 class="text-right" ><b>Your information</b></h5>
                </div>
                <div class="row mt-2">
                    <div class="col-md-3"><label class="labels">Full Name*</label>
                    	<input type="text" class="form-control" placeholder="full name*" value="${user.getFullname() }"></div>
                    <div class="col-md-3"><label class="labels">Address*</label>
                    	<input type="text" class="form-control" placeholder="address*" value="${user.getAddress() }"></div>
                    <div class="col-md-3"><label class="labels">Phone number*</label>
                    	<input type="text" class="form-control" placeholder="phone number*" value="${user.getPhone() }"></div>
                    <div class="col-md-3" data-validate="Valid email is required: ex@abc.xyz"><label class="labels">Email*</label>
                    	<input type="text" class="form-control" placeholder="email*" value="${user.getEmail() }"></div>
                </div>
                <div class="mt-1 text-center"><a href="${base }/edit_profile"><button class=" profile-button">Edit Profile</button></a></div>
            </div>
        </div>
		</div>
	</div>
	<script type="text/javascript">
	function DeleteItemInCart(productId){
		// javascript object.
		var data = {};
		data["productId"] = productId;
		$.ajax({
			url : "/cart_delete",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),

			dataType : "json",
			success : function(jsonResult) {
				$("#totalItemsInCart").html(jsonResult.totalItems);
				alert('Successfull removed !');
				location.reload();
			},
			error : function(jqXhr, textStatus, errorMessage) { // error callback 

			}
		});
	}
	</script>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/User/layout/footer.jsp"></jsp:include>
	<!-- /Footer -->
	<!-- Back-to-top -->
	<jsp:include page="/WEB-INF/views/User/layout/back-to-top.jsp"></jsp:include>
	<!-- /back-to-top -->
</body>