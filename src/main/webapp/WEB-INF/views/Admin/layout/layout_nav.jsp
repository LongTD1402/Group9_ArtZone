<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">Core</div>
				<a class="nav-link" href="${base }/Admin">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> Admin
				</a>
				
				<div class="sb-sidenav-menu-heading">Addons</div>
				<a class="nav-link" href="${base }/Admin/Page_Order">
					<div class="sb-nav-link-icon">
						<i class="fas fa-chart-area"></i>
					</div> Order
				</a> <a class="nav-link collapsed" href="#" data-toggle="collapse"
					data-target="#collapseTables" aria-expanded="false"
					aria-controls="collapseTables">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> Tables
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseTables"
					aria-labelledby="headingOne" data-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="${base}/Admin/Category_table">Categories</a> <a
							class="nav-link" href="${base }/Admin/contact">Contact</a> <a class="nav-link"
							href="${base}/Admin/Product table">Products</a> <a
							class="nav-link" href="${base }/Admin/Manage_User">Users</a> 
							<a class="nav-link" href="#">Roles</a>
						<a class="nav-link" href="#">Jobs</a>

					</nav>
				</div>
				<div class="sb-sidenav-menu-heading">Control</div>
				<a class="nav-link" href="${base }/Admin/Add product">
					<div class="sb-nav-link-icon">
						<i class="fab fa-product-hunt"></i>
					</div> Add Products
				<a class="nav-link" href="${base }/Admin/Add_category">
					<div class="sb-nav-link-icon">
						<i class="fas fa-book"></i>
					</div> Add Categories
				</a></a> <a class="nav-link" href="${base }/index">
					<div class="sb-nav-link-icon">
						<i class="fas fa-home"></i>
					</div> Front end
				</a>
			</div>
		</div>
		<div class="sb-sidenav-footer">
			<div class="small">Logged in as:</div>
			Admin
		</div>
	</nav>
</div>