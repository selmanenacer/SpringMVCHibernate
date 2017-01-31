<%-- 
    Document   : enregistrer
    Created on : 30 janv. 2015, 19:35:03
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
							<div class="oferta_title">Bienvenue sur electronix site de
								vente de prosuits informatique</div>
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
					<li><a href="index.jsp" class="nav1"> Acceuil</a></li>
					<li class="divider"></li>
					<li><a href="#" class="nav2">Produits</a></li>
					<li class="divider"></li>
					<li><a href="#" class="nav3">Specials</a></li>
					<li class="divider"></li>

					<li><a href="#" class="nav4">Enregistrer</a></li>
					<li class="divider"></li>
					<c:choose>
						<c:when test="${sessionScope.client == 'vrai'}">

							<li><a href="" class="nav6">${sessionScope.nom}
									${sessionScope.prenom}</a></li>
							<li class="divider"></li>
							<li><a href="deconnexion" class="nav6">Deconnexion</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="connexion.jsp" class="nav6">Connexion</a></li>
						</c:otherwise>

					</c:choose>
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
					<li class="odd"><a href="#">Processeur</a></li>
					<li class="even"><a href="#">Carte Mére</a></li>
					<li class="odd"><a href="#">Ordinateur</a></li>
					<li class="even"><a href="#">Laptops &amp; Notebooks</a></li>
					<li class="odd"><a href="#">Carte Graphique</a></li>
					<li class="even"><a href="#">Disque Dur</a></li>
					<li class="odd"><a href="#">Alimentation</a></li>
					<li class="even"><a href="#">Carte Reseaux</a></li>
					<li class="odd"><a href="#">Ecran PC</a></li>

				</ul>
				<div class="title_box">Produits Special</div>
				<div class="border_box">
					<div class="product_title">Motorola 156 MX-VL</div>
					<div class="product_img">
						<a href="#"><img src="${img}/laptop.png" alt="" border="0" /></a>
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
				<div class="center_title_bar">Inscription</div>
				<div class="prod_box_big">
					<div class="top_prod_box_big"></div>
					<div class="center_prod_box_big"></div>
					<div class="center_prod_box_big">
						<div class="contact_form">
						
						
						<c:url var="addAction" value="/client/add" ></c:url>

						<form:form action="${addAction}" commandName="client">
							<div class="form_row">
								<c:if test="${!empty client.nom}">
									<form:label class="contact" path="id"> <spring:message text="ID"/> </form:label>
									<form:input class="contact_input" path="id" readonly="true" size="8"  disabled="true"  />
									<form:hidden path="id"   />
								</c:if>
							</div>
							
							<div class="form_row">
								<form:label class="contact" path="nom"> <spring:message text="nom" /> </form:label>
								<form:input class="contact_input" path="nom" value="${user.nom }" />
							</div>
							
							<div class="form_row">
								<form:label class="contact" path="prenom"> <spring:message text="prenom"/> </form:label>
								<form:input class="contact_input" path="prenom" value="${user.prenom }"/>
							</div>
							
							<div class="form_row">
								<form:label class="contact" path="email"> <spring:message text="email"/> </form:label>
								<form:input class="contact_input" path="email" />
							</div>
							
							<div class="form_row">
								<form:label class="contact" path="psw"> <spring:message text="password"/> </form:label>
								<form:password class="contact_input" path="psw" />
							</div>
							
							<div class="form_row">
								<form:label class="contact" path="adresse.rue"> <spring:message text="rue"/> </form:label>
								<form:input class="contact_input" path="adresse.rue" value="${user.adresse.rue }"/>
							</div>
							
							<div class="form_row">
								<form:label class="contact" path="adresse.rue"> <spring:message text="rue"/> </form:label>
								<form:input class="contact_input" path="adresse.rue" value="${user.adresse.rue }"/>
							</div>
							
							<div class="form_row">
								<form:label class="contact" path="adresse.ville"> <spring:message text="ville"/> </form:label>
								<form:input class="contact_input" path="adresse.ville" value="${user.adresse.ville }"/>
							</div>
							
							<div class="form_row">
								<form:label class="contact" path="adresse.codePostal"> <spring:message text="code Postal"/> </form:label>
								<form:input class="contact_input" path="adresse.codePostal" value="${user.adresse.codePostal }" />
							</div>
							
							<div class="form_row">
								<c:if test="${!empty client.nom && empty user.nom  }">
									<input type="submit" value="<spring:message text="Edit client"/>" />
								</c:if>
							</div>
							
							<div class="form_row">
								<c:if test="${empty client.nom or !empty user.nom }">
									<input type="submit" value="<spring:message text="Add client"/>" />
								</c:if>
							</div>
						
						</form:form>
						
						<c:if test="${! empty user }">
							<h1> Email exist   </h1>
						</c:if>
						
						
						</div>
					</div>
				</div>
				<div class="bottom_prod_box_big"></div>
			</div>
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
				<div class="product_title">Motorola 156 MX-VL</div>
				<div class="product_img">
					<a href="#"><img src="${img}/p2.gif" alt="" border="0" /></a>
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
			<img src="${img}/footer_logo.png" alt="" width="170" height="49" />
		</div>
		<div class="center_footer">
			Electronix. tout droit reservé 2015<br /> <br /> <img
				src="${img}/payment.gif" alt="" />
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

