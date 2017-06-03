<%@ page import="org.json.JSONObject" %>
<%@ page import="com.bean.JsonProvider" %>
<%@ page import="org.json.JSONArray" %><%--
  Created by IntelliJ IDEA.
  User: anand38
  Date: 3/6/17
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>POSTS</title>
</head>
<body>
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
            }//End of for loop
        }// End of if
    }catch (Exception e){
        e.printStackTrace();
    }
%>
</body>
</html>
