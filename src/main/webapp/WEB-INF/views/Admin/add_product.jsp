<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/Admin/layout/meta.jsp"></jsp:include>
<title>Add products</title>
<jsp:include page="/WEB-INF/views/User/layout/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/link_summernote.jsp"></jsp:include>
<script src="Admin/js/chart-area-demo.js"></script>
<script src="Admin/js/chart-bar-demo.js"></script>
<script src="Admin/js/chart-pie-demo.js"></script>
</head>
<body class="sb-nav-fixed">
	<!-- Top_nav -->
	<jsp:include page="/WEB-INF/views/Admin/layout/top_nav.jsp"></jsp:include>
	<!-- /Top_nav -->
	<div id="layoutSidenav">
		<!-- Layout_nav -->
		<jsp:include page="/WEB-INF/views/Admin/layout/layout_nav.jsp"></jsp:include>
		<!-- //Layout_nav -->
		<div id="layoutSidenav_content" class="add-product">
			<main>
				<div class="card card-outline-secondary my-4">
					<div class="card-header">Add products</div>
					<div class="card-body">
						<sf:form style="width: 80%; margin: auto;" action="/Admin/Add Product"
							method="post" modelAttribute="products" acceptCharset="utf-8"
							enctype="multipart/form-data">
							<sf:hidden path="id" />
							<div class="form-group">
								<label>Category</label>
								<sf:select path="categories.id" class="form-control"
									id="category">
									<sf:options items="${category }" itemValue="id"
										itemLabel="name" />
								</sf:select>
							</div>
							<div class="form-group">
								<label>Title</label>
								<sf:input type="text" class="form-control" path="title"
									placeholder="Enter title" />
							</div>
							<div class="form-group">
								<label>Price</label>
								<sf:input type="text" class="form-control" path="price"
									placeholder="Enter price" />
							</div>
							<div class="form-group">
								<label>Price sale</label>
								<sf:input type="text" path="price_sale" class="form-control"
									placeholder="Enter price_sale" />
							</div>
							<div class="form-group">
								<label>Short description</label>
								<sf:input type="text" path="short_description"
									class="form-control" placeholder="Enter short_description" />
							</div>
							<div class="form-group">
								<label>Detail</label>
								<sf:textarea path="detail_description" placehoder="detail...."
									class="form-control" />
							</div>
							<script>
								$('#detail_description')
										.summernote(
												{
													placeholder : 'detail...',
													tabsize : 2,
													height : 120,
													toolbar : [
															[ 'style',
																	[ 'style' ] ],
															[
																	'font',
																	[
																			'bold',
																			'underline',
																			'clear' ] ],
															[ 'color',
																	[ 'color' ] ],
															[
																	'para',
																	[
																			'ul',
																			'ol',
																			'paragraph' ] ],
															[ 'table',
																	[ 'table' ] ],
															[
																	'insert',
																	[
																			'link',
																			'picture',
																			'video' ] ],
															[
																	'view',
																	[
																			'fullscreen',
																			'codeview',
																			'help' ] ] ]
												});
							</script>

							<img alt="" src="${base }/upload/${products.getAvatar() }"
								style="max-height: 120px;border: 2px solid #a7a7a7;">
							<div class="form-group">
								<label for="file-input" class=" form-control-label">File
									avatar</label> <input type="file" id="file-input" name="productAvatar"
									class="form-control-file">
								<!-- spring boot k ho tro, dung http url use name -->
							</div>
							<c:forEach items="${products.getListImage() }" var="pi">
								<img alt="" src="${base }/upload/${pi.getPath() }"
									style="max-height: 120px;border: 2px solid #a7a7a7;margin-bottom: 5px;">
							</c:forEach>
							<div class="form-group">
								<label for="file-input" class=" form-control-label">File
									images</label> <input type="file" id="file-input" name="productImages"
									multiple="multiple" class="form-control-file">
								<!-- spring boot k ho tro, dung http url use name -->
							</div>
							<div class="form-group form-check">
								<sf:checkbox class="form-check-input" path="is_hot" />
								<label class="form-check-label" for="exampleCheck1">Is
									hot?</label>
							</div>
							<a href="${base }/Admin/Product table"><button type="button"
									class="btn btn-primary bg-dark">Back to list</button></a>
							<button type="submit" class="btn btn-primary">Add</button>
						</sf:form>
					</div>
				</div>
			</main>
		</div>
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async
			src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
		<script>
			window.dataLayer = window.dataLayer || [];
			function gtag() {
				dataLayer.push(arguments);
			}
			gtag('js', new Date());

			gtag('config', 'UA-23581568-13');
		</script>
		
	</div>

</body>
</html>
