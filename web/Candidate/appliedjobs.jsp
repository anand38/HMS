<%@ page import="org.json.JSONObject" %>
<%@ page import="com.bean.JsonProvider" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="com.model.JobOperation" %><%--
  Created by IntelliJ IDEA.
  User: anand38
  Date: 3/6/17
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Applied Jobs</title>

    <!-- Bootstrap -->
    <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/customCSS/style2.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="row">
    <div class="col-lg-offset-2 col-lg-9 col-lg-offset-1 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1"
         style="background: rgba(255,249,24,0.49);padding: 15px; font-size: larger"
    >
        You have applied for these Jobs!
    </div>
</div><br><br>
<%
    try{
        JSONObject object= new JobOperation().getAppliedJobPostsObject((String)request.getSession().getAttribute("session_email"));
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
            }//End of for loop
        }// End of if
    }catch (Exception e){
        e.printStackTrace();
    }
%>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="assets/bootstrap/js/bootstrap.js"></script>
</body>
</html>
