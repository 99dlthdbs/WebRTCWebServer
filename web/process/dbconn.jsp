<%@ page import="java.sql.*" %>
<%
    Connection conn = null;

    try {
        String url = "jdbc:mariadb://localhost:3306/bitProject";
        String user = "root";
        String password = "root";

        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
    }catch (SQLException ex){
        out.println("데이터베이스 연결이 실패했습니다.<br>");
        out.println("SQLException : " + ex.getMessage());
    }
%>
