<%@ page import="org.json.JSONObject" %>
<%@ page import="com.bean.JsonProvider" %>
<%@ page import="org.json.JSONArray" %><%--
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

    <style>
        .w3-card{
            box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
            padding-top: 15px;
            padding-bottom: 15px;
        }

    </style>
    <script>
        function loadhomepage() {
            $('#sortform').show();
            $('.row').show();
            $('#posts').show();
            $('#appliedjobs').empty();
            $('#editprofile').empty();
        }

        function loadappliedjobs() {
            $('#sortform').hide();
            $('.row').hide();
            $('#posts').hide();
            $('#appliedjobs').load('Candidate/appliedjobs.jsp');
            $('#editprofile').empty();
        }
        function loadeditprofile() {
            $('#sortform').hide();
            $('.row').hide();
            $('#posts').hide();
            $('#appliedjobs').empty();
            $('#editprofile').load('Candidate/editprofile.jsp');
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
            <li><a href="#" onclick="loadhomepage()">Search jobs</a></li>
            <li><a href="#" onclick="loadappliedjobs()">Applied jobs</a></li>
            <li><a href="#" onclick="loadeditprofile()">Edit your profile</a></li>

            <li>
                <a href="<%= request.getContextPath() %>/AccountController?action=logout">Logout</a>
            </li>
        </ul>


    </nav>

    <!-- Page Content Holder -->
    <div id="content">
        <nav class="navbar navbar-default">
                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-2">
                    <div class="navbar-header">
                        <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                            <i class="glyphicon glyphicon-align-left"></i>
                        </button>
                    </div>
                </div>
                <div class="col-lg-offset-9 col-md-offset-8 col-sm-offset-9 col-xs-offset-8">
                    <form id="sortform" class="form-inline" method="post" action="/Controller">
                        <input type="hidden" name="action" value="sortby">
                        <div class="form-group">
                            <label for="sortby" class="hidden-sm hidden-xs control-label">Sort by</label>
                                <select name="sortby" class="form-control" id="sortby">
                                    <option value="old" selected="true">Oldest first</option>
                                    <option value="recent">Recent first</option>
                                </select>
                        </div>
                    </form>
                </div>

        </nav>


    <div class="row">
        <form method="post" id="searchform" action="/Controller">
            <input type="hidden" name="action" value="fromsearchjob">

            <div class="col-lg-offset-1 col-lg-9 col-md-offset-1 col-md-9 col-sm-9 col-xs-9">
                <div class="form-group">
                    <input type="text" id="query" name="query" class="form-control" placeholder="Search for position eg. System Engineer, Software Engg etc.">
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3">
                <button type="submit" class="btn btn-success">SEARCH</button>
            </div>
        </form>
    </div><br>
        <div id="posts">

        </div>
        <div id="appliedjobs">

        </div>
        <div id="editprofile">

        </div>
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
<script>
   var form=$('#searchform');
    form.submit(function (e) {
    if($('#query').val().trim()==''){
        swal("Oops","You have probably entered only spaces","error");
    }else{
        $.ajax({
            url: form.attr('action'),
            type: form.attr('method'),
            data : form.serialize(),
            dataType: 'text',
            success: function(data){
                $('#posts').load("Candidate/posts.jsp");
            }
        });
    }
    e.preventDefault();
    });
</script>
<script>
    $('#sortby').change(function () {
        if($('#query').val().trim()==''){

        }else{
            var x=$('#sortby').val();
            $.ajax({
                url: 'Controller',
                type: 'POST',
                data:{
                    action: 'fromsortby',
                    operation: x,
                    query: $('#query').val()
                },
                success:function(data){
                    $('#posts').empty();
                    $('#posts').load('Candidate/posts.jsp');
                }
            });

        }
    });


</script>
</body>
</html>
