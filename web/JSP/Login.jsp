<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../rss/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../rss/vendor/bootstrap2/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../rss/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../rss/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../rss/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../rss/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../rss/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../rss/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../rss/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../rss/css/util.css">
    <link rel="stylesheet" type="text/css" href="../rss/css/main.css">
    <!--===============================================================================================-->
    <!--FaceBook-->
    <!-- Load the JS SDK asynchronously -->
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
    <script src="<%=request.getContextPath()%>/process/js/FacebookLoginout.js"></script>
    <jsp:include page="../process/dbconn.jsp"/>
</head>
<body>
<H1 id="a"></H1>
<div class="limiter">
    <div class="container-login100" style="background-image: url('../rss/images/bg-01.jpg');">
        <div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
            <%
                String error = request.getParameter("error");
                String msg = request.getParameter("msg");
                if (error != null) {
                    out.println("<div class='alert alert-danger'>");
                    out.println("아이디와 비밀번호를 확인해 주세요");
                    out.println("</div>");
                }else if(msg != null){
                    out.println("<div class='alert alert-danger'>");
                    out.println("비밀번호가 변경되었습니다.");
                    out.println("</div>");
                }
            %>
            <form id="login-form" class="login100-form validate-form flex-sb flex-w" method="get" action="../process/processLoginMember.jsp">
                      <span class="login100-form-title p-b-53">
                          Sign In With
                      </span>
                <a href="#" id="authBtn" class="btn-face m-b-20" onclick="return fnFbCustomLogin();">
                    <i class="fa fa-facebook-official"></i>
                    Facebook
                </a>
                <div class="p-t-31 p-b-9">
                          <span class="txt1">
                              UserId
                          </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="UserId is required">
                    <input id="userid" class="input100" type="text" name="userid">
                    <span class="focus-input100"></span>
                </div>

                <div class="p-t-13 p-b-9">
                          <span class="txt1">
                              Password
                          </span>

                    <a href="updatePassword_1.jsp" class="txt2 bo1 m-l-5">
                        Forgot?
                    </a>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Password is required">
                    <input id="passwd" class="input100" type="password" name="passwd">
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn m-t-17">
                    <button class="login100-form-btn">
                        Sign In
                    </button>
                </div>

                <div class="w-full text-center p-t-55">
                          <span class="txt2">
                              Not a member?
                          </span>

                    <a href="AddMember.jsp" class="txt2 bo1">
                        Sign up now
                    </a>
                </div>
                <input type="hidden" name="name" id="name" >
                <input type="hidden" name="email" id="email" >
            </form>
        </div>
    </div>
</div>
</body>
</html>