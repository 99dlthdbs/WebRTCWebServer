<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet"
          href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <%
        request.setCharacterEncoding("utf-8");
    %>
    <title>비밀번호 변경</title>
</head>
<script type="text/javascript">
    function checkForm() {
        var form = document.findMember;
        if(form.mail1.value == ""){
            alert("이메일을 입력하세요.");
            return false;
        }
        return true;
    }
</script>
<body>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">비밀번호를 잊으셨나요?</h1>
            <h4>가입시 입력했던 이메일을 적어주세요.</h4>
        </div>
    </div>
    <div class="container">
        <form name="findMember" class="form-horizontal" action="updatePassword_2.jsp" method="post" onsubmit="return checkForm()">
            <div class="form-group row">
                <label class="col-sm-2">이메일</label>
                <div class="col-sm-10">
                    <input type="text" name="mail1" maxlength="50">@
                    <select name="mail2">
                        <option>naver.com</option>
                        <option>daum.net</option>
                        <option>gmail.com</option>
                        <option>nate.com</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10 ">
                    <input type="submit" class="btn btn-primary " value="비밀번호 찾기">
                    <a href="Login.jsp" class="btn btn-primary">취소</a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>