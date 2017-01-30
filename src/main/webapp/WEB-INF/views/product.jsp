<%-- 
    Document   : connexion
    Created on : 1 févr. 2015, 17:14:31
    Author     : yacine
--%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Electronix Store - Contact</title>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252" />

<spring:url value="/resources/style.css" var="css" />
<spring:url value="/resources/js/boxOver.js" var="boxOver" />
<spring:url value="/resources/images" var="img" />

<link href="${css }" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${boxOver }"></script>
</head>
<body>
	<div id="main_container">
		<div class="top_bar">
			<div class="top_search">
				<div class="search_text">
					<a href="#">Advanced Search</a>
				</div>
				<input type="text" class="search_input" name="search" /> <input
					type="image" src="${img }/search.gif" class="search_bt" />
			</div>
			<div class="languages">
				<div class="lang_text">Languages:</div>
				<a href="#" class="lang"><img src="${img }/en.gif" alt=""
					border="0" /></a> <a href="#" class="lang"><img
					src="${img }/de.gif" alt="" border="0" /></a>
			</div>
		</div>
		<div id="header">
			<div id="logo">
				<a href="#"><img src="${img }/logo.png" alt="" border="0"
					width="237" height="140" /></a>
			</div>
			<div class="oferte_content">
				<div class="top_divider">
					<img src="${img }/header_divider.png" alt="" width="1" height="164" />
				</div>
				<div class="oferta">
					<div class="oferta_content">
						<img src="${img }/laptop.png" width="94" height="92" alt=""
							border="0" class="oferta_img" />
						<div class="oferta_details">
							<div class="oferta_title">Samsung GX 2004 LM</div>
							<div class="oferta_text">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit, sed do eiusmod tempor incididunt
								ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
								nostrud exercitation ullamco</div>
							<a href="#" class="details">details</a>
						</div>
					</div>
					<div class="oferta_pagination">
						<span class="current">1</span> <a href="#">2</a> <a href="#">3</a>
						<a href="#">4</a> <a href="#">5</a>
					</div>
				</div>
				<div class="top_divider">
					<img src="${img }/header_divider.png" alt="" width="1" height="164" />
				</div>
			</div>
			<!-- end of oferte_content-->
		</div>
		<div id="main_content">
			<div id="menu_tab">
				<div class="left_menu_corner"></div>
				<ul class="menu">
					<li><a href="#" class="nav1"> Home</a></li>
					<li class="divider"></li>
					<li><a href="#" class="nav2">Products</a></li>
					<li class="divider"></li>
					<li><a href="#" class="nav3">Specials</a></li>
					<li class="divider"></li>

					<li><a href="enregistrer.jsp" class="nav4">Sign Up</a></li>
					<li class="divider"></li>

				</ul>
				<div class="right_menu_corner"></div>
			</div>
			<!-- end of menu tab -->
			<div class="crumb_navigation">
				Navigation: <a href="#">Home</a> &lt; <span class="current">Category
					name</span>
			</div>
			<div class="left_content">
				<div class="title_box">Categories</div>
				<ul class="left_menu">
					<li class="odd"><a href="#">Processors</a></li>
					<li class="even"><a href="#">Motherboards</a></li>
					<li class="odd"><a href="#">Desktops</a></li>
					<li class="even"><a href="#">Laptops &amp; Notebooks</a></li>
					<li class="odd"><a href="#">Processors</a></li>
					<li class="even"><a href="#">Motherboards</a></li>
					<li class="odd"><a href="#">Processors</a></li>
					<li class="even"><a href="#">Motherboards</a></li>
					<li class="odd"><a href="#">Desktops</a></li>
					<li class="even"><a href="#">Laptops &amp; Notebooks</a></li>
					<li class="odd"><a href="#">Processors</a></li>
					<li class="even"><a href="#">Motherboards</a></li>
				</ul>
				<div class="title_box">Special Products</div>
				<div class="border_box">
					<div class="product_title">Motorola 156 MX-VL</div>
					<div class="product_img">
						<a href="#"><img src="${img }/laptop.png" alt="" border="0" /></a>
					</div>
					<div class="prod_price">
						<span class="reduce">350$</span> <span class="price">270$</span>
					</div>
				</div>
				<div class="title_box">Newsletter</div>
				<div class="border_box">
					<input type="text" name="newsletter" class="newsletter_input"
						value="your email" /> <a href="#" class="join">join</a>
				</div>
				<div class="banner_adds">
					<a href="#"><img src="${img }/bann2.jpg" alt="" border="0" /></a>
				</div>
			</div>
			<!-- end of left content -->
			<div class="center_content">
				<div class="center_title_bar">Ajouter un produit</div>
				<div class="prod_box_big">
					<div class="top_prod_box_big"></div>
					<div class="center_prod_box_big">

						<div class="contact_form">
							<h1> izan izan izan</h1>
						</div>

					</div>
					<div class="bottom_prod_box_big"></div>
				</div>

			</div>
			<!-- end of center content -->
			<div class="right_content">
				<div class="shopping_cart">
					<div class="cart_title">Shopping cart</div>
					<div class="cart_details">
						3 items <br /> <span class="border_cart"></span> Total: <span
							class="price">350$</span>
					</div>
					<div class="cart_icon">
						<a href="#" title="header=[Checkout] body=[&nbsp;] fade=[on]"><img
							src="${img }/shoppingcart.png" alt="" width="48" height="48"
							border="0" /></a>
					</div>
				</div>
				<div class="title_box">What’s new</div>
				<div class="border_box">
					<div class="product_title">Motorola 156 MX-VL</div>
					<div class="product_img">
						<a href="#"><img src="${img }/p2.gif" alt="" border="0" /></a>
					</div>
					<div class="prod_price">
						<span class="reduce">350$</span> <span class="price">270$</span>
					</div>
				</div>
				<div class="title_box">Manufacturers</div>
				<ul class="left_menu">
					<li class="odd"><a href="#">Sony</a></li>
					<li class="even"><a href="#">Samsung</a></li>
					<li class="odd"><a href="#">Daewoo</a></li>
					<li class="even"><a href="#">LG</a></li>
					<li class="odd"><a href="#">Fujitsu Siemens</a></li>
					<li class="even"><a href="#">Motorola</a></li>
					<li class="odd"><a href="#">Phillips</a></li>
					<li class="even"><a href="#">Beko</a></li>
				</ul>
				<div class="banner_adds">
					<a href="#"><img src="${img }/bann1.jpg" alt="" border="0" /></a>
				</div>
			</div>
			<!-- end of right content -->
		</div>
		<!-- end of main content -->
		<div class="footer">
			<div class="left_footer">
				<img src="${img }/footer_logo.png" alt="" width="170" height="49" />
			</div>
			<div class="center_footer">
				Template name. All Rights Reserved 2008<br /> <a
					href="http://csscreme.com"><img src="${img }/csscreme.jpg"
					alt="csscreme" border="0" /></a><br /> <img src="${img }/payment.gif"
					alt="" />
			</div>
			<div class="right_footer">
				<a href="#">home</a> <a href="#">about</a> <a href="#">sitemap</a> <a
					href="#">rss</a> <a href="contact.html">contact us</a>
			</div>
		</div>
	</div>
	<!-- end of main_container -->
</body>
</html>

