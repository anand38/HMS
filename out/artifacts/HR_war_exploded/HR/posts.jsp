<%@ page import="com.model.JobOperation" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="com.bean.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.JSONArray" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>All Posts</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .w3-card{
            box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
            padding-top: 15px;
            padding-bottom: 15px;
        }
    </style>
</head>
<body>
<button type="button" id="sidebarCollapse" class="btn btn-info">
    <i class="glyphicon glyphicon-align-left"></i>
</button>
<%
    JobOperation jb=new JobOperation();
    JSONObject object=new JSONObject();
    try {
        ArrayList<Post> list=jb.getPosts();
        JSONArray array=new JSONArray();
        for (Post p:list){
            JSONObject j=new JSONObject();
            j.put("jobid",p.getJobid());
            j.put("position",p.getPosition());
            j.put("salary",p.getSalary());
            j.put("location",p.getLocation());
            j.put("openings",p.getOpenings());
            j.put("eligibility",p.getEligibility());
            j.put("description",p.getDescription());
            j.put("date_of_post",p.getDate_of_post());
            array.put(j);
        }
        object.put("posts",array);
       // out.print("JSON:\n" + object.toString());
    } catch (Exception e) {
        e.printStackTrace();
    }

    JSONArray array=object.getJSONArray("posts");
    try{
    for (int i=0;i<array.length();i++){
        int jobid=array.getJSONObject(i).getInt("jobid");
        String position=array.getJSONObject(i).getString("position");
        String salary=array.getJSONObject(i).getString("salary");
        String location=array.getJSONObject(i).getString("location");
        String openings=array.getJSONObject(i).getString("openings");
        String eligibility=array.getJSONObject(i).getString("eligibility");
        String description=array.getJSONObject(i).getString("description");
        String date_of_post=array.getJSONObject(i).getString("date_of_post");

%>
<div class="row">
    <div class="col-lg-offset-2 col-lg-7 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 w3-card">
        <!--JOB ID: <%= jobid %><br>-->
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
    }catch (Exception e){
        e.printStackTrace();
    }
%>



<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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