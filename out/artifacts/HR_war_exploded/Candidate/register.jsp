<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Register</title>

    <!-- Bootstrap -->
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet">
    <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="assets/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="row">
    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1  col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1" style="text-align: right;margin-top: 2%">
        Already a member? <a href="#">Click here</a> to login
    </div>
    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1  col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1"
         style="background: rgba(255,249,24,0.49);padding: 15px; font-size: larger"
    >
        REGISTER FOR FREE AND FIND YOUR DREAM JOB!!
    </div>
</div>
<form id="myform" name="myform" class="form-horizontal" style="margin-top: 2%" method="post" enctype = "multipart/form-data" action="<%= request.getContextPath() %>/Updater">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1  col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1" style="margin-top: 20px;">
            <div style="border-bottom: 1px solid rgba(29,41,19,0.57)"><B>Login Details:</B><br></div>
            <div class="form-horizontal" style="margin-top: 2%">
                <div class="form-group">
                    <label for="foremail" class="col-md-3 col-sm-3 control-label">Email :</label>
                    <div class="col-lg-5 col-md-6 col-sm-8">
                        <input type="email" name="email" class="form-control" id="foremail" placeholder="Your Email ID here" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="col-md-3  col-sm-3 control-label">Password :</label>
                    <div class="col-lg-5 col-md-6 col-sm-8">
                        <input type="password" name="password" class="form-control" id="password" placeholder="Your password here" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="repassword" class="col-md-3  col-sm-3 control-label">Confirm Password :</label>
                    <div class="col-lg-5 col-md-6 col-sm-8">
                        <input type="password" name="repassword" class="form-control" id="repassword" placeholder="Password again pls :)"  required>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1  col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1" style="margin-top: 20px;">
            <div style="border-bottom: 1px solid rgba(29,41,19,0.57)"><B>Education:</B><br></div>

            <div class="form-horizontal"  style="margin-top: 2%">

                <div class="form-group">
                    <label for="forhighestdegree" class="col-md-3 col-sm-3 control-label">Highest Degree :</label>
                    <div class="col-lg-5 col-md-6 col-sm-8">
                        <select name="highest_degree" class="form-control" id="forhighestdegree" required>
                            <option value="" selected="true" disabled="disabled">Select Highest Degree</option>
                            <option value="Graduation/Bachelors Degree or Equivalent">Graduation/Bachelors Degree or Equivalent</option>
                            <option value="Post Graduation/Masters Degree or Equivalent">Post Graduation/Masters Degree or Equivalent</option>
                            <option value="Doctorate">Doctorate</option>
                        </select>
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <label for="forcollegename" class="col-md-3 col-sm-3 control-label">College/Institute :</label>
                    <div class="col-lg-5 col-md-6 col-sm-8">
                        <input type="text" name="college_name" class="form-control" id="forcollegename" placeholder="College/Institute Name"  required>
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <label for="forcourse" class="col-md-3 col-sm-3 control-label">Course :</label>
                    <div class="col-lg-5 col-md-6 col-sm-8">
                        <select name="course" id="forcourse" class="form-control" required>
                            <option value="" selected="true" disabled="disabled">Select course</option>
                            <option value="B.Com">B.Com</option>
                            <option value="B.A.">B.A.</option>
                            <option value="B.Arch">B.Arch</option>
                            <option value="B.Ed">B.Ed</option>
                            <option value="B.Pharma">B.Pharma</option>
                            <option value="B.Sc">B.Sc</option>
                            <option value="B.E">B.E</option>
                            <option value="B.tech">B.tech</option>
                            <option value="Diploma">Diploma</option>
                            <option value="M.B.B.S">M.B.B.S</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <label for="forspecialization" class="col-md-3 col-sm-3 control-label">Specialization :</label>
                    <div class="col-lg-5 col-md-6 col-sm-8">
                        <input type="text" name="specialization" class="form-control" id="forspecialization" placeholder="Your specialization here"  required>
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <label for="foryop" class="col-md-3 col-sm-3 control-label">Year of Passing :</label>
                    <div class="col-lg-2 col-md-2 col-sm-3">
                        <select required name="monthofyop" id="foryop" class="form-control"  >
                            <option value="" selected="true" disabled="disabled">Month</option>
                            <option value="January">January</option>
                            <option value="February">February</option>
                            <option value="March">March</option>
                            <option value="April">April</option>
                            <option value="May">May</option>
                            <option value="June">June</option>
                            <option value="July">July</option>
                            <option value="August">August</option>
                            <option value="September">September</option>
                            <option value="October">October</option>
                            <option value="November">November</option>
                            <option value="December">December</option>
                        </select>
                    </div>

                    <div class="col-lg-2 col-md-2 col-sm-2">
                        <select name="yearofyop" class="form-control"  required>
                            <option value="" selected="true" disabled="disabled">Year</option>
                            <option value="2012">2012</option>
                            <option value="2013">2013</option>
                            <option value="2014">2014</option>
                            <option value="2015">2015</option>
                            <option value="2016">2016</option>
                            <option value="2017">2017</option>
                            <option value="2018">2018</option>
                            <option value="2019">2019</option>
                        </select>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1  col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1" style="margin-top: 20px;">
            <div style="border-bottom: 1px solid rgba(29,41,19,0.57)"><B>Personal details:</B><br></div>
            <div class="form-horizontal" style="margin-top: 2%">
                <div class="form-group">
                    <label for="forname" class="col-md-3 col-sm-3 control-label">Name :</label>
                    <div class="col-lg-5 col-md-6 col-sm-8">
                        <input type="text" name="name" class="form-control" id="forname" placeholder="Your Name here"  required>
                    </div>
                </div>
                <br>
                <div class="form-group">

                    <label class="col-md-3 col-sm-3 control-label">Gender :</label>

                    <label class="radio-inline">
                        <input type="radio" name="gender" id="inlineRadio1" value="male" required> Male
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="gender" id="inlineRadio2" value="female" required> Female
                    </label>

                </div>
                <br>
                <div class="form-group">

                    <label class="col-md-3 col-sm-3 control-label">DOB :</label>
                    <div class=" col-lg-5 col-md-6 col-sm-8">
                        <input type="date" name="dob" id="date" class="form-control" required />
                    </div>
                </div>
                <br>
                <div class="form-group">

                    <label class="col-md-3 col-sm-3 control-label">Contact :</label>
                    <div class=" col-lg-5 col-md-6 col-sm-8">
                        <input type="tel" name="contact" class="form-control"  required />
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <label class="col-md-3 col-sm-3 control-label" for="exampleInputFile">File input</label>
                    <div class=" col-lg-5 col-md-6 col-sm-8">
                        <input type="file" id="exampleInputFile" name="resume" required>
                        <p class="help-block">Attach your CV here</p>
                    </div>
                </div>
                <br>
                <div class="col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-4">
                    <button type="submit" class="btn btn-info">SUBMIT&nbsp;&nbsp;<i class="fa fa-angle-double-right" aria-hidden="true"></i></button>
                </div>
            </div>

        </div>
    </div>
</form>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="assets/js/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script>
    (function() {
        var elem = document.createElement('input');
        elem.setAttribute('type', 'date');

        if ( elem.type === 'text' ) {
            $('#date').datepicker();
        }
    })();
</script>
<script>
    $('#myform').submit(function () {
        if ($('#password').val().trim()=='' || $('#repassword').val().trim()==''){
            swal("Oops","Spaces not allowed in passwords","error");
            return false;
        }else {
            if ($('#password').val()!= $('#repassword').val()){
                swal("Oops","Passwords don't match","error");
                return false;
            }
        }

    });
</script>
<script>
    $(document).ready(function () {
        $('input[type=file]').change(function () {
            var val = $(this).val().toLowerCase();
            var regex = new RegExp("(.*?)\.(docx|doc|pdf)$");
            if(!(regex.test(val))) {
                $(this).val('');
                swal("","Please select correct file format to upload eg: doc,docx,pdf","error");
            } }); });
</script>
</body>
</html>