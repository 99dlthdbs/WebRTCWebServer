<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
    request.setCharacterEncoding("utf-8");

    String sessionId = (String) session.getAttribute("sessionId");
    String conn1 = request.getParameter("conn1");
    String conn1Pw = request.getParameter("conn1Pw");
    String msg = request.getParameter("msg");
    String g_id = "1";

    Date currentDatetime = new Date(System.currentTimeMillis());
    java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
    java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>
<sql:setDataSource var="dataSource"
                   url = "jdbc:mariadb://121.184.11.237:3306/web"
                   driver="org.mariadb.jdbc.Driver" user="root" password="0309" />

<sql:update dataSource="${dataSource}" var="resultSet">
    INSERT INTO chatGroup VALUES (?)
    <sql:param value="<%=g_id%>>" />
</sql:update>
<sql:update dataSource="${dataSource}" var="resultSet">
    INSERT INTO conference VALUES (?, ?, ?, ? ,?)
    <sql:param value="<%=conn1%>" />
    <sql:param value="<%=sessionId%>" />
    <sql:param value="<%=g_id%>" />
    <sql:param value="<%=conn1Pw%>" />
    <sql:param value="<%=timestamp%>" />
</sql:update>

<c:if test="${resultSet>=1}">
    <c:redirect url="../JSP/main.jsp?msg=1" />
</c:if>

<%
    if (msg != null) {
        if (msg.equals("0") || msg.equals("1")) {
            response.sendRedirect("sharingScreen.html?roomId=" + conn1 + "&roomPw" + conn1Pw + "&msg="+msg);
        }
        else
            response.sendRedirect("sharingScreen.html?" + "msg=-1");
    } else
        response.sendRedirect("sharingScreen.html?" + "msg=-1");
%>
