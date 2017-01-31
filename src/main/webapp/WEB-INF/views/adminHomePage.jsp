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
				<input type="text" class="search_input" name="search" /> 
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
						<div class="oferta_details">
							<div class="oferta_title">Bienvenue sur eloctronix site de
								vente de produits informatique</div>
							<div class="oferta_text">Divers produits informatique de
								grande marque et &agrave; bas prix</div>
						</div>
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
					<li class="odd"><a href="#">Liste Produits</a></li>
					<li class="even"><a href="#">Ajouter Produit</a></li>
					<li class="odd"><a href="#">Ajouter Categorie</a></li>
					<li class="even"><a href="#">Liste Clients</a></li>
					<li class="odd"><a href="#">Ajouter Client</a></li>
					<li class="even"><a href="#">Compte Administrateur</a></li>
				</ul>
				<div class="title_box"></div>
				<div class="border_box">
					<div class="product_title"></div>
					<div class="product_img">
						
					</div>
					
				</div>
				
			</div>
			<!-- end of left content -->
			<div class="center_content">
				<div class="center_title_bar">Connexion</div>
				<div class="prod_box_big">
					<div class="top_prod_box_big"></div>
					<div class="center_prod_box_big">

						<div class="contact_form">

							<!-- notre form -->
							<c:url var="loginAction" value="/login"></c:url>

							<form:form action="${loginAction}" id="loginForm" method="post"
								commandName="login">
								
								<div class="form_row">
									<form:label   path="email" class="contact"> Email: </form:label>
									<form:input id="email" name="email" path="email" class="contact_input"/>
								</div>
								<div class="form_row">
									<form:label   path="psw" class="contact"> Mot de passe: </form:label>
									<form:password id="psw" name="psw" path="psw" class="contact_input"/>
								</div>
								
								<div class="form_row">
									<input type="submit" value="Connexion" class="sansLabel" />
								</div>
								
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
					<div class="bottom_prod_box_big"></div>
				</div>

			</div>
			<!-- end of center content -->
			<div class="right_content">
				<div class="shopping_cart">
					<div class="cart_title"></div>
					<div class="cart_details">
						 <br /> <span class="border_cart"></span><span
							class="price"></span>
					</div>
					<div class="cart_icon">
						
					</div>
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
					alt="csscreme" border="0" /></a><br /> 
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

