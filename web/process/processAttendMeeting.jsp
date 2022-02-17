<%@ page import="java.util.Date" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="dbconn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");

    String sessionId = (String) session.getAttribute("sessionId");
    String conn1 = request.getParameter("conn1");
    String conn1Pw = request.getParameter("conn1Pw");
    String g_id = null;
    java.sql.Timestamp c_date = null;
    String g_idList = null;
    Timestamp curTimestamp = new Timestamp(System.currentTimeMillis());

    ResultSet rs = null;
    PreparedStatement pstmt = null;

    try {
        String sql = "select * from conference where c_id = ? and c_pw = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, conn1);
        pstmt.setString(2, conn1Pw);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            g_id = rs.getString("g_id");
            c_date = rs.getTimestamp("c_date");
        }
        sql = "select * from member where m_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, sessionId);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            g_idList = rs.getString("g_idList");
        }

        sql = "update member set g_idList = ? where m_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, g_idList + "," + g_id);
        pstmt.setString(2, sessionId);

        assert c_date != null;
        long temp = (curTimestamp.getTime() - c_date.getTime());
        if(temp >= 0){
            response.sendRedirect("sharingScreen.html?roomId=" + conn1 + "&roomPw" + conn1Pw);
        }else{
            response.sendRedirect("../JSP/main.jsp?msg=3&startTime=" + c_date);
        }

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

    }
%>
