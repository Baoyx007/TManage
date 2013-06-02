<%-- 
    Document   : gate
    Created on : May 15, 2013, 12:58:35 AM
    Author     : Haven
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose >
    <c:when test="${user!=null and user.getClass().simpleName=='Student' }"><jsp:forward page="/StudentIndexUIServlet"/></c:when>
    <c:when test="${user!=null and user.getClass().simpleName=='Admin' }"><jsp:forward page="/BackIndexUIServlet"/></c:when>
    <c:when test="${user!=null and user.getClass().simpleName=='Teacher' }"><jsp:forward page="/TeacherIndexUIServlet"/></c:when>
    <c:otherwise><jsp:forward page="/CommonIndexUIServlet"/></c:otherwise>
</c:choose> 
