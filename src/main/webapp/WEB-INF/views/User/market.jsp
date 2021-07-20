<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Maket</title>
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
	</div>
	<!-- tab -->
<ul class="nav nav-tabs justify-content-center" style="margin-bottom: 15px;margin-left: 15px;">
     <li class="nav-item" >
         <a href="#all" data-toggle="tab" class="nav-link active">All</a>
     </li>

     <li class="nav-item"> 
     	<a href="#latest" data-toggle="tab" class="nav-link">Latest</a>
     </li>

     <li class="nav-item">
         <a href="#following" data-toggle="tab" class="nav-link">Following</a> 
     </li> 
     
      <li class="nav-item">
         <a href="#free" data-toggle="tab" class="nav-link">Free</a> 
     </li>
</ul> 

<!-- Nội dung -->
<div class="tab-content"> 
      <div class="tab-pane container active" id="all" > 
      <div class="list-product container" >
		<div class="row" >
			<c:forEach items="${product }" var="pro">
				<div
					class="product-item col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xl-3">
					<div class="box">
						<a href="${base}/detail/${pro.seo}">
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
						</a>
						<c:choose>
							<c:when test="${isActive }">
								<button class="btn_market btn btn-block btn-md" type="button"
									onclick="Cart.addItemToCart(${pro.id})">
									<i class="fas fa-cart-plus"></i>Add to Cart
								</button>
							</c:when>
							<c:otherwise>
								
									<button class="btn_market btn btn-block btn-md" type="button"
									onclick="alert('Action is invalidated !')" >
										<i class="fas fa-cart-plus"></i>Add to Cart
									</button>
							</c:otherwise>
						</c:choose>
						
						
						
					
					</div>
					<a href="${base}/detail/${pro.seo}">
						<div class="info">
							<span id="art"><c:out
									value="${pro.getCategories().getName() }"></c:out> </span>
							<div id="title-pro">
								<c:out value="${pro.getTitle() }"></c:out>
							</div>
							<div class="short_des">${pro.getShort_description() }
							</div>
							<div class="avar" style="display:flex;">
								<img src="${base }/upload/${pro.user.avatar}" style="width:45px;height:45px; border-radius: 45px;">
								<div style="margin-top: 10px;">
									<a href="#" id="name-nametag">
										<span style="font-size: 18px">${pro.user.fullname }</span>
									</a>
								</div>
							</div>
							<div class="sale_zone">
								<span class="price"> $<c:out value="${pro.getPrice() }"></c:out>
								</span > <span class="discount"> $<c:out
										value="${pro.getPrice_sale() }"></c:out>
								</span>
							</div>
						</div>
					</a>
				</div>
		</c:forEach>
	</div>
	</div>
    </div>
      <div class="tab-pane container fade" id="latest"> 
      	<div class="list-product container" >
		<div class="row" >
			<c:forEach items="${lastestPro }" var="pro">
				<div
					class="product-item col-xs-6 col-sm-6 col-md-6 col-lg-4 col-xl-3">
					<div class="box">
						<a href="${base}/detail/${pro.seo}">
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
						</a>
					
						<button class="btn_market btn btn-block btn-md" type="button"
							onclick="Cart.addItemToCart(${pro.id})">
							<i class="fas fa-cart-plus"></i>Add to Cart
						</button>
						
						<a href="${base }/login">
						<button class="btn_market btn btn-block btn-md" type="button"">
							<i class="fas fa-cart-plus"></i>Add to Cart
						</button></a>
					
					</div>
					<a href="${base}/detail/${pro.seo}">
						<div class="info">
							<span id="art"><c:out
									value="${pro.getCategories().getName() }"></c:out> </span>
							<div id="title-pro">
								<c:out value="${pro.getTitle() }"></c:out>
							</div>
							<div class="short_des">${pro.getShort_description() }
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
								</span > <span class="discount"> $<c:out
										value="${pro.getPrice_sale() }"></c:out>
								</span>
							</div>
						</div>
					</a>
				</div>
		</c:forEach>
	</div>
	</div>
      </div> 
      <div class="tab-pane container fade" id="following"> </p></p></div> 
      <div class="tab-pane container fade" id="free"> </p></p></div> 
</div>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/User/layout/footer.jsp"></jsp:include>
	<!-- /Footer -->
	<!-- Back-to-top -->
	<jsp:include page="/WEB-INF/views/User/layout/back-to-top.jsp"></jsp:include>
	<!-- /back-to-top -->
</body>
</html>