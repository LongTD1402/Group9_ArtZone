<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/User/layout/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/js.jsp"></jsp:include>

<c:forEach items="${products }" var="pro">
	<tr class="data">
		<th id="idPro"><c:out value="${pro.getId() }" /></th>
		<th id="avatarPro"><img src="${base}/upload/${pro.getAvatar() }" style="max-height: 100px;"></th>
		<th id="titlePro"><c:out value="${pro.getTitle() }" /></th>
		<th id="categories_name"><c:out
				value="${pro.getCategories().getName() }" /></th>
		<th id="authorPro"><c:out value="${pro.user.fullname }" /></th>
		<th id="pricePro"><c:out value="${pro.getPrice() }" /></th>
		<th id="priceSalePro"><c:out value="${pro.getPrice_sale() }" /></th>
		<th><button type="button" class="btn">
				<i class="fas fa-info-circle"></i>
			</button>
			<button type="button" class="btn" onclick="DeleteProduct(${pro.id});">
				<i class="far fa-trash-alt"></i>
			</button>
			<button type="button" class="btn">
				<a href="/Edit-product?id=${pro.id }"><i class="far fa-edit"></i></a>
			</button></th>
	</tr>
</c:forEach>