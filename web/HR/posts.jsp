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
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

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


%>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>