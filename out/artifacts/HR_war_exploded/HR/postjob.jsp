<%--
  Created by IntelliJ IDEA.
  User: anand38
  Date: 21/5/17
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>JOB POST</title>

    <script src="assets/js/sweetalert2.min.js"></script>


    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/sweetalert2.min.css">

    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="assets/customCSS/style2.css">

</head>
<body>
    <button type="button" id="sidebarCollapse" class="btn btn-info">
        <i class="glyphicon glyphicon-align-left"></i>
    </button>

    <br><br>
    <div id="response">

    </div>
    <br><br>
    <form class="form-horizontal" id="postform" method="post" action="/Controller">
        <input type="hidden" name="action" value="frompostjob">
        <div class="form-group ui-widget">
            <label for="position" class="col-sm-2 control-label">Position</label>
            <div class="col-sm-10 col-md-8 col-lg-6">
                <input type="text" class="form-control" id="position" list="positionsuggestions" name="position" placeholder="Job Position" required>
                <datalist id="positionsuggestions">
                    <option value="Software Engineer">
                    <option value="Technical Lead">
                    <option value="Database Administrator">
                    <option value="Project Manager">
                    <option value="System Engineer">
                    <option value="Junior Consultant">
                    <option value="Hadoop Developer">
                </datalist>
            </div>
        </div>

        <div class="form-group">
            <label for="salary" class="col-sm-2 control-label">Salary</label>
            <div class="col-sm-10 col-md-8 col-lg-6">
                <select id="salary" name="salary" class="form-control">
                    <option>1,00,000-2,00,000 INR</option>
                    <option>2,00,000-3,50,000 INR</option>
                    <option>3,50,000-5,00,000 INR</option>
                    <option>5,00,000-8,00,000 INR</option>
                    <option>8,00,000 INR and above</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="location" class="col-sm-2 control-label">Job location</label>
            <div class="col-sm-10 col-md-8 col-lg-6">
                <input type="text" class="form-control" id="location" list="locationsuggestions" name="location" placeholder="Job location" required>
                <datalist id="locationsuggestions">
                    <option value="Mumbai">
                    <option value="Delhi">
                    <option value="Kolkata">
                    <option value="Chennai">
                </datalist>
            </div>
        </div>
        <div class="form-group">
            <label for="eligibility" class="col-sm-2 control-label">Eligibility</label>
            <div class="col-sm-10 col-md-8 col-lg-6">
                <textarea class="form-control" rows="5" id="eligibility" name="eligibility" placeholder="Mention eligibility criteria" required></textarea>            </div>
        </div>
        <div class="form-group">
            <label for="description" class="col-sm-2 control-label">Job Description</label>
            <div class="col-sm-10 col-md-8 col-lg-6">
                <textarea class="form-control" rows="5" id="description" name="description" placeholder="Mention Job Description" required></textarea>            </div>
        </div>
        <div class="form-group">
            <label for="opening" class="col-sm-2 control-label">No. of openings</label>
            <div class="col-sm-10 col-md-8 col-lg-6">
                <input type="number" min="0" class="form-control" id="opening" name="opening" required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Post</button>
            </div>
        </div>
    </form>


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


        var form=$('#postform');
        form.submit(function(e){
            if($('#position').val().trim() == '' ||
                    $('#salary').val().trim() == '' ||
                    $('#location').val().trim() == '' ||
                    $('#eligibility').val().trim() == '' ||
                    $('#description').val().trim() == '' ||
                    $('#opening').val().trim() == '' ){
                swal("Oops","You probably have entered only spaces in some fields",'error');
            }
            else {
                $.ajax({
                    url: form.attr('action'),
                    type: form.attr('method'),
                    data: form.serialize(),
                    success: function (data) {
                        swal('',data,'success');
                    }
                });

                $('#postform').trigger('reset');
            }
            e.preventDefault();
        });
    </script>
</body>
</html>