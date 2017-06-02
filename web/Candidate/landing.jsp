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
    <style>
        .w3-card{
            box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
            padding-top: 15px;
            padding-bottom: 15px;
        }
    </style>
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
            <li><a href="#" >Home</a></li>
            <li><a href="#" >Post JOB</a></li>
            <li><a href="#" >View Applicants</a></li>
            <li><a href="#" >All job posts</a></li>
            <li><a href="#" >Edit your profile</a></li>
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
    </div>
        <br><br>
           <%
               try{
               JSONObject object= JsonProvider.getObject();
               if(object!=null){
               JSONArray array=object.getJSONArray("posts");

                   for (int i=0;i<array.length();i++){
                       String position=array.getJSONObject(i).getString("position");
                       String salary=array.getJSONObject(i).getString("salary");
                       String location=array.getJSONObject(i).getString("location");
                       String openings=array.getJSONObject(i).getString("openings");
                       String eligibility=array.getJSONObject(i).getString("eligibility");
                       String description=array.getJSONObject(i).getString("description");
                       String date_of_post=array.getJSONObject(i).getString("date_of_post");
           %>

        <div class="row">
            <div class="col-lg-offset-2 col-lg-9 col-lg-offset-1 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 w3-card">
                <!--JOB ID:<br>-->
                <div style="color: rgba(165,81,31,0.98);
        font-size: large;

    "><B><%= position %></B></div><br>
                <div style="font-family:'Comic Sans MS' ">
                    Salary: <%= salary %><br><br>
                    Location: <%= location %><br><br>
                    <!--<div style="text-align: right"><button class="btn btn-success">Apply</button></div> -->
                    <hr style="height:1px;border:none;color:rgba(144,151,156,0.96);background-color:rgba(144,151,156,0.96);">

                    <B style="color: #0f0f0f">No. of openings: </B><%= openings %><br><br>
                    <B style="color: #0f0f0f">Eligibility:</B><br> <%= eligibility %><br><br>
                    <B style="color: #0f0f0f">Job Description:</B><br> <%= description %><br><br>
                </div>
                <div style="text-align: right">Posted on: <B style="color: rgba(114,118,123,0.96)"><%= date_of_post %></B></div><br>
            </div>

        </div>
        <br><br>

        <%
                   }
                }
               }catch (Exception e){
                e.printStackTrace();
            }
            %>
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
                setTimeout(location.reload.bind(location), 500);            }
        });
    }
    e.preventDefault();
    });
</script>
</body>
</html>
