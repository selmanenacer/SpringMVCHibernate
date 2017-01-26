<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>login Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>

<body>
			<c:url var="loginAction" value="/login" ></c:url>

				<form:form action="${loginAction}" id="loginForm" method="post" commandName="login" >
	            <form:label path="email">Email</form:label>
	            <form:input id="email" name="email" path="email" /><br>
	            <form:label path="email">mot de passe </form:label>
	            <form:password id="psw" name="psw" path="psw" /><br>
	            <input type="submit" value="Submit" />
	        </form:form>
	        <c:if test="${!empty client}">
	         <h1>client ${client.nom} ${client.prenom} connecter !!   </h1>
	        
	        </c:if>
	        
	         <c:if test="${!empty admin}">
	         <h1>admin ${admin.nom} ${admin.prenom} connecter !!   </h1>
	        
	        </c:if>
	         <c:if test="${!empty erreur}">
	         <h1> ${erreur}    </h1>
	        
	        </c:if>
	    </body>
</html>
	    