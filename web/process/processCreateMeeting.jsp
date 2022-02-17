<%@ page import="java.util.Date" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="dbconn.jsp" %>
<script>
    function rand(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
    }
</script>
<%!
String sessionId
        ,
        conn1
        ,
        conn1Pw
        ,
        g_id = null;
    Date currentDatetime = new Date(System.currentTimeMillis());
    java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
    java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>
<%
    request.setCharacterEncoding("utf-8");

    sessionId = (String) session.getAttribute("sessionId");
    conn1 = request.getParameter("conn1");
    conn1Pw = request.getParameter("conn1Pw");
%>
<script>
    const random = rand(1, 99999);
    <%=g_id%>
    = random;
</script>
<%
    ResultSet rs = null;
    PreparedStatement pstmt = null;

    try {
        String sql = "INSERT INTO chatGroup VALUES (?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, g_id);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            g_id = rs.getString("g_id");
        }
        sql = "insert bitproject.conference values (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, conn1);
        pstmt.setString(2, sessionId);
        pstmt.setString(3, g_id);
        pstmt.setString(4, conn1Pw);
        pstmt.setTimestamp(5, timestamp);
        rs = pstmt.executeQuery();

    } catch (SQLException ex) {
        out.println("Member 테이블 호출이 실패했습니다.<br>");
        out.println("SQLException : " + ex.getMessage());
    } finally {
        if (rs != null)
            rs.close();
        if (pstmt != null)
            pstmt.close();
        if (conn != null)
            conn.close();
        response.sendRedirect("https://121.184.11.237:3478?sessionId=" + sessionId + "&roomId=" + conn1);
    }
%>


<%--<sql:setDataSource var="dataSource"--%>
<%--                   url = "jdbc:mariadb://localhost:3306/bitProject"--%>
<%--                   driver="org.mariadb.jdbc.Driver" user="root" password="root" />--%>

<%--<sql:update dataSource="${dataSource}" var="resultSet">--%>
<%--    INSERT INTO chatGroup VALUES (?)--%>
<%--    <sql:param value="<%=g_id%>" />--%>
<%--</sql:update>--%>

<%--<sql:update dataSource="${dataSource}" var="resultSet">--%>
<%--    INSERT INTO conference VALUES (?, ?, ?, ? ,?)--%>
<%--    <sql:param value="<%=conn1%>" />--%>
<%--    <sql:param value="<%=sessionId%>" />--%>
<%--    <sql:param value="<%=g_id%>" />--%>
<%--    <sql:param value="<%=conn1Pw%>" />--%>
<%--    <sql:param value="<%=timestamp%>" />--%>
<%--</sql:update>--%>

<%--<c:if test="${resultSet>=1}">--%>
<%--    <c:redirect url="https://121.184.11.237:3478?sessionId=<%=sessionId%>&roomId=<%=conn1%>" />--%>
<%--</c:if>--%>

