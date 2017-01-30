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
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />

<spring:url value="/resources/style.css" var="css" />
<spring:url value="/resources/js/boxOver.js" var="boxOver" />
<spring:url value="/resources/images" var="img" />

<link href="${css }" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${boxOver }"></script>
</head>
<body>
<div id="main_container">
  <div class="top_bar">
    
  </div>
  <div id="header">
    <div id="logo"> <a href="#"><img src="${img}/logo.png" alt="" border="0" width="237" height="140" /></a> </div>
    <div class="oferte_content">
      <div class="top_divider"><img src="${img}/header_divider.png" alt="" width="1" height="164" /></div>
      <div class="oferta">
        <div class="oferta_content">
          <div class="oferta_details">
            <div class="oferta_title">Bienvenue sur electronix site de vente de prosuits informatique</div>
          </div>
        </div>
      </div>
      <div class="top_divider"><img src="${img}/header_divider.png" alt="" width="1" height="164" /></div>
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
       
        <li><a href="" class="nav6">${sessionScope.nom} ${sessionScope.prenom}</a></li>
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
    <div class="crumb_navigation"> Navigation: <a href="#">Home</a> &lt; <span class="current">Category name</span> </div>
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
        <div class="product_img"><a href="#"><img src="${img}/laptop.png" alt="" border="0" /></a></div>
        <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
      </div>
      <div class="title_box">Newsletter</div>
      <div class="border_box">
        <input type="text" name="newsletter" class="newsletter_input" value="your email"/>
        <a href="#" class="join">join</a> </div>
      <div class="banner_adds"> <a href="#"><img src="${img}/bann2.jpg" alt="" border="0" /></a> </div>
    </div>
    <!-- end of left content -->
    <div class="center_content">
      <div class="center_title_bar">Inscription</div>
      <div class="prod_box_big">
        <div class="top_prod_box_big"></div>
        <c:choose>
             <c:when test="${resultat == 'Succès'}" >
        <div class="center_prod_box_big">
            <div class="contact_form">
            <h3>Succés de l'inscription</h3>
            </div>
          </div>
            </c:when>
            <c:when test="${resultat  == 'Échec'}">
                 <div class="center_prod_box_big">
                <div class="contact_form">
              
              
              <form method="post" action="enregistrer">
            <div class="form_row">
            
              <label class="contact"><strong>Nom:</strong></label>
              <input type="text" class="contact_input" id="nom" name="nom" value="${param.nom}"/>${erreurs['nom']}
            
            </div>
            <div class="form_row">
              <label class="contact"><strong>Prenom:</strong></label>
              <input type="text" class="contact_input" id="prenom" name="prenom" value="${param.prenom}"/>${erreurs['prenom']}
            </div>
            <div class="form_row">
              <label class="contact"><strong>Date de naissance:</strong></label>
              <input type="date" class="contact_input" id="date" name="date" value="${param.date}"/>
            </div>
            <div class="form_row">
              <label class="contact"><strong>Adresse:</strong></label>
              <input type="text" class="contact_input" id="adresse" name="adresse" value="${param.adresse}"/>
            </div>
            <div class="form_row">
              <label class="contact"><strong>Telephone:</strong></label>
              <input type="text" class="contact_input" id="tel" name="tel" value="${param.tel}"/>
            </div>
                  <div class="form_row">
              <label class="contact"><strong>Adresse Mail:</strong></label>
              <input type="text" class="contact_input" id="mail" name="mail" value="${param.mail}"/>${erreurs['mail']}
            </div>
                  
                  <div class="form_row">
              <label class="contact"><strong>Mot de passe:</strong></label>
              <input type="password" class="contact_input" id="pass" name="pass"/>${erreurs['pass']}
            </div>
                  <div class="form_row">
              <label class="contact"><strong>Confirmation:</strong></label>
              <input type="password" class="contact_input" id="confirmation" name="confirmation"/>${erreurs['confirmation']}
              <div class="form_row"> <input type="submit" value="Inscription" class="sansLabel" /> </div>
              </form>
            </div>
              </div>
            </c:when>
                <c:when test="${resultat  == 'existe'}">   
                    <div class="center_prod_box_big">
                <div class="contact_form">
              
              
              <form method="post" action="enregistrer">
            <div class="form_row">
            
              <label class="contact"><strong>Nom:</strong></label>
              <input type="text" class="contact_input" id="nom" name="nom" value="${param.nom}"/>
            
            </div>
            <div class="form_row">
              <label class="contact"><strong>Prenom:</strong></label>
              <input type="text" class="contact_input" id="prenom" name="prenom" value="${param.prenom}"/>
            </div>
            <div class="form_row">
              <label class="contact"><strong>Date de naissance:</strong></label>
              <input type="date" class="contact_input" id="date" name="date" value="${param.date}"/>
            </div>
            <div class="form_row">
              <label class="contact"><strong>Adresse:</strong></label>
              <input type="text" class="contact_input" id="adresse" name="adresse" value="${param.adresse}"/>
            </div>
            <div class="form_row">
              <label class="contact"><strong>Telephone:</strong></label>
              <input type="text" class="contact_input" id="tel" name="tel" value="${param.tel}"/>
            </div>
                  <div class="form_row">
              <label class="contact"><strong>Adresse Mail:</strong></label>
              <input type="text" class="contact_input" id="mail" name="mail" value="${param.mail}"/>
            </div>
                  
                  <div class="form_row">
              <label class="contact"><strong>Mot de passe:</strong></label>
              <input type="password" class="contact_input" id="pass" name="pass"/>
            </div>
                  <div class="form_row">
              <label class="contact"><strong>Confirmation:</strong></label>
              <input type="password" class="contact_input" id="confirmation" name="confirmation"/>
              <div class="form_row"> <input type="submit" value="Inscription" class="sansLabel" /> </div>
              </form>
            <p> <h3> un compte utilise deja cette adresse mail </h3></p>
            </div>
              </div>
                </c:when>
            <c:otherwise>
                <div class="center_prod_box_big">
                <div class="contact_form">
              
              
              <form method="post" action="enregistrer">
            <div class="form_row">
            
              <label class="contact"><strong>Nom:</strong></label>
              <input type="text" class="contact_input" id="nom" name="nom"/>${erreurs['nom']}
            
            </div>
            <div class="form_row">
              <label class="contact"><strong>Prenom:</strong></label>
              <input type="text" class="contact_input" id="prenom" name="prenom"/>${erreurs['prenom']}
            </div>
            <div class="form_row">
              <label class="contact"><strong>Date de naissance:</strong></label>
              <input type="date" class="contact_input" id="date" name="date"/>
            </div>
            <div class="form_row">
              <label class="contact"><strong>Adresse:</strong></label>
              <input type="text" class="contact_input" id="adresse" name="adresse"/>
            </div>
            <div class="form_row">
              <label class="contact"><strong>Telephone:</strong></label>
              <input type="text" class="contact_input" id="tel" name="tel"/>
            </div>
                  <div class="form_row">
              <label class="contact"><strong>Adresse Mail:</strong></label>
              <input type="text" class="contact_input" id="mail" name="mail"/>${erreurs['mail']}
            </div>
                  
                  <div class="form_row">
              <label class="contact"><strong>Mot de passe:</strong></label>
              <input type="password" class="contact_input" id="pass" name="pass"/>${erreurs['pass']}
            </div>
                  <div class="form_row">
              <label class="contact"><strong>Confirmation:</strong></label>
              <input type="password" class="contact_input" id="confirmation" name="confirmation"/>${erreurs['confirmation']}
              <div class="form_row"> <input type="submit" value="Inscription" class="sansLabel" /> </div>
              </form>
            </div>
              </div>
            </c:otherwise>
            
            </c:choose>
          
        </div>
        <div class="bottom_prod_box_big"></div>
      </div>
    </div>
    <!-- end of center content -->
    <div class="right_content">
      <div class="shopping_cart">
        <div class="cart_title">Panier</div>
        <div class="cart_details"> 3 items <br />
          <span class="border_cart"></span> Total: <span class="price">350$</span> </div>
        <div class="cart_icon"><a href="#" title="header=[Checkout] body=[&nbsp;] fade=[on]"><img src="${img}/shoppingcart.png" alt="" width="48" height="48" border="0" /></a></div>
      </div>
      <div class="title_box">Nouveauté</div>
      <div class="border_box">
        <div class="product_title">Motorola 156 MX-VL</div>
        <div class="product_img"><a href="#"><img src="${img}/p2.gif" alt="" border="0" /></a></div>
        <div class="prod_price"><span class="reduce">350$</span> <span class="price">270$</span></div>
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
      <div class="banner_adds"> <a href="#"><img src="${img}/bann1.jpg" alt="" border="0" /></a> </div>
    </div>
    <!-- end of right content -->
  </div>
  <!-- end of main content -->
  <div class="footer">
    <div class="left_footer"> <img src="${img}/footer_logo.png" alt="" width="170" height="49"/> </div>
    <div class="center_footer"> Electronix. tout droit reservé 2015<br />
      <br />
      <img src="${img}/payment.gif" alt="" /> </div>
    <div class="right_footer"> <a href="#">home</a> <a href="#">about</a> <a href="#">sitemap</a> <a href="#">rss</a> <a href="contact.html">contact us</a> </div>
  </div>
</div>
<!-- end of main_container -->
</body>
</html>

