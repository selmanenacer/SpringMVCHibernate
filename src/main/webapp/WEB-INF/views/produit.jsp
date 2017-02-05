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
				<a href=""><img src="${img }/logo.png" alt="" border="0"
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
						<div class="oferta_content">
							<div class="oferta_details">
								<div class="oferta_title">Bienvenue sur eloctronix site de
									vente de produits informatique</div>
								<div class="oferta_text">Divers produits informatique de
									grande marque et &agrave; bas prix</div>
							</div>
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
			<div class="left_content">
				<div class="title_box">Fonctions</div>
				<ul class="left_menu">
					<li class="even"><a href="produits">Produits</a></li>
					<li class="odd"><a href="categories">Categories</a></li>
					<li class="even"><a href="clients">Commandes</a></li>
					<li class="odd"><a href="clientAdmin">Clients</a></li>
					<li class="even"><a href="admin">Comptes Admin</a></li>
				</ul>


			</div>
			<!-- end of left content -->
			<div class="center_content">
				<div class="center_title_bar">Ajouter un produit</div>
				<div class="prod_box_big">
					<div class="top_prod_box_big"></div>
					<div class="center_prod_box_big">

						<div class="contact_form">
							<div class="login">
							<c:url var="addAction" value="/produit/add"></c:url>

							<form:form action="${addAction}" commandName="produit"
								enctype="multipart/form-data">
								<div class="form_row">
									<c:if test="${!empty produit.libelle}">
									
										<form:input path="id" readonly="true" size="8" disabled="true"
											class="contact_input" />
										<form:hidden path="id" />
									</c:if>
								</div>

								<div class="form_row">
									<form:input placeholder="Libelle" path="libelle" class="contact_input" />
								</div>

								<div class="form_row">
									
									<form:input placeholder="Constructeur" path="constructeur" class="contact_input" />
								</div>

								<div class="form_row">
									<form:input placeholder="Stock" path="stock" class="contact_input" />
								</div>
								<div class="form_row">
									<form:input placeholder="Prix" path="prix" class="contact_input" />
								</div>
								<div class="form_row">
									Categorie
									<form:select path="categorie.id">
										<c:forEach items="${listCategorie}" var="categorie">
											<form:option value="${categorie.id}" label="${categorie.nom}" />
										</c:forEach>
									</form:select>
								</div>

								<div class="form_row">
									Image
									<input  type="file" name="file" />
								</div>

								<div class="form_row">
									<c:if test="${!empty produit.libelle}">
										<input type="submit"
											value="<spring:message text="Edit produit"/>" />
									</c:if>
								</div>

								<div class="form_row">
									<c:if test="${empty produit.libelle}">
										<input type="submit"
											value="<spring:message text="Add produit"/>" />
									</c:if>
								</div>

							</form:form>
						</div>
						<h3>List des produits</h3>
					</div>

					
						
						<c:if test="${!empty listProduit}">
							<table class="tg">
								<tr>
									<th width="80">ID</th>
									<th width="120">libelle</th>
									<th width="120">constructeur</th>
									<th width="120">stock</th>
									<th width="120">Cat</th>
									<th width="120">Desc</th>
									<th width="60">Edit</th>
									<th width="60">Delete</th>
								</tr>
								<c:forEach items="${listProduit}" var="produit">
									<tr>
										<td  border: 1px solid black>${produit.id}</td>
										<td>${produit.libelle}</td>
										<td>${produit.constructeur}</td>
										<td>${produit.stock}</td>
										<td>${produit.categorie.nom}</td>
										<td>${produit.categorie.description}</td>
										<td><a
											href="<c:url value='/editProduit/${produit.id}' />"><img src="${img }/edit.png"/></a></td>
										<td><a
											href="<c:url value='/removeProduit/${produit.id}' />"><img src="${img }/delet.png"/></a></td>
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
			
			<ul class="left_menu">
				<c:forEach items="${listConstructeurs}" var="constructeur">
					<li class="odd"><a href="">${constructeur}</a></li>
				</c:forEach>
			</ul>
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
			<a href="">home</a> <a href="">about</a> <a href="">sitemap</a> <a
				href="">rss</a> <a href="">contact us</a>
		</div>
	</div>
	</div>
	<!-- end of main_container -->
</body>
</html>

