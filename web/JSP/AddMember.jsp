<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet"
          href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script type="text/javascript">
        function checkForm() {
            if (!document.newMember.id.value) {
                alert("아이디를 입력하세요.");
                return false;
            }

            if (!document.newMember.password.value) {
                alert("비밀번호를 입력하세요.");
                return false;
            }

            if (document.newMember.password.value != document.newMember.password_confirm.value) {
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
    </script>
    <%
        request.setCharacterEncoding("utf-8");
        String api = request.getParameter("api");
        String userid = "";
        String passwd = "";
        String name = "";
        String email = "";
        if (api != null) {
    %>
    <script>
        alert("연동된 계정이 없으므로 회원가입 페이지로 이동합니다.");
    </script>
    <%
            userid = request.getParameter("userid");
            passwd = request.getParameter("passwd");
            name = request.getParameter("name");
            String str = request.getParameter("email");
            if (str != null)
                email = str.substring(0, str.lastIndexOf('@'));
        }
    %>
    <title>회원 가입</title>
</head>
<body>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">회원 가입</h1>
    </div>
</div>

<div class="container">
    <form name="newMember" class="form-horizontal" action="../process/processAddMember.jsp" method="post"
          onsubmit="return checkForm()">
        <div class="form-group  row">
            <label class="col-sm-2 ">아이디</label>
            <div class="col-sm-3">
                <input name="id" type="text" class="form-control" placeholder="id" value="<%=userid%>">
            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2">비밀번호</label>
            <div class="col-sm-3">
                <input name="password" type="password" class="form-control" placeholder="password" value="<%=passwd%>">
            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2">비밀번호확인</label>
            <div class="col-sm-3">
                <input name="password_confirm" type="password" class="form-control" placeholder="password confirm"
                       value="<%=passwd%>">
            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2">성명</label>
            <div class="col-sm-3">
                <input name="name" type="text" class="form-control" placeholder="name" value="<%=name%>">
            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2">성별</label>
            <div class="col-sm-10">
                <input name="gender" type="radio" value="<%=1%>"/> 남
                <input name="gender" type="radio" value="<%=0%>"/> 여
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">생일</label>
            <div class="col-sm-4  ">
                <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6">
                <select name="birthmm">
                    <option value="">월</option>
                    <option value="01">1</option>
                    <option value="02">2</option>
                    <option value="03">3</option>
                    <option value="04">4</option>
                    <option value="05">5</option>
                    <option value="06">6</option>
                    <option value="07">7</option>
                    <option value="08">8</option>
                    <option value="09">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select> <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
            </div>
        </div>
        <div class="form-group  row ">
            <label class="col-sm-2">이메일</label>
            <div class="col-sm-10">
                <input type="text" name="mail1" maxlength="50" value="<%=email%>">@
                <select name="mail2">
                    <option>naver.com</option>
                    <option>daum.net</option>
                    <option>gmail.com</option>
                    <option>nate.com</option>
                </select>
            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2">전화번호</label>
            <div class="col-sm-3">
                <input name="phone" type="text" class="form-control" placeholder="phone">

            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2 ">주소</label>
            <div class="col-sm-5">
                <input name="address" type="text" class="form-control" placeholder="address">

            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2">기능 사용</label>
            <div class="col-sm-10">
                <input name="stt" type="checkbox" value="true"/> STT(Speech to Text)
                <input name="tts" type="checkbox" value="true"/> TTS(Text to Speech)
            </div>
        </div>
        <div class="form-group  row">
            <div class="col-sm-offset-2 col-sm-10 ">
                <input type="submit" class="btn btn-primary " value="등록 ">
                <input type="reset" class="btn btn-primary " value="취소 " onclick="reset()">
            </div>
        </div>
    </form>
</div>
</body>
</html>