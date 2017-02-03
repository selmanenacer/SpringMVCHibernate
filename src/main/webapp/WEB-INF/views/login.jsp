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

<spring:url value="/resources" var="css" />
<spring:url value="/resources/js/boxOver.js" var="boxOver" />
<spring:url value="/resources/images" var="img" />

<link href="${css }/style.css" rel="stylesheet" type="text/css" />
<link href="${css }/style1.css" rel="stylesheet" type="text/css" />
<link href="${css }/style_form.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${boxOver }"></script>
</head>
<body>
	<div id="main_container">
		<div class="top_bar">
			<div class="top_search">
				<div class="search_text">
					<p >Search</p>
				</div>
				<input type="text" class="search_input" name="search" /> <input
					type="image" src="${img }/search.gif" class="search_bt" />
			</div>
			<div class="languages">
				<div class="lang_text">Languages:</div>
				<p class="lang"><img src="${img }/en.gif" alt="" border="0" /></p> 
				
			</div>
		</div>
		<div id="header">
			<div id="logo">
				<a href=""><img src="${img}/logo.png" alt="" border="0"
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
					<li><a href="<c:url value='/' />" class="nav1"> Accueil</a></li>
				</ul>
				<div class="right_menu_corner"></div>
			</div>
			<!-- end of menu tab -->
			<div class="left_content">
				<div class="title_box">Categories</div>
				<ul class="left_menu">
					<c:forEach items="${listCategorie}" var="categorie">
						<li class="odd"><a href="">${categorie.nom}</a></li>
					</c:forEach>
				</ul>
				<div class="title_box">- 30 %</div>
				<div class="border_box">
					<div class="product_title">
						<a href="">Sonny 156 MX-VL</a>
					</div>
					<div class="product_img">
						<a href=""><img src="${img}/laptop.png" alt=""
							border="0" /></a>
					</div>
					<div class="prod_price">
						<span class="reduce">350 €</span> <span class="price">270 €</span>
					</div>
				</div>
				<div class="title_box">Newsletter</div>
				<div class="border_box">
					<input type="text" name="newsletter" class="newsletter_input"
						value="your email" /> <a href="" class="join">join</a>
				</div>

				<div class="banner_adds">
					<a href=""><img src="${img}/bann2.jpg" alt="" border="0" /></a>
				</div>
			</div>
			<!-- end of left content -->
			<div class="center_content">
				<div class="center_title_bar">Connexion</div>
				<div class="prod_box_big">
					<div class="top_prod_box_big"></div>
					<div class="center_prod_box_big">

						<div class="contact_form">
						
						<div class="login">
  							<div class="login-triangle"></div>
  
  							<!-- notre form -->
							<c:url var="loginAction" value="/login"></c:url>

							<form:form action="${loginAction}" id="loginForm" method="post"
								commandName="login">					
									<div class="form_row"></div>
									<form:input class="contact_input" placeholder="Email" id="email" name="email" path="email" />
									<div class="form_row"></div>
									<form:input class="contact_input" type="password" placeholder="Password" id="psw" name="psw" path="psw" />
									<div class="form_row"></div>
									<input type="submit" value="Connexion" class="sansLabel" />
								
							</form:form>
							<c:if test="${!empty client}">
								<h1>client ${client.nom} ${client.prenom} connecter !!</h1>

							</c:if>

							<c:if test="${!empty admin}">
								<h1>admin ${admin.nom} ${admin.prenom} connecter !!</h1>

							</c:if>
							<c:if test="${!empty erreur}">
								<h1>${erreur}</h1>

							</c:if>
						</div>
  						
						</div>

					</div>
					<div class="bottom_prod_box_big"></div>
				</div>

			</div>
			<!-- end of center content -->
			<div class="right_content">
				<c:if test="${!empty client_S }">
					<div class="shopping_cart">
						<div class="cart_title">Panier</div>
						<c:set var="total2" value="<%=Integer.valueOf(0)%>" />
						<c:set var="nbr" value="<%=Integer.valueOf(0)%>" />
							<c:forEach items="${client_S.lignePanier}" var="lignePanier2">
								<c:set var="total2" value="${total2 + lignePanier2.produit.prix*lignePanier2.quantite }" />
								<c:set var="nbr" value="${nbr + 1 }" />
							</c:forEach>		
								<div class="cart_details">
									<c:out value="${nbr }"></c:out> items <br /> <span class="border_cart"></span> Total: <span
										class="price"> <c:out value="${total2 }"></c:out></span>
								</div>
								
								<div class="cart_icon">
									<a  title="header=[Checkout] body=[&nbsp;] fade=[on]"><img
										src="${img}/shoppingcart.png" alt="" width="48" height="48"
										border="0" /></a>
								</div>	
						</div>
					</c:if>	
				<div class="title_box">Nouveauté</div>
				<div class="border_box">
					<div class="product_title">
						<a href="">Motorola 156 MX-VL</a>
					</div>
					<div class="product_img">
						<a href=""><img src="${img}/p2.gif" alt=""
							border="0" /></a>
					</div>
					<div class="prod_price">
						<span class="reduce">350 €</span> <span class="price">270 €</span>
					</div>
				</div>
				<div class="title_box">Manufacturers</div>
				<ul class="left_menu">
					<c:forEach items="${listConstructeurs}" var="constructeur">
						<li class="odd"><a href="">${constructeur}</a></li>
					</c:forEach>
				</ul>
				<div class="banner_adds">
					<a href=""><img src="${img}/bann1.jpg" alt="" border="0" /></a>
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
				<a href="">home</a> <a href="">about</a> <a href="">sitemap</a> <a
					href="">rss</a> <a href="">contact us</a>
			</div>
		</div>
	</div>
	<!-- end of main_container -->
</body>
</html>

