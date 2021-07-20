<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign up</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/User/layout/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/User/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/User/layout/css_form.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/User/layout/js.jsp"></jsp:include>
</head>
<body>
	<div class="bg-contact2"
		style="background-image: url('User/images/ya-lun-1.jpg');">
		<div class="container-contact2">
			<div class="wrap-contact2">
				<form class="contact2-form validate-form"  action="${base}/signup" method="POST">
					<span class="contact2-form-title"> SIGN UP </span>
					<div class="wel">
						<h4>
							<i class="far fa-handshake"></i>Welcome to ArtZone!
						</h4>
						<c:if test="${not empty NEmailE}">
							<h3 class="h4 text-danger">${NEmailE }</h3>
						</c:if>
						<c:if test="${not empty EmailE}">
							<h3 class="h4 text-danger">${EmailE }</h3>
						</c:if>
						<c:if test="${not empty repassE}">
							<h3 class="h4 text-danger">${repassE }</h3>
						</c:if>
						<c:if test="${not empty NUserNE}">
							<h3 class="h4 text-danger">${NUserNE }</h3>
						</c:if>
						<c:if test="${not empty NPassE}">
							<h3 class="h4 text-danger">${NPassE }</h3>
						</c:if>
						<c:if test="${not empty registerSuccess}">
							<h3 class="h4 text-primary">${registerSuccess}</h3>
						</c:if>
					</div>
					<div class="wrap-input2 validate-input"
						data-validate="Name is required">
						<input class="input2" type="text" name="username"> <span
							class="focus-input2" data-placeholder="User name*"></span>
					</div>
					<div class="wrap-input2 validate-input">
						<input class="input2" type="text" name="password"> <span
							class="focus-input2" data-placeholder="Password*"></span>
					</div>
					<div class="wrap-input2 validate-input">
						<input class="input2" type="text" name="confirmPassword">
						<span class="focus-input2" data-placeholder="Comfirm password*"></span>
					</div>
					<div class="wrap-input2 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input2" type="text" name="email"> <span
							class="focus-input2" data-placeholder="EMAIL*"></span>
					</div>
					<div class="wrap-input2 validate-input"
						data-validate="Name is required">
						<input class="input2" type="text" name="display_name"> <span
							class="focus-input2" data-placeholder="Display name"></span>
					</div>
					<div class="container-contact2-form-btn">
						<div class="wrap-contact2-form-btn">
							<div class="contact2-form-bgbtn"></div>
							<button class="contact2-form-btn">SIGN UP</button>
						</div>
					</div>
					<div class="container-contact2-form-btn">
						<div class="wrap-contacst2-form-btn">
							<div class="contact2-form-bgbtn"></div>
							<button class="contact2-form-btn btnfb">
								<i class="fab fa-facebook"></i>SIGN UP with Facebook
							</button>
						</div>
					</div>
					<div class="forgot">
						<span id="forgot"><a href="#"><i class="fas fa-circle"></i>Terms
								of Service and Privacy Policy!</a></span> <span id="orSignup"><a
							href="signin">SIGN IN</a></span>
					</div>
					<div class="back_artzone">
						<a href="index"><i class="fas fa-arrow-left"></i><i
							class="fas fa-home"></i>ArtZone</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>