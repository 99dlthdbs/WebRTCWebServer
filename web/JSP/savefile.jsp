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
    <title>컨시더(Consider) - saveFile</title>

    <!-- Custom fonts for this template-->
    <link href="../rss/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../rss/css/sb-admin-2.min.css" rel="stylesheet">
    <%
        String sessionId = (String) session.getAttribute("sessionId");
    %>
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <%@include file="sideBar.jsp"%>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <%@include file="topBar.jsp"%>
            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">??</h1>
                <p class="mb-4">저장된 text 파일을 확인하세요!</p>

                <!-- Page Content -->
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="row">

                            <div class="co-lg-4">
                                <textarea class="rounded-sm"
                                          cols="70" rows="25"></textarea>
                            </div>

                            <div class="col-lg-4 ml-5">

                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary text-center">저장된 파일 확인</h6>
                                    </div>
                                    <div class="card-body">

                                    </div>
                                </div>
                            </div>
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
<%@ include file="logoutModal.jsp"%>

<!-- Bootstrap core JavaScript-->
<script src="../rss/vendor/jquery/jquery.min.js"></script>
<script src="../rss/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../rss/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../process/js/sb-admin-2.min.js"></script>

</body>
</html>

