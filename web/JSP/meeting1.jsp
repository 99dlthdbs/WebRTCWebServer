<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <!-- https://fullcalendar.io/docs/month-view-demo -->
    <!-- https://fullcalendar.io/docs/getting-started -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>컨시더(Consider) - meeting1</title>

    <!-- Custom fonts for this template-->
    <link href="../rss/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../rss/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Input styles -->
    <link href="../rss/css/meeting.scss" rel="stylesheet">
    <%
        String sessionId = (String) session.getAttribute("sessionId");
    %>
    <script>
        // 방번호 생성방법
        // 1) 데이터베이스에 접근하여 값을 설정하기
        // 2) 랜덤 값을 통해 설정(현재)
        function makeRoom() {
            // 랜덤 값 생성
            document.getElementById("conn1").value = rand(1, 99999999);

            // button 비활성화
            const btn = document.getElementById("createbtn");
            btn.disabled = true;
        }

        function rand(min, max) {
            return Math.floor(Math.random() * (max - min)) + min;
        }
    </script>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <%@include file="sideBar.jsp" %>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <%@include file="topBar.jsp" %>
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Start Meeting</h1>
                <p class="mb-4">회의를 시작하세요!</p>

                <!-- Page Meeting Input -->
                <div class="col-lg-12 bg-white border-left-info rounded-sm row my-4 ml-1 shadow">
                    <div class="row">
                        <div class="card col-xl-6">
                            <div class="text-center">
                                <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 80rem; height: 40rem;"
                                     src="../rss/images/undraw_posting_photo.svg" alt="...">
                            </div>
                        </div>
                        <div>
                            <h4 class="h3 ml-4 mt-5 text-gray-800">Description of Consider</h4>
                            <p class="ml-4">1. 회의 참여시 회의는 자동으로 녹화됩니다.<br>
                                2. 회의 중 마이크 사용이 어려운 경우, TTS 기능으로 음성을 전달할수 있습니다.<br>
                                3. 말하는 것을 STT 모두 저장되어 있습니다.</p>
                            <!-- 회의 생성 -->
                            <form action="../process/processCreateMeeting.jsp" method="get" class="user p-3">
                                <div class="form-group mx-3 my-3">
                                    <label class="text-lg mr-3" for="conn1">회의 ID</label>
                                    <input class="form-control form-control-user" type="text" id="conn1" name="conn1" placeholder="Conference ID">
                                    <input type="hidden" id="msg" name="msg" value="1">
                                </div>
                                <input type="button" id="createbtn" name="createbtn" value="회의 ID 생성"
                                       class="btn btn-info btn-user btn-block rounded-pill mx-4 btn-lg mt-2"
                                       style="width: 32rem; height: 3rem;" onclick="makeRoom()">
                                <div class="form-group mx-3 mt-4">
                                    <label class="text-lg mr-3" for="conn1Pw">회의 비밀번호</label>
                                    <input type="password" class="form-control form-control-user"
                                           id="conn1Pw" placeholder="Password">
                                </div>
                                <button type="submit"
                                        class="btn btn-info btn-user btn-block rounded-pill mt-2 mx-4 btn-lg"
                                        style="width: 32rem; height: 3rem;">
                                    Start Meeting !
                                </button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- End of Main Content -->
        <%@ include file="footer.jsp" %>
    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<%@ include file="logoutModal.jsp" %>

<!-- Bootstrap core JavaScript-->
<script src="../rss/vendor/jquery/jquery.min.js"></script>
<script src="../rss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../rss/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../process/js/sb-admin-2.min.js"></script>

</body>
</html>
