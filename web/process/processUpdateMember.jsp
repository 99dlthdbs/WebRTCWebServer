<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String year = request.getParameter("birthyy");
    String month = request.getParameterValues("birthmm")[0];
    String day = request.getParameter("birthdd");
    String birth = year + "/" + month + "/" + day;
    String mail1 = request.getParameter("mail1");
    String mail2 = request.getParameterValues("mail2")[0];
    String mail = mail1 + "@" + mail2;
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    Boolean stt = Boolean.valueOf(request.getParameter("stt"));
    Boolean tts = Boolean.valueOf(request.getParameter("tts"));

    Date currentDatetime = new Date(System.currentTimeMillis());
    java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
    java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
                   url = "jdbc:mariadb://39.119.241.73:3306/web"
                   driver="org.mariadb.jdbc.Driver" user="root" password="0309" />

<sql:update dataSource="${dataSource}" var="resultSet">
    UPDATE member SET m_pw=?, m_name=?, m_gender=?, m_birth=?, m_mail=?, m_phone=?, m_address=? WHERE m_id=?
    <sql:param value="<%=password%>" />
    <sql:param value="<%=name%>" />
    <sql:param value="<%=gender%>" />
    <sql:param value="<%=birth%>" />
    <sql:param value="<%=mail%>" />
    <sql:param value="<%=phone%>" />
    <sql:param value="<%=address%>" />
    <sql:param value="<%=id%>" />
</sql:update>
<sql:update dataSource="${dataSource}" var="resultSet">
    UPDATE func SET f_stt=?, f_tts=? WHERE member_m_id=?
    <sql:param value="<%=stt%>"/>
    <sql:param value="<%=tts%>"/>
    <sql:param value="<%=id%>"/>
</sql:update>

<c:if test="${resultSet>=1}">
    <c:redirect url="../JSP/main.jsp?msg=0" />
</c:if>
