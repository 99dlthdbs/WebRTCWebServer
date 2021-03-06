<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>컨시더(Consider) - Main </title>
    <!-- Custom fonts for this template-->
    <link href="../rss/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="../rss/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- bootstrap <link rel="stylesheet" type="text/css" href="../rss/vendor/bootstrap2/css/bootstrap.min.css">-->
    <link rel="stylesheet" type="text/css" href="../rss/vendor/bootstrap2/css/bootstrap.min.css">
    <%
        String sessionId = (String) session.getAttribute("sessionId");
        String msg = request.getParameter("msg");
        String startTime = request.getParameter("startTime");

        if (msg != null) {
            if (msg.equals("0"))
                out.println("<script>alert('회원정보가 수정되었습니다.');</script>");
            else if (msg.equals("1"))
                out.println("<script>alert('회원가입을 축하드립니다.');</script>");
            else if (msg.equals("2")) {
                String loginId = (String) session.getAttribute("sessionId");
                out.println("<script>alert('" + loginId + "님 환영합니다');</script>");
            }else if(msg.equals("3")){
                out.println("<script>alert('회의방이 아직 개설되지 않았습니다.'" + startTime + "' 이후에 다시 참여해주시기 바랍니다.');</script>");
            }
        }
    %>
</head>
<body id="page-top">
<div id="wrapper">
    <%@include file="sideBar.jsp" %>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <%@ include file="topBar.jsp" %>
            <!-- Begin Page Content -->
            <!-- 희선님 코드 -->
            <div class="container-fluid">
                <!-- Content Row -->
                <div class="row">
                    <!-- Main Logo -->
                    <div class="col-xl-7 col-lg-3 mb-4">
                        <div class="card h-100 py-2 ">
                            <div class="text-center">
                                <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 80%"
                                     src="../rss/images/main_logo.png" alt="consider 로고">
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-5 col-lg-3 mb-4">
                        <div class="card h-100 py-2">
                            <div class="text-center text-lg p-4 text-xl text-monospace">
                                <h3>그동안 화상 회의를 할 때 <br> 장애인의 소통 통로가 없었습니다.
                                </h3>
                                <p class="mt-5">
                                    <strong>Consider</strong> : 고려하다, 숙고하다.
                                </p>
                                <p class="mt-5">
                                    장애인과 비장애인이 불편함 없이 소통하기 위해 저희는 장애인을 고려한
                                    웹사이트를 만들었습니다.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Content Row -->
                <div class="row">
                    <div class="col-xl-4 col-lg-3 mb-4">
                        <div class="card h-100 py-2 shadow border-left-primary">
                            <div class="text-center p-4 text-monospace">
                                <h1>1, STT(Speech-to-Text)</h1>
                                <p class="text-xl mt-3">회의 내용을 실시간 자막으로 확인하여
                                    <br>
                                    장애인과 비장애인의 소통의 부재를 채울 수 있습니다!
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4 col-lg-3 mb-4">
                        <div class="card h-100 py-2 shadow border-left-primary">
                            <div class="text-center p-4 text-monospace">
                                <h1>2, TTS(Text-to-Speech)</h1>
                                <p class="text-xl mt-3">
                                    어눌한 발음으로 인한 대화의 불편함을
                                    <br>
                                    해결하기 위해
                                    채팅으로 보낸 메시지를
                                    실시간으로 읽어줄 수 있습니다!
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4 col-lg-3 mb-4">
                        <div class="card h-100 py-2 shadow border-left-primary">
                            <div class="text-center p-4 text-monospace">
                                <h1>3, Calendar</h1>
                                <p class="text-xl mt-3">
                                    회의 일정을 미리 예약하여
                                    <br>
                                    제 시간에 회의를 할 수 있도록 도와줍니다!
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 소윤님 코드 -->
                <div class="row">
                    <div class="col-xl-12 col-lg-3 mb-4">
                        <div class="card h-100 py-2 ">
                            <div class="text-center" style="margin: 20px">
                                <h2>기존 화상회의를 사용하면서 불편하신 점은 없으셨나요?</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Content Row -->
                <div class="row">
                    <!-- Main Logo -->
                    <div class="col-xl-5 col-lg-3 mb-4">
                        <div class="card h-100 py-2 ">
                            <div class="text-center m-3">
                                <h3 class="mb-3 p-3"><strong>장애인 학생들 "비대면 원격수업서 소외…학교도 외면"</strong></h3>
                                <p align="left" class="m-4" style="font-size: 20px;">장애인 대학생들이 26일 신종 코로나바이러스 감염증(코로나19)로 원격 교육이 진행 중인 학교 현장에서 여전히
                                    애로를 겪고 있다고 토로했다.

                                    전국장애인야학협의회 등은 이날 서울 종로구 혜화동 노들장애인야학에서 집담회를 열어 장애인 학생들과 함께 비대면 수업에서 어려움을 느낀 사례를 공유했다.

                                    시각장애인인 조은산 서강대 학생은 "시각장애인들이 이용하는 <strong>스크린리더 기술</strong>을 수업 중에 제약 없이 이용할 수 있어야
                                    한다"고 말했다.

                                    <strong>스크린 리더는 화면에 나타난 텍스트를 기기가 소리 내 읽어주고 상황에 맞는 조작법을 음성으로 안내해주는 기능</strong>으로,
                                    시각장인들은 이 기능으로 스마트폰이나 컴퓨터 등 전자기기를 사용한다.<br>
                                    <a class="m-4" href="https://www.mk.co.kr/news/society/view/2021/02/193023">출처 : 매일경제 연합뉴스</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-7 col-lg-3 mb-4">
                        <div class="card h-100 py-2">
                            <div class="text-center text-lg p-4 text-xl text-monospace">
                                <h3 align="left">청각장애인 125명 중 28명은<br>
                                    화상회의를 사용하면서 자막이 가장 도움이 되었다고 합니다.
                                </h3>
                                <br>
                                <!-- Pie Chart -->
                                <div class="card shadow mb-4">
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="chart-pie pt-4 pb-2">
                                            <canvas id="myPieChart"></canvas>
                                        </div>
                                        <div class="mt-4 text-center small">
                                                <span class="mr-2" style="font-size: 20px;">
                                                    <i class="fas fa-circle text-primary"></i> 자막 제공
                                                </span>
                                            <span class="mr-2" style="font-size: 20px;">
                                                    <i class="fas fa-circle text-success"></i> 천천히 말하기
                                                </span>
                                            <span class="mr-2" style="font-size: 20px;">
                                                    <i class="fas fa-circle text-info"></i> 시각적 자료
                                                </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="m-4"
                                    href="https://cms.dankook.ac.kr/web/dkseri/-15?p_p_id=Bbs_WAR_bbsportlet&p_p_lifecycle=2&p_p_state=normal&p_p_mode=view&p_p_cacheability=cacheLevelPage&p_p_col_id=column-2&p_p_col_count=1&_Bbs_WAR_bbsportlet_extFileId=130783">
                                출처 : COVID-19 상황에서 통합학급 청각장애 학생의<br>
                                온라인 수업 실태와 요구도 조사
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- End of Main Content -->
        <%@ include file="footer.jsp"%>
    </div>
    <!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<%@ include file="logoutModal.jsp"%>

<!-- Bootstrap core JavaScript-->
<script src="../rss/vendor/jquery/jquery.min.js"></script>
<script src="../rss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="../rss/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="../process/js/sb-admin-2.min.js"></script>
<!-- Page level plugins -->
<script src="../rss/vendor/chart.js/Chart.min.js"></script>
<!-- Page level custom scripts -->
<script src="../process/js/demo/chart-area-demo.js"></script>
<script src="../process/js/demo/chart-pie-demo.js"></script>
</body>
</html>
