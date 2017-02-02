
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Electronix Store</title>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252" />
<spring:url value="/resources/style.css" var="css" />
<spring:url value="/resources/js/boxOver.js" var="boxOver" />
<spring:url value="/resources/images" var="img" />
<link rel="stylesheet" type="text/css" href="${css}" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="iecss.css" />
<![endif]-->
<script type="text/javascript" src="${boxOver}"></script>
</head>
<body>
<h1>${client_S}</h1>
	<div id="main_container">
		<div class="top_bar"></div>
		<div id="header">
			<div id="logo">
				<a href="#"><img src="${img}/logo.png" alt="" border="0"
					width="237" height="140" /></a>
			</div>
			<div class="oferte_content">
				<div class="top_divider">
					<img src="${img}/header_divider.png" alt="" width="1" height="164" />
				</div>
				<div class="oferta">
					<div class="oferta_content">
						<div class="oferta_details">
							<div class="oferta_title">Bienvenue sur eloctronix site de
								vente de produits informatique</div>
							<div class="oferta_text">Divers produits informatique de
								grande marque et &agrave; bas prix</div>
						</div>
					</div>
				</div>
				<div class="top_divider">
					<img src="${img}/header_divider.png" alt="" width="1" height="164" />
				</div>
			</div>
			<!-- end of oferte_content-->
		</div>
		<div id="main_content">
			<div id="menu_tab">
				<div class="left_menu_corner"></div>
				<ul class="menu">
					<li><a href="index.jsp" class="nav1"> Accueil</a></li>
					<li class="divider"></li>
					<li><a href="#" class="nav2">Produits</a></li>
					<li class="divider"></li>
					<li><a href="#" class="nav3">Specials</a></li>
					<li class="divider"></li>

					<li> <a href="<c:url value='/enregistrer' />" class="nav4">Enregistrer</a> </li>
					<li class="divider"></li>

					<c:choose>
						<c:when test="${!empty client_S}">

							<li><a href="" class="nav6">${client_S.nom}
									${client_S.prenom}</a></li>
							<li class="divider"></li>
							<li><a href="deconnexion" class="nav6">Deconnexion</a></li>
						</c:when>
						<c:otherwise>
							<li> <a href="<c:url value='/login' />" class="nav6" >Connexion</a></li>
						</c:otherwise>

					</c:choose>

				</ul>
				<div class="right_menu_corner"></div>
			</div>
			<!-- end of menu tab -->
			<div class="crumb_navigation">
				Navigation: <span class="current">Accueil</span>
			</div>
			<div class="left_content">
				<div class="title_box">Categories</div>
				<ul class="left_menu">
					<li class="odd"><a href="processeur.jsp">Processeurs</a></li>
					<li class="even"><a href="cartem.jsp">Carte Mére</a></li>
					<li class="odd"><a href="ordi.jsp">Ordinateurs</a></li>
					<li class="even"><a href="laptop.jsp">Laptops &amp;
							Notebooks</a></li>
					<li class="odd"><a href="carteg.jsp">Carte Graphique</a></li>
					<li class="even"><a href="disc.jsp">Disque dur</a></li>
					<li class="odd"><a href="alim.jsp">Alimentation</a></li>
					<li class="even"><a href="carter.jsp">Carte Reseaux</a></li>
					<li class="odd"><a href="ecran.jsp">Ecran PC</a></li>


				</ul>
				<div class="title_box">- 30 %</div>
				<div class="border_box">
					<div class="product_title">
						<a href="details.jsp">Sonny 156 MX-VL</a>
					</div>
					<div class="product_img">
						<a href="details.jsp"><img src="${img}/laptop.png" alt=""
							border="0" /></a>
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
					<a href="#"><img src="${img}/bann2.jpg" alt="" border="0" /></a>
				</div>
			</div>
			<!-- end of left content -->
			<div class="center_content">
				<div class="center_title_bar">Nouveauté</div>
				
				
				
				
				<c:forEach items="${listProduit}" var="produit">
				<div class="prod_box">
					<div class="top_prod_box"></div>
					<div class="center_prod_box">
						<div class="product_title">
							<a href="details.jsp">${produit.libelle }</a>
						</div>
						<div class="product_img">
							<a href="details.jsp"><img src="${img}/${produit.urlImg}"
								alt="" border="0"  width="94" height="92" /></a>
						</div>
						<div class="prod_price">
							 <span class="price">${produit.prix }</span>
						</div>
					</div>
					<div class="bottom_prod_box"></div>
					<div class="prod_details_tab">
						<a href="#"
							title="header=[Ajouter au panier] body=[&nbsp;] fade=[on]"><img
							src="${img}/cart.gif" alt="" border="0" class="left_bt" /></a> <a
							href="details.jsp" class="prod_details">details</a>
					</div>
				</div>
				
				</c:forEach>
				
				
				
				
				
				
				
				
				
				

			</div>
			<!-- end of center content -->
			<div class="right_content">
				<div class="shopping_cart">
					<div class="cart_title">Panier</div>
					<div class="cart_details">
						3 items <br /> <span class="border_cart"></span> Total: <span
							class="price">350$</span>
					</div>
					<div class="cart_icon">
						<a href="#" title="header=[Checkout] body=[&nbsp;] fade=[on]"><img
							src="${img}/shoppingcart.png" alt="" width="48" height="48"
							border="0" /></a>
					</div>
				</div>
				<div class="title_box">Nouveauté</div>
				<div class="border_box">
					<div class="product_title">
						<a href="details.jsp">Motorola 156 MX-VL</a>
					</div>
					<div class="product_img">
						<a href="details.jsp"><img src="${img}/p2.gif" alt=""
							border="0" /></a>
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
					<a href="#"><img src="${img}/bann1.jpg" alt="" border="0" /></a>
				</div>
			</div>
			<!-- end of right content -->
		</div>
		<!-- end of main content -->
		<div class="footer">
			<div class="left_footer">
				<img src="${img}/footer_logo.png" alt="" width="172" height="49" />
			</div>
			<div class="center_footer">
				Electronix. All Rights Reserved 2015<br /> <a
					href="http://csscreme.com"><img src="${img}/csscreme.jpg"
					alt="csscreme" border="0" /></a><br /> <img src="${img}/payment.gif"
					alt="" />
			</div>
			<div class="right_footer">
				<a href="#">home</a> <a href="#">about</a> <a href="#">sitemap</a> <a
					href="#">rss</a> <a href="contact.jsp">contact us</a>
			</div>
		</div>
	</div>
	<!-- end of main_container -->
</body>
</html>
