<%@ page import="java.util.Date" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="dbconn.jsp" %>
<%!
String sessionId
        ,
        conn1
        ,
        conn1Pw
        ,
        g_id
        ,
        startDatetime
        ,
        endDatetime = null;
    java.sql.Timestamp tt = null;
%>
<%
    request.setCharacterEncoding("utf-8");

    sessionId = (String) session.getAttribute("sessionId");
    conn1 = request.getParameter("conn1");
    conn1Pw = request.getParameter("conn1Pw");
    g_id = request.getParameter("g_id");
    startDatetime = request.getParameter("connStartDate");
    endDatetime = request.getParameter("connEndDate");


    startDatetime += ":00";
    endDatetime += ":00";
    String temp = startDatetime.replace("T", " ");
    tt = Timestamp.valueOf(temp);
//
//    Date date;
//    SimpleDateFormat fromFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm");
//    out.println("<script>alert(startDatetime);</script>");
//
//    date = fromFormat.parse(startDatetime);
//    tt = new Timestamp(date.getTime());

%>
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
    } catch (SQLException ex) {
        out.println("chatGroup 테이블 호출이 실패했습니다.<br>");
        out.println("SQLException : " + ex.getMessage());
    }
    try {
        String sql = "insert into reserve values (?,?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, conn1);
        pstmt.setString(2, g_id);
        pstmt.setString(3, startDatetime);
        pstmt.setString(4, endDatetime);
        pstmt.setString(5, conn1Pw);
        rs = pstmt.executeQuery();
    } catch (SQLException ex) {
        out.println("reserve 테이블 호출이 실패했습니다.<br>");
        out.println("SQLException : " + ex.getMessage());
    }
    try {
        String sql = "insert into conference values (?,?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, conn1);
        pstmt.setString(2, sessionId);
        pstmt.setString(3, g_id);
        pstmt.setString(4, conn1Pw);
        pstmt.setTimestamp(5, tt);
        rs = pstmt.executeQuery();

        response.sendRedirect("../JSP/calendar.jsp?sessionId=" + sessionId + "&roomId=" + conn1 + "&reserve=1" + "&startDate=" + startDatetime + "&endDate=" + endDatetime);

    } catch (SQLException ex) {
        out.println("conference 테이블 호출이 실패했습니다.<br>");
        out.println("SQLException : " + ex.getMessage());
    } finally {
        if (rs != null)
            rs.close();
        if (pstmt != null)
            pstmt.close();
        if (conn != null)
            conn.close();
    }
%>
