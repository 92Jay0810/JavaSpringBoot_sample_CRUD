<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
    <title>Welcome</title>
</head>
<body>
Welcome ! This is coming from a model-map - a JSP
<h2>create</h2>
<table >
<c:forEach var="customershow" items="${customer}">
    <tr>
        <td>${customer.id}</td>
        <td>${contact.firstname}</td>
        <td>${contact.lastname}</td>
    </tr>
</c:forEach>
</table>

</body>
</html>