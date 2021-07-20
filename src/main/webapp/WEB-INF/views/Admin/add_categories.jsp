<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/Admin/layout/meta.jsp"></jsp:include>
<title>Add Categories</title>
<jsp:include page="/WEB-INF/views/Admin/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/Admin/layout/js.jsp"></jsp:include>
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
					<div class="card-header">Add new category</div>
					<div class="card-body">
						<sf:form style="width: 80%; margin: auto;"
							action="/Admin/Add_category" method="post"
							modelAttribute="category" acceptCharset="utf-8"
							enctype="multipart/form-data">
							<sf:hidden path="id" />
							<div class="form-group">
								<label>Name</label>
								<sf:input type="text" class="form-control" path="name"
									placeholder="Enter name" />
							</div>
							<div class="form-group">
								<label>Parent</label>
								<sf:select path="parent.id" class="form-control" id="category">
									<sf:options items="${categories }" itemValue="id"
										itemLabel="name" />
								</sf:select>
							</div>
							<div class="form-group">
								<label>Seo</label>
								<sf:input type="text" class="form-control" path="seo"
									placeholder="Enter seo" />
							</div>
							<div class="form-group">
								<label>Description</label>
								<sf:input type="text" class="form-control" path="description"
									placeholder="Enter description" />
							</div>
							<img alt="" src="${base }/upload/${category.getAvatar() }"
								style="max-height: 120px; border: 2px solid #a7a7a7;">
							<div class="form-group">
								<label for="file-input" class=" form-control-label">File
									avatar</label> <input type="file" id="file-input" name="categoryAvatar"
									class="form-control-file">
							</div>

							<a href="${base }/Admin/Category_table"><button type="button"
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
