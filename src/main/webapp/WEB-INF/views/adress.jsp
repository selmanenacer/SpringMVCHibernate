<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Adress Page</title>
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
</head>
<body>
	<h1>Add an Adress</h1>

	<c:url var="addAction" value="/adress/add"></c:url>

	<form:form action="${addAction}" commandName="adress">
		<table>
			<c:if test="${!empty adress.rue}">
				<tr>
					<td><form:label path="id">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="id" /></td>
				</tr>
			</c:if>
			<tr>
				<td><form:label path="rue">
						<spring:message text="rue" />
					</form:label></td>
				<td><form:input path="rue" /></td>
			</tr>
			<tr>
				<td><form:label path="ville">
						<spring:message text="ville" />
					</form:label></td>
				<td><form:input path="ville" /></td>
			</tr>
			<tr>
				<td><form:label path="codePostal">
						<spring:message text="code postal" />
					</form:label></td>
				<td><form:input path="codePostal" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty adress.rue}">
						<input type="submit" value="<spring:message text="Edit Adress"/>" />
					</c:if> <c:if test="${empty adress.rue}">
						<input type="submit" value="<spring:message text="Add Adress"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<br>
	<h3>Adresses List</h3>
	<c:if test="${!empty listAdresses}">
		<table class="tg">
			<tr>
				<th width="80">Adress ID</th>
				<th width="120">Adress Rue</th>
				<th width="120">Adress Ville</th>
				<th width="120">Adress ZIP</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			<c:forEach items="${listAdresses}" var="adress">
				<tr>
					<td>${adress.id}</td>
					<td>${adress.rue}</td>
					<td>${adress.ville}</td>
					<td>${adress.codePostal}</td>
					<td><a href="<c:url value='/editAdr/${adress.id}' />">Edit</a></td>
					<td><a href="<c:url value='/removeAdr/${adress.id}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>
