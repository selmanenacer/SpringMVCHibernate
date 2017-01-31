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
				<div class="title_box">Fonction</div>
				<ul class="left_menu">
					<li class="even"><a href="produits">Produits</a></li>
					<li class="odd"><a href="#">Categories</a></li>
					<li class="even"><a href="clients">Commandes</a></li>
					<li class="odd"><a href="#">Clients</a></li>
					<li class="even"><a href="#">Compte Administrateur</a></li>
				</ul>
				<div class="title_box"></div>
				<div class="border_box">
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

						<div class="contact_form">
							<c:url var="addAction" value="/categorie/add"></c:url>

							<form:form action="${addAction}" commandName="categorie">
							
								<div class="form_row">			
									<c:if test="${!empty categorie.nom}">						
										<form:label path="id" class="contact"> <spring:message text="ID" /> </form:label>
										<form:input path="id" readonly="true" size="8" disabled="true" class="contact_input"/> 
										<form:hidden path="id" />
									</c:if>
								</div>
								<div class="form_row">
									<form:label path="nom" class="contact"> <spring:message text="Nom" /> </form:label>
									<form:input path="nom" class="contact_input"/>
								</div>
								<div class="form_row">
									<form:label path="description" class="contact"> <spring:message text="description" /></form:label>
									<form:input path="description" class="contact_input"/>
								</div>
								<div class="form_row">
									<c:if test="${!empty categorie.nom}">
										<input type="submit" value="<spring:message text="Edit Categorie"/>" />
									</c:if>
								</div>
								
								<div class="form_row">
									<c:if test="${empty categorie.nom}">
										<input type="submit" value="<spring:message text="Add Categorie"/>" />
									</c:if>
								</div>
							
							</form:form>

						</div>
						
						<div class="contact_form">
							<h3>Liste des catégories de produits</h3>
							<c:if test="${!empty listCategorie}">
								<table class="tg">
									<tr>
										<th width="80">ID</th>
										<th width="120">Name</th>
										<th width="120">description</th>
										<th width="60">Edit</th>
										<th width="60">Delete</th>
									</tr>
									<c:forEach items="${listCategorie}" var="categorie">
										<tr>
											<td>${categorie.id}</td>
											<td>${categorie.nom}</td>
											<td>${categorie.description}</td>
											<td><a href="<c:url value='/editCategorie/${categorie.id}' />">Edit</a></td>
											<td><a
												href="<c:url value='/removeCategorie/${categorie.id}' />">Delete</a></td>
										</tr>
									</c:forEach>
								</table>
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
						<br /> <span class="border_cart"></span><span class="price"></span>
					</div>
					<div class="cart_icon"></div>
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

