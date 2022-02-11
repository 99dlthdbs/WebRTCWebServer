<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
  String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
                   url = "jdbc:mariadb://39.119.241.73:3306/web"
                   driver="org.mariadb.jdbc.Driver" user="root" password="0309"/>

<sql:update dataSource="${dataSource}" var="resultSet">
  DELETE FROM func WHERE member_m_id = ?
  <sql:param value="<%=sessionId%>"/>
</sql:update>

<sql:update dataSource="${dataSource}" var="resultSet">
  DELETE FROM member WHERE m_id = ?
  <sql:param value="<%=sessionId%>"/>
</sql:update>

<c:if test="${resultSet>=1}">
  <c:import var="url" url="processLogoutMember.jsp"/>
  <c:redirect url="../JSP/Login.jsp?del=1"/>
</c:if>