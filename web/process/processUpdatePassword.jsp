<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
    request.setCharacterEncoding("UTF-8");

    String mail1 = request.getParameter("mail1");
    String mail2 = request.getParameter("mail2");
    String mail = mail1 + "@" + mail2;
    String password = request.getParameter("password");
%>

<sql:setDataSource var="dataSource"
                   url="jdbc:mariadb://39.119.241.73:3306/web"
                   driver="org.mariadb.jdbc.Driver" user="root" password="0309" />

<sql:update dataSource="${dataSource}" var="resultSet">
    UPDATE member SET m_pw=? WHERE m_mail=?
    <sql:param value="<%=password%>" />
    <sql:param value="<%=mail%>" />
</sql:update>

<c:if test="${resultSet>=1}">
    <c:redirect url="../JSP/Login.jsp?msg=0" />
</c:if>
