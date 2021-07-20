<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="main_navbar navbar navbar-expand-md navbar-dark fixed-top">
	<a class="navbar-brand" href="/index">ArtZone</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#my-nav-bar" aria-controls="my-nav-bar"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse show " id="my-nav-bar">
		<ul class="navbar-nav flex-row flex-wrap bd-navbar-nav pt-2 py-md-0">
			<li class="nav-item col-6 col-md-auto active">
				<div class="line0"></div>
				<div class="line"></div> <a class="nav-link" href="${base}/index"><i
					class="fas fa-home"></i>&nbsp;&nbsp;Home</a>
			</li>
			<li class="nav-item col-6 col-md-auto active">
				<div class="line0"></div>
				<div class="line"></div> <a class="nav-link" href="${base}/market"><i
					class="fas fa-comments-dollar"></i>&nbsp;&nbsp;Market</a>
			</li>
			<li class="nav-item col-6 col-md-auto active">
				<div class="line0"></div>
				<div class="line"></div> <a class="nav-link" href="#"><i
					class="fas fa-graduation-cap"></i>&nbsp;&nbsp;Learning</a>
			</li>
			<li class="nav-item col-6 col-md-auto active">
				<div class="line0"></div>
				<div class="line"></div> <a class="nav-link" href="#"><i
					class="fas fa-gift"></i>&nbsp;&nbsp;Jobs</a>
			</li>
			<c:choose>
				<c:when test="${isAdmin }">
					<li class="nav-item col-6 col-md-auto active">
						<div class="line0"></div>
						<div class="line"></div> <a class="nav-link" href="${base }/Admin">
						<i class="fas fa-key"></i>&nbsp;&nbsp;Admin</a>
					</li>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
		</ul>
		<hr class="d-md-none text-white-50">
		<ul class="navbar-nav flex-row flex-wrap ms-md-auto">
			<form class="form-inline my-2 my-lg-0" action="${base }/search"
				method="get">
				<div class="input-group-append">

					<button type="button" class="btn btn-secondary btn-number">
						<i class="fa fa-search"></i>
					</button>
				</div>
				<div class="input-group input-group-sm">
					<input type="text" class="form-control" placeholder="Search..."
						name="searchText">

				</div>
			</form>
		</ul>
		<hr class="d-md-none text-white-50">
		<ul class="navbar-nav flex-row flex-wrap ms-md-auto">
			<li class="nav-item dropdown active" id="it1">
				<%
				if (username != null) {
				%>
				<a style="margin-top: -7px;" class="nav-link dropdown-toggle "
					id="userDropdown" href="#" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">
					<img class="img-fluid img-responsive  product-image" 
		                	src="${base }/upload/${userLogined.getAvatar()}" style="width: 40px;height:40px; border-radius: 40px;object-fit: cover;margin-right: 5px;"><span>${userLogined.getDisplayName() }</span></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="${base }/profile"><span style="font-weight: bold;">${userLogined.getFullname() }</span> </a><a
							class="dropdown-item" href="${base }/edit_profile">Edit profile</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="${base }/logout">Logout</a>
				</div>
				 <%
 } else {
 %>
				<div class="nav-item dropdown active">
					<a class="btn btn-sm ml-3 nav-link dropdown-toggle p-2" href="#"
						id="mydropdown" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-user-circle"></i>
					</a>
					<div class="dropdown-menu" aria-labelledby="mydropdown">
						<a class="dropdown-item" href="${base}/login">Sign in</a>
						<a class="dropdown-item" href="${base}/signup">Sign up</a>
					</div>
				</div>
				<%
				}
				%>

			</li>
			<li class="nav-item active" id="it1"><a
				class="btn btn-sm ml-3 nav-link p-2" href="/cart"> <i
					class="fa fa-shopping-cart"></i>&nbsp;<span id="totalItemsInCart"
					class="badge badge-light">${totalItems }</span>
			</a></li>
		</ul>
	</div>
</nav>