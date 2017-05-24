<%--
  Created by IntelliJ IDEA.
  User: anand38
  Date: 7/5/17
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>HOME</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="assets/customCSS/style2.css">

    <script language="javascript">

        function getApplications() {
            $("#content").empty();
            $("#content").load("HR/applications.jsp");
        }
        function getHome() {
            $("#content").empty();
            $("#content").load("HR/home.jsp");
        }
        function getpostjob(){
            $("#content").empty();
            $("#content").load("HR/postjob.jsp");
        }
        function getAllPosts() {
            $("#content").empty();
            $("#content").load("HR/posts.jsp");

        }
    </script>
</head>
<body>
<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);

    if(session.getAttribute("session_flag")==null)
        response.sendRedirect("index.jsp");
%>

<div class="wrapper">
    <!-- Sidebar Holder -->
    <nav id="sidebar">
        <% if (request.getSession(false).getAttribute("session_flag").equals("101")){
        %>
            <div class="sidebar-header">
                <img src="assets/img/HRProfile/profile.jpg"  class="img-circle" height="50px" width="50px">
                Hello,&nbsp;<%= session.getAttribute("session_name") %>
            </div>
        <%
            }
        %>

        <ul class="list-unstyled components">

            <!--

<li class="active">
    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">Home</a>
    <ul class="collapse list-unstyled" id="homeSubmenu">
        <li><a href="#">Post JOB</a></li>
        <li><a href="#">View Applications</a></li>
        <li><a href="#">Edit your profile</a></li>
    </ul>
</li>
<li>
    <a href="#">About</a>
    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">Pages</a>
    <ul class="collapse list-unstyled" id="pageSubmenu">
        <li><a href="#">Page 1</a></li>
        <li><a href="#">Page 2</a></li>
        <li><a href="#">Page 3</a></li>
    </ul>
</li>
<li>
    <a href="#">Portfolio</a>
</li>
<li>
    <a href="#">Contact</a>
</li>
-->
            <li><a href="#" onclick="getHome()">Home</a></li>
            <li><a href="#" onclick="getpostjob()">Post JOB</a></li>
            <li><a href="#" onclick="getApplications()">View Applicants</a></li>
            <li><a href="#" onclick="getAllPosts()">All job posts</a></li>
            <li><a href="#">Edit your profile</a></li>
            <li>
            <a href="<%= request.getContextPath() %>/AccountController?action=logout">Logout</a>
            </li>
        </ul>


    </nav>

    <!-- Page Content Holder -->
    <div id="content">
        <nav class="navbar navbar-default">
            <div class="container-fluid">

                <div class="navbar-header">
                    <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                        <i class="glyphicon glyphicon-align-left"></i>
                    </button>

                </div>
            </div>
        </nav>

        <h2>Collapsible Sidebar Using Bootstrap 3</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

        <div class="line"></div>

        <h2>Lorem Ipsum Dolor</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

        <div class="line"></div>

        <h2>Lorem Ipsum Dolor</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

        <div class="line"></div>

        <h3>Lorem Ipsum Dolor</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>


    </div>
</div>






<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- Bootstrap Js CDN -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery Nicescroll CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.6.8-fix/jquery.nicescroll.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#sidebar").niceScroll({
            cursorcolor: '#53619d',
            cursorwidth: 4,
            cursorborder: 'none'
        });

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar, #content').toggleClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });
    });
</script>
</body>
</html>
