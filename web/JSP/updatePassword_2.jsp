<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <%
        String mail1 = request.getParameter("mail1");
        String mail2 = request.getParameterValues("mail2")[0];
        String mail = mail1 + "@" + mail2;
    %>
    <sql:setDataSource var="dataSource"
                       url="jdbc:mariadb://localhost:3306/bitProject"
                       driver="org.mariadb.jdbc.Driver" user="root" password="root"/>
    <sql:query dataSource="${dataSource}" var="resultSet">
        SELECT * FROM member WHERE m_mail=?
        <sql:param value="<%=mail%>"/>
    </sql:query>

    <c:forEach var="row" items="${resultSet.rows}">
        <c:set var="mail" value="${row.mail}"/>
        <c:if test="${empty mail}">
            <script>
                alert("입력한 이메일을 찾을 수 없습니다.");
            </script>
        </c:if>
    <script>
        alert("${mail}");
    </script>

    <script type="text/javascript">
        function checkform() {
            if ($(".password").empty()) {
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }
    </script>
    <%
        request.setCharacterEncoding("utf-8");
    %>
    <title>비밀번호 변경</title>
</head>
<body>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">비밀번호를 잊으셨나요?</h1>
        <h4>새로운 비밀번호를 입력해주세요.</h4>
    </div>
</div>
<div class="container">
    <form name="newMember" class="form-horizontal" action="../process/processUpdatePassword.jsp" method="post"
          onsubmit="return checkForm()">
        
        <div class="password form-group  row">
            <label class="col-sm-2">비밀번호</label>
            <div class="col-sm-3">
                <input name="password" type="password" class="form-control" placeholder="password">
            </div>
        </div>
        <div class="password form-group  row">
            <label class="col-sm-2">비밀번호확인</label>
            <div class="col-sm-3">
                <input name="password_confirm" type="password" class="form-control" placeholder="password confirm">
            </div>
        </div>
        <div class="email form-group row">
            <div class="col-sm-offset-2 col-sm-10 ">
                <input type="submit" class="btn btn-primary " value="비밀번호 변경">
                <a href="Login.jsp" class="btn btn-primary">취소</a>
            </div>
        </div>
        <input type="hidden" name="mail1" value="<%=mail1%>">
        <input type="hidden" name="mail2" value="<%=mail2%>">
    </form>
</div>
</c:forEach>
</body>
</html>
