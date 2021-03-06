<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../process/dbconn.jsp" %>
<html>
<head>
    <link rel="stylesheet"
          href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <%-- JQuery link   --%>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <%
        String sessionId = (String) session.getAttribute("sessionId");
    %>
    <%--    <sql:setDataSource var="dataSource"--%>
    <%--                       url="jdbc:mariadb://localhost:3306/bitProject"--%>
    <%--                       driver="org.mariadb.jdbc.Driver" user="root" password="root" />--%>
    <%--    <sql:query dataSource="${dataSource}" var="resultSet">--%>
    <%--        SELECT * FROM member WHERE m_id=?--%>
    <%--        <sql:param value="<%=sessionId%>"/>--%>
    <%--    </sql:query>--%>
    <%!
        String id = null;
        String pw = null;
        String name = null;
        String gender = null;
        String birth = null;
        String birthyy = null;
        String birthmm = null;
        String birthdd = null;
        String mail = null;
        String[] str = null;
        String mail1 = null;
        String mail2 = null;
        String phone = null;
        String address = null;
        String stt = null;
        String tts = null;
    %>
    <%
        ResultSet rs = null;
        PreparedStatement pstmt = null;

        try {
            String sql = "select * from member where m_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sessionId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                id = rs.getString("m_id");
                pw = rs.getString("m_pw");
                name = rs.getString("m_name");
                gender = rs.getString("m_gender");
                birth = rs.getString("m_birth");
                str = birth.split("/");
                birthyy = str[0];
                birthmm = str[1];
                birthdd = str[2];
                mail = rs.getString("m_mail");
                str = mail.split("@");
                mail1 = str[0];
                mail2 = str[1];
                phone = rs.getString("m_phone");
                address = rs.getString("m_address");
    %>
    <title>?????????(Consider) - ?????? ??????</title>
</head>
<body onload="init()">
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">?????? ??????</h1>
    </div>
</div>
<%--<c:forEach var="row" items="${resultSet.rowsByIndex}">--%>

<%--    <c:set var="mail" value="${row.mail}"/>--%>
<%--    <c:set var="mail1" value="${mail.split('@')[0]}"/>--%>
<%--    <c:set var="mail2" value="${mail.split('@')[1]}"/>--%>

<%--    <c:set var="birth" value="${row.birth }"/>--%>
<%--    <c:set var="year" value="${birth.split('/')[0]}"/>--%>
<%--    <c:set var="month" value="${birth.split('/')[1]}"/>--%>
<%--    <c:set var="day" value="${birth.split('/')[2]}"/>--%>

<div class="container">
    <form name="newMember" class="form-horizontal"
          action="../process/processUpdateMember.jsp" method="post"
          onsubmit="return checkForm()">
        <div class="form-group  row">
            <label class="col-sm-2 ">?????????</label>
            <div class="col-sm-3">
                <input name="id" type="text" class="form-control" placeholder="id"
                       value="<%=id%>"/>
            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2">????????????</label>
            <div class="col-sm-3">
                <input name="password" type="password" class="form-control"
                       placeholder="password" value="<%=pw%>>">
            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2">??????????????????</label>
            <div class="col-sm-3">
                <input name="password_confirm" type="text" class="form-control"
                       placeholder="password_confirm">
            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2">??????</label>
            <div class="col-sm-3">
                <input name="name" type="text" class="form-control"
                       placeholder="name" value="<%=name%>">
            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2">??????</label>
            <div class="col-sm-10">
                <input id="male" name="gender" type="radio" value="<%=1%>"
                > ???
                <input id="female" name="gender" type="radio" value="<%=0%>"
                >???
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">??????</label>
            <div class="col-sm-4  ">
                <input type="text" name="birthyy" maxlength="4" placeholder="???(4???)" size="6" value="<%=birthyy%>">
                <select name="birthmm" id="birthmm">
                    <option value="">???</option>
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
                </select> <input type="text" name="birthdd" maxlength="2" placeholder="???" size="4" value="<%=birthdd%>">
            </div>
        </div>
        <div class="form-group  row ">
            <label class="col-sm-2">?????????</label>
            <div class="col-sm-10">
                <input type="text" name="mail1" maxlength="50" value="<%=mail1%>">@
                <select name="mail2" id="mail2">
                    <option>naver.com</option>
                    <option>daum.net</option>
                    <option>gmail.com</option>
                    <option>nate.com</option>
                </select>
            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2">????????????</label>
            <div class="col-sm-3">
                <input name="phone" type="text" class="form-control" placeholder="phone"
                       value="<%=phone%>">

            </div>
        </div>

        <div class="form-group  row">
            <label class="col-sm-2 ">??????</label>
            <div class="col-sm-5">
                <input name="address" type="text" class="form-control" placeholder="address"
                       value="<%=address%>">
            </div>
        </div>
        <div class="form-group  row">
            <label class="col-sm-2">?????? ??????</label>
            <div class="col-sm-10">
                <%
                    }
                    sql = "select * from func where member_m_id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, sessionId);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        stt = rs.getString("f_stt");
                        tts = rs.getString("f_tts");
                %>
                <input id="stt" name="stt" type="checkbox" value="true"/> STT(Speech to Text)
                <input id="tts" name="tts" type="checkbox" value="true"/> TTS(Text to Speech)
            </div>
        </div>
        <div class="form-group  row">
            <div class="col-sm-offset-2 col-sm-10 ">
                <input type="submit" class="btn btn-primary" value="???????????? ">
                <a href="../process/processDeleteMember.jsp" class="btn btn-primary">????????????</a>
            </div>
        </div>
    </form>
</div>
<%--</c:forEach>--%>
<%
        }
    } catch (SQLException ex) {
        out.println("Member ????????? ????????? ??????????????????.<br>");
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
</body>
</html>
<script>
    function init() {
        setComboMailValue("<%=mail2%>");
        setComboBirthValue("<%=birthmm%>");
        setCheckGenderValue("<%=gender%>");
        setCheckSttValue("<%=stt%>");
        setCheckTtsValue("<%=tts%>");
        // $('#male').prop('checked', true);
    }

    function setCheckSttValue(val){
        if(val == "1")
            $('#stt').prop('checked', true);
    }

    function setCheckTtsValue(val){
        if(val == "1")
            $('#tts').prop('checked', true);
    }

    function setComboMailValue(val) {
        var selectMail = document.getElementById('mail2');
        for (i = 0, j = selectMail.length; i < j; i++) {
            if (selectMail.options[i].value == val) {
                selectMail.options[i].selected = true;
                break;
            }
        }
    }

    function setCheckGenderValue(val){
        if(val == "1")
            $('#male').prop('checked', true);
        else if(val == "0")
            $('#female').prop('checked', true);
    }

    function setComboBirthValue(val) {
        var selectBirth = document.getElementById('birthmm');
        for (i = 0, j = selectBirth.length; i < j; i++) {
            if (selectBirth.options[i].value == val) {
                selectBirth.options[i].selected = true;
                break;
            }
        }
    }

    function checkForm() {
        if (!document.newMember.id.value) {
            alert("???????????? ???????????????.");
            return false;
        }
        if (!document.newMember.password.value) {
            alert("??????????????? ???????????????.");
            return false;
        }
        if (document.newMember.password.value != document.newMember.password_confirm.value) {
            alert("??????????????? ???????????? ???????????????.");
            return false;
        }
    }
</script>