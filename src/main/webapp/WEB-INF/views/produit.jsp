<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>



<title>Person Page</title>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}
</style>
<spring:url value="/resources/style.css" var="css" />
<spring:url value="/resources/js/boxOver.js" var="boxOver" />
<spring:url value="/resources/images" var="img" />
</head>
<body>
	<h1>Add a Produit</h1>

	<c:url var="addAction" value="/produit/add"></c:url>
 
	<form:form action="${addAction}" commandName="produit" enctype="multipart/form-data">
		<table>
			<c:if test="${!empty produit.libelle}">
				<tr>
					<td><form:label path="id">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="id" /></td>
				</tr>
			</c:if>
			<tr>
				<td><form:label path="libelle">
						<spring:message text="libelle" />
					</form:label></td>
				<td><form:input path="libelle" /></td>
			</tr>
			<tr>
				<td><form:label path="stock">
						<spring:message text="stock" />
					</form:label></td>
				<td><form:input path="stock" /></td>
			</tr>
			<tr>  
				<td><form:label path="categorie.id">
						<spring:message text="categorie" />
					</form:label></td>
				<td><form:select path="categorie.id">
				<c:forEach items="${listCategorie}" var="categorie">
						<form:option value="${categorie.id}" label="${categorie.nom}"/>
						</c:forEach>
					</form:select></td> 
					
					
			</tr>
			<tr><td>File to upload:</td><td><input type="file" name="file" /></td></tr>
				
			<tr>
				<td colspan="2"><c:if test="${!empty produit.libelle}">
						<input type="submit" value="<spring:message text="Edit produit"/>" />
					</c:if> <c:if test="${empty produit.libelle}">
						<input type="submit" value="<spring:message text="Add produit"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<br>
	<h3>Persons List</h3>
	<c:if test="${!empty listProduit}">
		<table class="tg">
			<tr>
				<th width="80">ID</th>
				<th width="120">photo </th>
				<th width="120">libelle</th>
				<th width="120">stock</th>
				<th width="120">Categorie</th>
				<th width="120">Description</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			<c:forEach items="${listProduit}" var="produit">
				<tr>
					<td>${produit.id}</td>
					<td> <img src="${img}/${produit.urlImg}" alt="" border="0" width="120" height="140" /></td>
					<td>${produit.libelle}</td>
					<td>${produit.stock}</td>
					<td>${produit.categorie.nom}</td>
					<td>${produit.categorie.description}</td>
					<td><a href="<c:url value='/editProduit/${produit.id}' />">Edit</a></td>
					<td><a href="<c:url value='/removeProduit/${produit.id}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>
