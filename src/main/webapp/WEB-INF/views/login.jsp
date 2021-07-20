<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign in</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/User/layout/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/User/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/User/layout/css_form.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/User/layout/js.jsp"></jsp:include>
</head>
<body>
	<div class="bg-contact2"
		style="background-image: url('User/images/song-nan-li-yone-and-riven.jpg');">
		<div class="container-contact2">
			<div class="wrap-contact2">
				<form method="POST" action="/perform_login"
					class="contact2-form validate-form">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<c:if test="${not empty param.login_error}">
						<div class="alert alert-danger" role="alert">Login attempt
							was not successful, try again!!!</div>
					</c:if>
					<span class="contact2-form-title"> SIGN IN </span>

					<div class="wrap-input2 validate-input"
						data-validate="Name is required">
						<input class="input2" type="text" name="username"> <span
							class="focus-input2" data-placeholder="User name"></span>
					</div>

					<div class="wrap-input2 validate-input">
						<input class="input2" type="password" name="password"> <span
							class="focus-input2" data-placeholder="Password"></span>
					</div>
					<div class="container-contact2-form-btn">
						<div class="wrap-contact2-form-btn">
							<div class="contact2-form-bgbtn"></div>
							<button class="contact2-form-btn">SIGN IN</button>
						</div>
					</div>
					<div class="container-contact2-form-btn">
						<div class="wrap-contacst2-form-btn">
							<div class="contact2-form-bgbtn"></div>

						</div>
					</div>
					<div class="forgot">
						<span id="forgot"><a href="#"><i class="fas fa-circle">&nbsp;</i>Forgot
								password?</a></span><span id="orSignup"><a href="${base }/signup">SIGN UP</a></span>
					</div>
					<div class="back_artzone">
						<a href="index"><i class="fas fa-angle-double-right"></i><i
							class="fas fa-home"></i>ArtZone</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>