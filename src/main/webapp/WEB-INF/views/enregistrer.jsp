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
		</div>
		<!-- end of oferte_content-->
		<div id="main_content">
			<div id="menu_tab">
				<div class="left_menu_corner"></div>
				<ul class="menu">
					<li><a href="<c:url value='/' />" class="nav1"> Accueil</a></li>
					<li class="divider"></li>
					<c:choose>
						<c:when test="${!empty client_S}">
							<li><a href="" class="nav6">${client_S.nom}
									${client_S.prenom}</a></li>
							<li class="divider"></li>
							<li><a href="<c:url value='/logout' />" class="nav6">Deconnexion</a></li>
						</c:when>
						<c:otherwise>
							<li> <a href="<c:url value='/login' />" class="nav6" >Connexion</a></li>
						</c:otherwise>
					</c:choose>
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
				<div class="center_title_bar">Inscription</div>
				<div class="prod_box_big">
					<div class="top_prod_box_big"></div>
					<div class="center_prod_box_big"></div>
					<div class="center_prod_box_big">
						<div class="contact_form">
						
						<div class="login">
  							<div class="login-triangle"></div>
  							
  							<c:url var="addAction" value="/client/add" ></c:url>

							<form:form action="${addAction}" commandName="client">
								<div class="form_row">
									<c:if test="${!empty client.nom}">
										<form:label class="contact" path="id"> <spring:message text="ID"/> </form:label>
										<form:input class="contact_input" path="id" readonly="true" size="8"  disabled="true"  />
										<form:hidden path="id"   />
									</c:if>
								</div>
								
							
									<form:input placeholder="Nom" class="contact_input" path="nom" value="${user.nom }" />
									<div class="form_row"></div>
									<form:input placeholder="Prenom" class="contact_input" path="prenom" value="${user.prenom }"/>
									<div class="form_row"></div>
									<form:input placeholder="Email" class="contact_input" path="email" />
									<div class="form_row"></div>
									<form:input type="password" placeholder="Mot de passe" class="contact_input" path="psw" />
									<div class="form_row"></div>
									<form:input placeholder="Rue" class="contact_input" path="adresse.rue" value="${user.adresse.rue }"/>
									<div class="form_row"></div>
									<form:input placeholder="Ville" class="contact_input" path="adresse.ville" value="${user.adresse.ville }"/>
									<div class="form_row"></div>
									<form:input placeholder="Code postal" class="contact_input" path="adresse.codePostal" value="${user.adresse.codePostal }" />
									<div class="form_row"></div>
									
									<c:if test="${!empty client.nom && empty user.nom  }">
										<input type="submit" value="<spring:message text="Edit client"/>" />
									</c:if>
									<div class="form_row"></div>
									<c:if test="${empty client.nom or !empty user.nom }">
										<input type="submit" value="<spring:message text="Inscripton"/>" />
									</c:if>
							
							</form:form>
							
							<c:if test="${! empty user }">
								<h1> Email exist   </h1>
							</c:if>
  							
						</div>
						
						
						</div>
					</div>
				</div>
				
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
	<!-- end of main_container -->
</body>
</html>

