<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>
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
			<c:if test="${not empty NFullname}">
				<h3 class="h4 text-danger">${NFullname }</h3>
			</c:if>
			<c:if test="${not empty NEmail}">
				<h3 class="h4 text-danger">${NEmail }</h3>
			</c:if>
			<c:if test="${not empty NMess}">
				<h3 class="h4 text-danger">${NMess }</h3>
			</c:if>
				<sf:form class="contact2-form validate-form" method="post"
					action="/Contact Us-SPForm" accept-charset="utf-8" 
					modelAttribute="contact">
					<span class="contact2-form-title"> Contact Us</span>

					<div class="wrap-input2 validate-input"
						data-validate="Name is required">
						<sf:input class="input2" type="text" path="full_name" />
						<span class="focus-input2" data-placeholder="FULL NAME"></span>
					</div>

					<div class="wrap-input2 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<sf:input class="input2" type="email" path="email" />
						<span class="focus-input2" data-placeholder="EMAIL"></span>
					</div>

					<div class="wrap-input2 validate-input"
						data-validate="Message is required">
						<sf:textarea class="input2" path="message" ></sf:textarea>
						<span class="focus-input2" data-placeholder="MESSAGE"></span>
					</div>

					<div class="container-contact2-form-btn">
						<div class="wrap-contact2-form-btn">
							<div class="contact2-form-bgbtn"></div>
							<button class="contact2-form-btn" type="submit">Send Your Message</button>
						</div>
					</div>
					<div class="back_artzone">
						<a href="index"><i class="fas fa-angle-double-right"></i>&nbsp;<i
							class="fas fa-home"></i>&nbsp;&nbsp;ArtZone</a>
					</div>
				</sf:form>
			</div>
		</div>
	</div>
</body>
</html>