<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Profile</title>
    <meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/WEB-INF/views/User/layout/variables.jsp"></jsp:include>
<link rel="icon" type="image/png" href="${base}/User/images/icons/favicon.ico" />
<link href="${base}/User/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${base}/User/css/fontawesome-all.min.css">
<link href="${base}/User/css/css.css?family=Open+Sans:400,300,600" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="${base}/User/css/templatemo.css">
<jsp:include page="/WEB-INF/views/User/layout/js.jsp"></jsp:include>
</head>
<body>
<style type="text/css">
    body{
        
        background: #4e4e50;
    }
         .top{
           	background-repeat: no-repeat;
            max-height: 600px;
            width: 110%;
            margin-left: -20px;

        }
        .top .info{
            color: white;
            position: relative;
        }
        .top .info img{
        }
 </style>
    <div class="container-fluid">
        <div class="top" style=" background-image: url('${base }/upload/${user.background }');">
            <div class="col-md-12">
                <div class="info">
                    <div class="d-flex flex-column align-items-center text-center ">
                        <img class=" mt-5" src="${base }/upload/${user.avatar}" 
                        	style="width:150px;height:150px; border-radius: 150px;object-fit: cover;">
                        <span class="font-weight-bold">${user.fullname}</span><span>${user.email}</span><span>${user.address }</span>
                    </div>
                </div>
            </div>
        </div>
        <ul class="nav nav-tabs justify-content-center" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#home">Your products</a>
    </li>
     <li class="nav-item">
      <a class="nav-link " data-toggle="tab" href="#payment">Your payments</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">Followings</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">Attentions</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      <div class="d-flex justify-content-left align-items-center experience">
      <c:choose>
      	<c:when test="${isCollab }">
      		<a href="${base }/add_product"><span class="border add-experience">
      			<i class="fa fa-plus"></i>&nbsp;Product</span></a>
      	</c:when>
      	<c:otherwise>
      		
      	</c:otherwise>
      </c:choose>
      	
      	
      </div>
      	<div class="container">
      		<div class="row">
      		<c:forEach items="${proUser }" var="pro"> 
      		
      			<div class="col-xs-4 col-sm-4 col-md-3 col-lg-2 col-xl-2">
      			<c:choose>
      				<c:when test="${pro.status }">
      					<span class="badge badge-pill badge-success">Active</span>
      				</c:when>
      				<c:otherwise>
      					<span class="badge badge-pill badge-secondary">InActive</span>
      				</c:otherwise>
      			</c:choose>
      				<a href="#"><img alt="" src="${base }/upload/${pro.avatar }" style="z-index: 2;
      				width: 100%;height: 100%;object-fit: cover;"></a>
      			</div>
      		</c:forEach>
      	</div>
    </div>
  </div>
  <div id="payment" class="container tab-pane fade"><br>
      <h3></h3>
      <p></p>
    </div>
    <div id="menu1" class="container tab-pane fade"><br>
      <h3></h3>
      <p></p>
    </div>
    <div id="menu2" class="container tab-pane fade"><br>
      <h3></h3>
      <p></p>
    </div>
  
</div>
    </div>
</body>
</html>