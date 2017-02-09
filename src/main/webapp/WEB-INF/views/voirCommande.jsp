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

<SCRIPT LANGUAGE="JavaScript">
function afficher()
{
	alert("Votre commandé a été prise en compte !")
}

</SCRIPT>
<title>Electronix Store - Contact</title>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252" />

<spring:url value="/resources" var="css" />
<spring:url value="/resources/js/boxOver.js" var="boxOver" />
<spring:url value="/resources/images" var="img" />

<link href="${css }/style.css" rel="stylesheet" type="text/css" />
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
		</div>
		<!-- end of main content -->

		<div class="commande">
			<table align="center" border="0" width="100%">
				<tbody>
					<tr bgcolor="#ffffff" valign="top">
						<td>
							<table align="center" border="0" width="95%">
								<tbody>
									<tr valign="top">
										<td>
											<h1 align="center">
												<br> <font face="Verdana, Arial, Helvetica, sans-serif">Commande N°${commande.id} </font>
											</h1>
											<br /><br />
											<p>
												<font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Informations
														client :</b></font>
											</p>
											<c:url var="loginAction" value="/commander"></c:url>
											<form action="${loginAction}" id="loginForm" method="post" commandName="login">
												<table align="center" border="0" width="95%">
													<tbody>
														<tr valign="top">
															<td width="32%"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2">
																	nom</font></td>
															<td width="68%"><input name="NOM" size="40"
																type="text" value=" ${commande.client.nom}"
																disabled="disabled"></td>
														</tr>
														<tr valign="top">
															<td width="32%"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2">
																	prénom</font></td>
															<td width="68%"><input name="PRENOM" size="40"
																type="text" value=" ${commande.client.prenom}"
																disabled="disabled"></td>
														</tr>
														<tr valign="top">
															<td width="32%"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2">
																	adresse e-mail</font></td>
															<td width="68%"><input name="ADR_EMAIL" size="40"
																 value=" ${commande.client.email }" disabled="disabled"></td>
														</tr>
														<tr valign="top">
															<td width="32%"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2">
																	adresse postale</font></td>
															<td width="68%"><input name="ADRESSE" size="40"
																	value=" ${commande.client.adresse.rue }" disabled="disabled"></input></td>
														</tr>
														<tr valign="top">
															<td width="32%"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2">Ville</font></td>
															<td width="68%"><input name="VILLE" size="40"
																type="text" value=" ${commande.client.adresse.ville }" disabled="disabled"></td>
														</tr>
														<tr valign="top">
															<td width="32%"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2">Code
																	postal</font></td>
															<td width="68%"><input name="CP" size="40"
																type="text" value=" ${commande.client.adresse.codePostal }" disabled="disabled"></td>
														</tr>
														<tr valign="top">
															<td width="32%"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2">Téléphone</font></td>
															<td width="68%"><input name="TEL" size="40"
																type="text" value=" ${commande.client.tel }" disabled="disabled"></td>
														</tr>
													</tbody>
												</table>
												<br /><br />
												<p>
													<font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Informations
															commande :</b></font>
												</p>
												<table align="center" border="0" width="95%">
													<tbody>
														<tr valign="top" align="left">
															<th width="25%"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2">Poduit</font></th>
															<th width="25%"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2">Quantité</font></th>
															<th width="25%"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2">Prix Unitaire</font></th>
															<th width="25%"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2">Montant</font></th>
														</tr>
														<c:set var="total2" value="<%=Float.valueOf(0)%>" />
														<c:set var="nbr" value="<%=Integer.valueOf(0)%>" />
														<c:forEach items="${commande.ligneCommandes}" var="lignePanier2">
															<c:set var="total2" value="${total2 + lignePanier2.produit.prix*lignePanier2.quantite }" />
																<tr valign="top">
																	<td width="25%"><font
																		face="Verdana, Arial, Helvetica, sans-serif" size="2">${lignePanier2.produit.libelle}</font> </td>
																	<td width="25%"><font
																		face="Verdana, Arial, Helvetica, sans-serif" size="2">${lignePanier2.quantite}</font></td>
																	<td width="25%"><font
																		face="Verdana, Arial, Helvetica, sans-serif" size="2">${lignePanier2.produit.prix} €</font></td>
																	<td width="25%"><font
																		face="Verdana, Arial, Helvetica, sans-serif" size="2">${lignePanier2.montant} €</font></td>
																</tr>
															<c:set var="nbr" value="${nbr + lignePanier2.quantite }" />
														</c:forEach>
														<tr valign="top">
															<th width="25%" align="left"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2">Total</font> </th>
															<th width="25%" align="left"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2"> <c:out value="${nbr }"></c:out></font></th>
															<td width="25%"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2"></font></td>
															<th width="25%" align="left"><font
																face="Verdana, Arial, Helvetica, sans-serif" size="2"> <c:out value="${total2 }"></c:out> €</font></th>
														</tr>		
													</tbody>
												</table>
												<br /><br />
												
												<p align="center">
													<a href="/Electronix/listCommande">retour</a>
												</p>
												<br /><br />
												
												<hr>
													<div align="center">
														<font face="Verdana, Arial, Helvetica, sans-serif"
															size="1">Société Electronix, 44 bis rue Raspail, 75000 Paris. tel : 0126457884 ou 0165845785</font>
													</div>
											</form>

										</td>
									</tr>
								</tbody>
							</table>

						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- end of bon de commande -->
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

