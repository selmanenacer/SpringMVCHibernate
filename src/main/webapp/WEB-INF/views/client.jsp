<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>client Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<h1>
	ajouter client
</h1>

<c:url var="addAction" value="/client/add" ></c:url>

<form:form action="${addAction}" commandName="client">
<table>
	<c:if test="${!empty client.nom}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="nom">
				<spring:message text="nom"/>
			</form:label>
		</td>
		<td>
			<form:input path="nom" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="prenom">
				<spring:message text="prenom"/>
			</form:label>
		</td>
		<td>
			<form:input path="prenom" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="email">
				<spring:message text="email"/>
			</form:label>
		</td>
		<td>
			<form:input path="email" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="adresse.rue">
				<spring:message text="rue"/>
			</form:label>
		</td>
		<td>
			<form:input path="adresse.rue" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="adresse.ville">
				<spring:message text="ville"/>
			</form:label>
		</td>
		<td>
			<form:input path="adresse.ville" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="adresse.codePostal">
				<spring:message text="code Postal"/>
			</form:label>
		</td>
		<td>
			<form:input path="adresse.codePostal" />
		</td> 
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty client.nom}">
				<input type="submit"
					value="<spring:message text="Edit client"/>" />
			</c:if>
			<c:if test="${empty client.nom}">
				<input type="submit"
					value="<spring:message text="Add client"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>CLient List</h3>
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
		<th width="60">Edit</th>
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
			<td><a href="<c:url value='/editClient/${client.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/removeClient/${client.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
