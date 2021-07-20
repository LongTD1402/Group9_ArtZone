<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Your Profile</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="https://kit.fontawesome.com/95694351a8.js"
	crossorigin="anonymous"></script>
	<script src="${base }/User/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${base }/User/js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" type="text/javascript"></script>
	<link href="${base }/User/css/bootstrap.min.css" rel="stylesheet" type="text/css" type="text/css">
	<link href="${base }/User/css/edit_profile.css" rel="stylesheet" type="text/css" type="text/css">
	<link href="${base }/User/css/header.css" rel="stylesheet" type="text/css" type="text/css">
</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/User/layout/header.jsp"></jsp:include>
	<!-- /Header -->
	<div style="height: 50px;"></div>
	<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            	<img class="mt-5" src="${base }/upload/${user.getAvatar()}" style="width: 90px;height:90px; border-radius: 90px;object-fit: cover;">
            	<span class="font-weight-bold">${user.getFullname()}</span><span class="text-black-50">${user.getEmail() }</span><span>${user.getAddress() }</span>
            </div>
            <div>
            </div>
        </div>
       <c:if test="${not empty inforNull}">
							<h3 class="h4 text-danger">${inforNull }</h3>
		</c:if>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
            <sf:form action="${base }/edit_profile" method="post" modelAttribute="user"
            acceptCharset="utf-8" enctype="multipart/form-data">
            
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h5 class="text-right" ><b>Edit your profile</b></h5>
                </div>
				<sf:hidden path="id" />
				<sf:hidden path="password"/>
				<sf:hidden path="username"/>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Full Name*</label>
                    	<sf:input type="text" path="fullname" class="form-control" placeholder="full name*" /></div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Display Name*</label>
                    	<sf:input type="text" path="displayName" class="form-control" placeholder="full name*"/></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Phone number*</label>
                    	<sf:input type="text" path="phone" class="form-control" placeholder="phone number*"/></div>
                    <div class="col-md-12" data-validate="Valid email is required: ex@abc.xyz"><label class="labels">Email*</label>
                    	<sf:input type="text" path="email" class="form-control" placeholder="email*" /></div>
                    <div class="col-md-12"><label class="labels">Something about you!</label>
                    	<sf:input type="text" path ="des" class="form-control" placeholder="ex:education" /></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6"><label class="labels">Address*</label>
                    	<sf:input type="text" path="address" class="form-control" placeholder="address*"/></div>
                    <div class="col-md-6"><label class="labels">Company</label>
                    	<sf:input type="text" path="company" class="form-control" value="" placeholder="Company"/></div>
                </div>
                <label for="file-input" class=" form-control-label">User avatar</label> 
                	<input type="file" id="file-input" name="userAvatar"
									class="form-control-file">
				<label for="file-input" class=" form-control-label">User background</label> 
					<input type="file" id="file-input" name="userBackground"
									class="form-control-file">
                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
            </sf:form>
            </div>
        </div>
        <div class="col-md-4">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center experience"><span>Edit Experience</span><span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;Experience</span></div>
                <div class="d-flex flex-row mt-3 exp-container">
                    <div class="work-experience ml-1"><span class="font-weight-bold d-block">Senior UI/UX Designer</span><span class="d-block text-black-50 labels">Twitter Inc.</span><span class="d-block text-black-50 labels">March,2017 - May 2020</span></div>
                </div>
                <hr>
                <div class="d-flex flex-row mt-3 exp-container">
                    <div class="work-experience ml-1"><span class="font-weight-bold d-block">Senior UI/UX Designer</span><span class="d-block text-black-50 labels">Facebook Inc.</span><span class="d-block text-black-50 labels">March,2017 - May 2020</span></div>
                </div>
                <hr>
                <div class="d-flex flex-row mt-3 exp-container">
                    <div class="work-experience ml-1"><span class="font-weight-bold d-block">UI/UX Designer</span><span class="d-block text-black-50 labels">Google Inc.</span><span class="d-block text-black-50 labels">March,2017 - May 2020</span></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>