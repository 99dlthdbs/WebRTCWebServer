<%--
  Created by IntelliJ IDEA.
  User: heesun
  Date: 2022-01-11
  Time: 오전 4:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>컨시더(Consider) - calendar</title>
    <!-- Custom fonts for this template -->
    <link href="../rss/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../rss/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Calendar Css-->
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" charset="UTF-8"
          href="https://translate.googleapis.com/translate_static/css/translateelement.css">
    <!-- Custom styles for this page -->
    <link href="../rss/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
    <%
        String sessionId = (String) session.getAttribute("sessionId");
    %>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                timeZone: 'UTC',
                initialView: 'dayGridMonth',
                aspectRatio: 1.8,
                headerToolbar: {
                    right: 'today,prev,next',
                    center: 'title',
                    left: 'timeGridWeek,dayGridMonth'
                },
                events: [
                    { id: '1', start: '2022-01-18T12:00:00', end: '2022-01-18T14:00:00', title: '회의 1' },
                    { id: '2', start: '2022-01-18T18:00:00', end: '2022-01-18T19:00:00', title: '회의 2' },
                    { id: '3', start: '2022-01-19T18:00:00', end: '2022-01-19T19:00:00', title: '회의 3' },
                    { id: '4', resourceId: 'e', start: '2018-02-07T03:00:00', end: '2018-02-07T08:00:00', title: 'event 4' },
                    { id: '5', resourceId: 'f', start: '2018-02-07T00:30:00', end: '2018-02-07T02:30:00', title: 'event 5' }
                ]
            });

            calendar.render();
        });

    </script>
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
           <%@include file="topBar.jsp"%>
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Calendar</h1>
                <p class="mb-4">해당 페이지에서 예약된 회의 확인 혹은 회의를 예약하세요!</p>

                <!-- Page Calendar -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <a class="nav-link-p m-0 font-weight-bold text-primary text-right ">회의 예약하기</a>
                    </div>
                    <div class="card-body">
                        <div id='calendar'></div>
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
<script src="../rss/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="../rss/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="../process/js/demo/datatables-demo.js"></script>

</body>
</html>
