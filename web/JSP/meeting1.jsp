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
    <%
        String sessionId = (String) session.getAttribute("sessionId");
    %>
    <title>컨시더(Consider) - meeting1</title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Input styles -->
    <link href="../css/meeting.scss" rel="stylesheet">
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@include file="sideBar.jsp"%>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@include file="topBar.jsp"%>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Start Meeting</h1>
                <p class="mb-4">회의를 시작하세요!</p>

                <!-- Page Meeting Input -->
                <div class="col-lg-9 bg-white border-left-info rounded-sm row my-4 ml-1 shadow">
                    <div class="row">
                        <div class="card col-xl-6">
                            <div class="text-center">
                                <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 80rem; height: 40rem;"
                                     src="../img/undraw_posting_photo.svg" alt="...">
                            </div>
                        </div>
                        <div>
                            <h1 class="h3 ml-4 mt-5 text-gray-800">회의 정보 입력하기</h1>
                            <form class="user p-3">
                                <div class="form-group mx-3 my-3">
                                    <label class="text-lg mr-3" for="meetingId">회의 ID</label>
                                    <input class="form-control form-control-user"
                                           type="text" placeholder="Id" id="meetingId">
                                </div>
                                <div class="form-group mx-3">
                                    <label class="text-lg mr-3" for="meetingPw">회의 비밀번호</label>
                                    <input type="password" class="form-control form-control-user"
                                           id="meetingPw" placeholder="Password">
                                </div>
                                <div class="form-group mx-3">
                                    <label class="text-lg mr-3" for="meeting___">????</label>
                                    <input type="password" class="form-control form-control-user"
                                           id="meeting___" placeholder="Password">
                                </div>
                            </form>
                            <a href="meeting3.jsp" class="btn btn-info btn-user btn-block rounded-pill mx-4 btn-lg"
                            style="width: 18rem; height: 3rem;">
                                Start Meeting !
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.jsp">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../js/sb-admin-2.min.js"></script>

</body>
</html>
