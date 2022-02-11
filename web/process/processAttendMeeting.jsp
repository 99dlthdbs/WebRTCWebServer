<%@ page import="java.util.Date" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="dbconn.jsp"%>>
<%
    request.setCharacterEncoding("utf-8");

    String sessionId = (String) session.getAttribute("sessionId");
    String conn1 = request.getParameter("conn1");
    String conn1Pw = request.getParameter("conn1Pw");
    String msg = request.getParameter("msg");

    ResultSet rs = null;
    PreparedStatement pstmt = null;

    try {
        String sql = "select * from web.conference where c_id = ? and c_pw = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, conn1);
        pstmt.setString(2, conn1Pw);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            String g_id = rs.getString("g_id");
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

    if (msg != null) {
        if (msg.equals("0") || msg.equals("1")) {
            response.sendRedirect("sharingScreen.html?roomId=" + conn1 + "&roomPw" + conn1Pw + "&msg="+msg);
        }
        else
            response.sendRedirect("sharingScreen.html?" + "msg=-1");
    } else
        response.sendRedirect("sharingScreen.html?" + "msg=-1");
%>
