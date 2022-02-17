<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>컨시더(Consider) - waitRoom</title>
</head>
<body>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            이 곳은 회의 대기실 입니다.
        </h1>
    </div>
</div>
<div class="container">
    <div class="text-center">
        <%
            response.setIntHeader("Refresh", 5);
            Date day = new java.util.Date();
            String am_pm;
            int hour = day.getHours();
            int minute = day.getMinutes();
            int second = day.getSeconds();
            if(hour / 12 == 0){
                am_pm = "AM";
            }else{
                am_pm = "PM";
                hour = hour - 12;
            }
            String CT = hour + ":" + minute + ":" + second + " " + am_pm;
            out.println("현재 접속 시간 : " + CT + "\n");
        %>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
