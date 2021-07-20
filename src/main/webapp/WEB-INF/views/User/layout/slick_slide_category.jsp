<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="regular slider">
	<c:forEach items="${category }" var="cate">
		<a href="${base}/category/${cate.seo}"><div class="back"
				style="background-image: url('${base}/upload/${cate.getAvatar()}');background-size: 100% 80px;">
				<span style="color: white;"><c:out value="${cate.getName() }"></c:out></span>
			</div></a>
	</c:forEach>
</section>

