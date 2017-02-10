
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

<spring:url value="/resources" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="img" />


<link rel="stylesheet" type="text/css" href="${css}/style.css" />
<link rel="stylesheet" type="text/css" href="${css}/style1.css" />

<script type="text/javascript" src="${js }/boxOver.js"></script>

<script src="${js}/modernizr.js"></script> <!-- Modernizr -->


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
					<li class="divider"></li>

					<li> <a href="<c:url value='/enregistrer' />" class="nav4">Inscription</a> </li>
					<li class="divider"></li>

					<c:choose>
						<c:when test="${!empty client_S}">
							<li><a href="" class="nav6">${client_S.nom}
									${client_S.prenom}</a></li>
							<li class="divider"></li>
							<li><a href="<c:url value='/editClient' />" class="nav6">Profile</a></li>
							
							
							<li><a href="<c:url value='/logout' />" class="nav6">Deconnexion</a></li>
							
						</c:when>
						<c:otherwise>
							<li> <a href="<c:url value='/login' />" class="nav6" >Connexion</a></li>
						</c:otherwise>

					</c:choose>
					
					<li id="cd-cart-trigger" class="nav10">
						<a class="cd-img-replace" href="<c:url value='/' />">Cart</a>
					</li>
					
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
				<div class="center_title_bar">Nouveauté</div>
				
				<c:forEach items="${listProduit}" var="produit">
					<div class="prod_box">
						<div class="top_prod_box"></div>
						<div class="center_prod_box">
							<div class="product_title">
								<a href="">${produit.libelle }</a>
							</div>
							<div class="product_img">
								<a href=""><img src="${img}/${produit.urlImg}"
									alt="" border="0"  width="94" height="92" /></a>
							</div>
							<div class="prod_price">
								 <span class="price">${produit.prix } €</span>
							</div>
						</div>
						<div class="bottom_prod_box"></div>
						
						<div class="prod_details_tab">
							<c:if test="${!empty client_S }">
							<a href="<c:url value="/add/${produit.id }" />"
								title="header=[Ajouter au panier] body=[&nbsp;] fade=[on]"><img
								src="${img}/cart.gif" alt="" border="0" class="left_bt" /></a> 
							</c:if>
							<p>
								<a id="popupId" class="prod_details" >details 
									<span>
										Nom : ${produit.libelle } <br />
										Prix : ${produit.prix } €<br />
										Quantité disponible : ${produit.stock } <br />
										Catégorie : ${produit.categorie.nom } <br />
										Déscription : ${produit.categorie.description }
									</span>
								</a>
							</p>
						</div>
					</div>
					
				</c:forEach>
				
				
				
				
				
				
				
				
				
				

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
	
	<div id="cd-shadow-layer"></div>

	<div id="cd-cart">
		<h2>Cart</h2>
		<ul class="cd-cart-items">
			<c:if test="${!empty client_S }">
				<c:set var="total" value="<%=Integer.valueOf(0)%>" />
				<c:forEach items="${client_S.lignePanier}" var="lignePanier">
					<li>
						<span class="cd-qty"> ${lignePanier.quantite } x</span> ${lignePanier.produit.libelle }
						<div class="cd-price"> ${lignePanier.produit.prix } €</div>
						<!-- nacer changements -->
							<a href="<c:url value="/remove/${lignePanier.produit.id }" />" class="cd-item-remove cd-img-replace">Remove</a>
						<!-- fin nacer changements -->	
						
					</li>
					<c:set var="total" value="${total + lignePanier.produit.prix*lignePanier.quantite }" />
				</c:forEach>	
			</c:if>
			
		</ul> <!-- cd-cart-items -->

		<div class="cd-cart-total">
			<p>Total <span><c:out value="${total }"></c:out></span></p>
		</div> <!-- cd-cart-total -->
		<c:if test="${!empty client_S }">
			<c:if test="${!empty client_S.lignePanier }">
				<a href="<c:url value='/commander' />" class="checkout-btn">Passer la commande</a>
			</c:if>
		</c:if>
		<p class="cd-go-to-cart"><a href="<c:url value='/' />">Retour</a></p>
	</div> <!-- cd-cart -->
	
	
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="${js}/main.js"></script> <!-- Gem jQuery -->
	
	
	
</body>
</html>
