<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
    request.setCharacterEncoding("UTF-8");

    String api = request.getParameter("api");

    String id = request.getParameter("userid");
    String password = request.getParameter("passwd");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
%>

<sql:setDataSource var="dataSource"
                   url="jdbc:mariadb://localhost:3306/bitProject"
                   driver="org.mariadb.jdbc.Driver" user="root" password="root" />

<sql:query dataSource="${dataSource}" var="resultSet">
    SELECT * FROM MEMBER WHERE m_id=? and m_pw=?
    <sql:param value="<%=id%>" />
    <sql:param value="<%=password%>" />
</sql:query>


<c:forEach var="row" items="${resultSet.rows}">
    <%
        session.setAttribute("sessionId", id);
    %>
    <c:redirect url="../JSP/main.jsp?msg=2" />
</c:forEach>

<c:set var="api" value="<%=api%>"/>

<c:choose>
    <c:when test="${!empty api}">
        <c:redirect url="../JSP/AddMember.jsp?api=1" >
            <c:param name="userid" value="<%=id%>"/>
            <c:param name="passwd" value="<%=password%>"/>
            <c:param name="name" value="<%=name%>"/>
            <c:param name="email" value="<%=email%>"/>
        </c:redirect>
    </c:when>
    <c:otherwise>
        <c:redirect url="../JSP/Login.jsp?error=1" />
    </c:otherwise>
</c:choose>

