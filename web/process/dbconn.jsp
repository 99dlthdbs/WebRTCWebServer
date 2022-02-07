<%@ page import="java.sql.*" %>
<%
    Connection conn = null;

    try {
        String url = "jdbc:mariadb://39.119.241.73:3306/web";
        String user = "root";
        String password = "0309";

        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
    }catch (SQLException ex){
        out.println("데이터베이스 연결이 실패했습니다.<br>");
        out.println("SQLException : " + ex.getMessage());
    }
%>
