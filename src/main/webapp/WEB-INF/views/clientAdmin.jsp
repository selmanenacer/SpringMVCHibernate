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
					<p>Search</p>
				</div>
				<input type="text" class="search_input" name="search" /> <input
					type="image" src="${img }/search.gif" class="search_bt" />
			</div>
			<div class="languages">
				<div class="lang_text">Languages:</div>
				<p class="lang">
					<img src="${img }/en.gif" alt="" border="0" />
				</p>

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
					<li><a href="<c:url value='adminHomePage' />" class="nav1"> Accueil</a></li>
					<li class="divider"></li>
					<c:choose>
						<c:when test="${!empty admin_S}">
							<li><a href="" class="nav6">${admin_S.nom}
									${admin_S.prenom}</a></li>
							<li class="divider"></li>
							<li><a href="<c:url value='/logout' />" class="nav6">Deconnexion</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="<c:url value='/login' />" class="nav6">Connexion</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
				<div class="right_menu_corner"></div>
			</div>
			<!-- end of menu tab -->
			<div class="crumb_navigation"></div>
			<div class="left_content">
				<div class="title_box">Fonction</div>
				<ul class="left_menu">
					<li class="even"><a href="produits">Produits</a></li>
					<li class="odd"><a href="categories">Categories</a></li>
					<li class="even"><a href="clients">Commandes</a></li>
					<li class="odd"><a href="clientAdmin">Clients</a></li>
					<li class="even"><a href="admin">Comptes Admin</a></li>
				</ul>
				
					<div class="product_title"></div>
					<div class="product_img"></div>

				</div>

			</div>
			<!-- end of left content -->
			<div class="center_content">
				<div class="center_title_bar">Liste des Clients</div>
				<div class="prod_box_big">
					<div class="top_prod_box_big"></div>
					<div class="center_prod_box_big">

						<c:if test="${!empty listClients}">
							<table class="tg">
								<tr>
									<th width="80">ID</th>
									<th width="120">nom</th>
									<th width="120">prenom</th>
									<th width="120">email</th>
									<th width="120">Rue</th>
									<th width="120">Ville</th>
									<th width="120">code postal</th>
									<th width="60">Delete</th>
								</tr>
								<c:forEach items="${listClients}" var="client">
									<tr>
										<td>${client.id}</td>
										<td>${client.nom}</td>
										<td>${client.prenom}</td>
										<td>${client.email}</td>
										<td>${client.adresse.rue}</td>
										<td>${client.adresse.ville}</td>
										<td>${client.adresse.codePostal}</td>
										<td><a
											href="<c:url value='/removeClientAdmin/${client.id}' />"><img src="${img }/delet.png"/></a></td>
									</tr>
								</c:forEach>
							</table>
						</c:if>


					</div>
					<div class="bottom_prod_box_big"></div>
				</div>

			</div>
			<!-- end of center content -->
			<div class="right_content">
				



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

