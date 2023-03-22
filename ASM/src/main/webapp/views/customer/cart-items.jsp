<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Giỏ hàng</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/bootstrap4/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/usertemplate/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/categories_styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/categories_responsive.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/custom.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
</head>

<body>
	<div class="super_container">

		<!-- Header -->

		<header class="header trans_300">

			<!-- Top Navigation -->

			<div class="top_nav">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<div class="top_nav_left">Miễn phí vận chuyển cho đơn hàng
								trên 200.000đ</div>
						</div>
						<div class="col-md-6 text-right">
							<div class="top_nav_right">
								<ul class="top_nav_menu">

									<!-- Currency / Language / My Account -->

									<li class="currency">Hotline 0989989999
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Main Navigation -->

			<div class="main_nav_container">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 text-right">
							<div class="logo_container">
								<a href="/index" class="logo pull-left"><img src="/images/logo.png" class="site_logo" alt style="width: 200px; height: 70px;"></a>
					<nav id="menu" class="pull-right">
							</div>
							<nav class="navbar">
								<ul class="navbar_menu">
									<li><a href="/index">Trang chủ</a></li>
									<li><a href="/index">Mua sắm</a></li>
									<li><a href="/index">liên hệ</a></li>
								</ul>
								<c:choose>
									<c:when test="${empty sessionUsername}">
										<div class="">
											<a class="login1" href="/login?urlReturn=shopping-cart">Đăng nhập</a> <span> |
											</span> <a class="login1" href="/register">Đăng ký</a>
										</div>
										<ul class="navbar_user">
											<li class="checkout"><a href="/shopping-cart"> <i
													class="fa fa-shopping-cart" aria-hidden="true"></i> <span
													id="checkout_items" class="checkout_items">${tongSoLuongGioHang}</span>
											</a></li>
										</ul>
									</c:when>
									<c:otherwise>
										<ul class="navbar_user">
											<div class="dropdown">
												<i onclick="myFunction()" class="fa fa-user dropbtn "
													aria-hidden="true"> Hi, ${sessionUsername}</i>
												<div id="myDropdown" class="dropdown-content">
													<a style="text-align: center;"
														href="logout?urlReturn=shopping-cart">Đăng xuất</a>
												</div>
											</div>
											<li class="checkout"><a
												href="/shopping-cart"> <i
													class="fa fa-shopping-cart" aria-hidden="true"></i> <span
													id="checkout_items" class="checkout_items">${tongSoLuongGioHang}</span>
											</a></li>
										</ul>
									</c:otherwise>
								</c:choose>
								<div class="hamburger_container">
									<i class="fa fa-bars" aria-hidden="true"></i>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>

		</header>

		<div class="fs_menu_overlay"></div>

		<div class="container product_section_container">
			<div class="row">
				<div class="col product_section clearfix">

					<!-- Breadcrumbs -->

					<div class="breadcrumbs d-flex flex-row align-items-center">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li class="active"><a href="/index""><i
									class="fa fa-angle-right" aria-hidden="true"></i>Giỏ hàng</a></li>
						</ul>
					</div>

					<!-- Main Content -->

					<div class="containerGioHang">
						<c:if test="${listGioHang.size()!=0}">
							<div id="gioHangTonTai">
								<form action="/shopping-cart/deleteAllItem" method="post">
									<input type="hidden" name="maGioHang" value="0">
									<button
										onclick="return confirm('Bạn có muốn xóa tất cả sản phẩm không?');"
										class="btn btn-danger"
										style="float: right; margin-right: 20px; margin-bottom: 10px;">Xóa
										tất cả</button>
								</form>
								<div class="row"
									style="background-color: rgb(240, 245, 245); width: 100%; padding: 20px 0px 20px 20px; border-radius: 5px; text-align: center;">
									<div class="col-4">Sản phẩm</div>
									<div class="col-2">Đơn giá</div>
									<div class="col-2">Số lượng</div>
									<div class="col-2">Số tiền</div>
									<div class="col-2">Thao tác</div>
								</div>
								<c:set var="tongTien" value="0"></c:set>
								<c:forEach var="item" items="${listGioHang}">
									<div class="row sanPham"
										style="background-color: rgb(240, 245, 245); width: 100%; padding: 20px 0px 20px 20px; border-radius: 5px; margin-top: 20px; text-align: center;">
										<div class="col-2" style="padding-top: 40px;">${item.tenGiay}</div>
										<div class="col-2">
											<img
												src="${pageContext.request.contextPath}/images/sp/${item.hinhAnh}"
												width="150px;" height="150px;">
										</div>
										<div class="col-2" style="padding-top: 60px;">${item.donGia}</div>
										<div class="col-2" style="padding-top: 60px;">${item.soLuong}</div>
										<div class="col-2" style="padding-top: 60px;">
											<fmt:formatNumber value="${item.donGia*item.soLuong}" />
										</div>
										<div class="col-2" style="padding-top: 60px;">
											<span data-masanpham="${item.maGiay}" class="btnXoa"
												style="color: red; cursor: pointer;">Xóa</span>
										</div>
									</div>
								</c:forEach>
								<div class="row"
									style="background-color: rgb(240, 245, 245); width: 100%; padding: 20px 0px 20px 20px; border-radius: 5px; margin-top: 20px; text-align: center;">
									<div class="col-9"></div>
									<div id="tongTien" class="col-3"
										style="color: red; font-weight: bold;">
										Tổng tiền:
										<fmt:formatNumber value="${tongTienGioHang}" />
										đ
									</div>
								</div>

								<a class="btn btn-warning"
									style="float: right; margin-right: 20px; margin-top: 20px;"
									href="/order">Tiến hành đặt hàng</a>

							</div>
						</c:if>
					</div>
					<c:if test="${listGioHang.size()==0}">
						<div style="text-align: center; font-size: 30px; color: gray;">Bạn
							chưa mua sản phẩm nào</div>
					</c:if>
				</div>
			</div>
		</div>

		<!-- Benefit -->

		<div class="benefit">
			<div class="container">
				<div class="row benefit_row">
					<div class="col-lg-3 benefit_col">
						<div class="benefit_item d-flex flex-row align-items-center">
							<div class="benefit_icon">
								<i class="fa fa-truck" aria-hidden="true"></i>
							</div>
							<div class="benefit_content">
								<h6>Miễn phí vận chuyển</h6>
								<p>Miễn phí vận chuyển cho đơn hàng từ 200,000đ</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 benefit_col">
						<div class="benefit_item d-flex flex-row align-items-center">
							<div class="benefit_icon">
								<i class="fa fa-money" aria-hidden="true"></i>
							</div>
							<div class="benefit_content">
								<h6>Thanh toán linh hoạt</h6>
								<p>Thanh toán sau khi nhận hàng hoặc thanh toán qua thẻ</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 benefit_col">
						<div class="benefit_item d-flex flex-row align-items-center">
							<div class="benefit_icon">
								<i class="fa fa-undo" aria-hidden="true"></i>
							</div>
							<div class="benefit_content">
								<h6>45 ngày đổi trả</h6>
								<p>Miễn phí đổi trả cho đơn hàng dưới 45 ngày</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 benefit_col">
						<div class="benefit_item d-flex flex-row align-items-center">
							<div class="benefit_icon">
								<i class="fa fa-clock-o" aria-hidden="true"></i>
							</div>
							<div class="benefit_content">
								<h6>Mở cả tuần</h6>
								<p>8h - 21h</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Newsletter -->

		<div class="newsletter">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div
							class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
							<h4>Bảng tin</h4>
							<p>Đăng ký nhận bảng tin để được nhận ưu đãi 20% khi mua hàng
								lần đầu</p>
						</div>
					</div>
					<div class="col-lg-6">
						<form>
							<div
								class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
								<input id="newsletter_email" type="email"
									placeholder="Địa chỉ email của bạn" required="required"
									data-error="Valid email is required.">
								<button id="newsletter_submit" type="submit"
									class="newsletter_submit_btn trans_300" value="Submit">Đăng
									ký</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->

		<footer class="footer">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div
							class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
							<ul class="footer_nav">
								<li><a href="#">Blog</a></li>
								<li><a href="#">FAQs</a></li>
								<li><a href="contact.html">Contact us</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6">
						<div
							class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-instagram"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-skype"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-pinterest"
										aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="footer_nav_container">
							<
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<script
		src="${pageContext.request.contextPath}/usertemplate/js/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/usertemplate/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/usertemplate/js/shoppingcart.js"></script>
	<script
		src="${pageContext.request.contextPath}/usertemplate/js/custom2.js"></script>

</body>

</html>