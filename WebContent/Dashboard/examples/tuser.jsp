<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
     <title>Light Bootstrap Dashboard - Free Bootstrap 4 Admin Dashboard by Creative Tim</title>
     <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    
     <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="../snippet/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="../snippet/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="../snippet/css/style.css" rel="stylesheet">



     <!--     Fonts and icons     -->
     <!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" /> -->
     <!-- CSS Files -->
     <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
     <link href="../assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
     <!-- CSS Just for demo purpose, don't include it in your project -->
     <!-- <link href="../assets/css/demo.css" rel="stylesheet" /> -->
 </head>
 
 <body>
     <div class="wrapper">
         <div class="sidebar" data-color="purple" >
             <!--
         Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
 
         Tip 2: you can also add an image using data-image tag
     -->
             <div class="sidebar-wrapper">
                 <div class="logo">
                     <a href="tuser.jsp" class="simple-text">
                        RAS
                     </a>
                 </div>
 
                 <ul class="nav">
                        <li>
                            <a class="nav-link active" href="tuser.jsp">
                                <i class="nc-icon nc-circle-09"></i>
                                <p>User Profile</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="search.jsp">
                                <i class="nc-icon nc-zoom-split"></i>
                                <p>Search</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="tdashboard.jsp">
                                <i class="nc-icon nc-chart-pie-35"></i>
                                <p>Analysis</p>
                            </a>
                        </li>
                        <li>
                            <a class="nav-link" href="upload.jsp">
                                <i class="nc-icon nc-notes"></i>
                                <p>Upload Result</p>
                            </a>
                        </li>
                        <li>
                            <form id="my_form" method="post" action="Logout">
                                <a class="nav-link" href="javascript:{}" onclick="document.getElementById('my_form').submit();"s>
                                        <i class="nc-icon nc-button-power"></i>
                                        <p>Log out</p>
                                </a>
                            </form>
                        </li>
                </ul>
             </div>
         </div>
         <div class="main-panel">
             <!--  Content -->
             <div class="content" style="height:90%">
                    <div class="container-fluid">
                        <div class="row">
                             <div class="col-md-8">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Edit Profile (Staff)</h4>
                                    </div>
                                    <div class="card-body">
                                        <form action="" method="POST">
                                                <div class="row">
                                                        <div class="col-md-9 pr-1">
                                                            <div class="form-group">
                                                                <label>PICT Email</label>
                                                                <input type="text" class="form-control"  placeholder="PICT Email" value="">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 pl-1">
                                                                <div class="form-group">
                                                                    <label>Gender</label>
                                                                    <select class="form-control" id="hello" onchange="changeUser(this.id)">
                                                                        <option value="face-9.png">Male</option>
                                                                        <option value="face-8.png" selected>Female</option>
                                                                        <option value="face-1.jpg">Other</option>
                                                                    </select>
                                                                </div>
                                                        </div>
                                                    </div>
                                            <div class="row">
                                                <div class="col-md-6 pr-1">
                                                    <div class="form-group">
                                                        <label>First Name</label>
                                                        <input type="text" class="form-control" placeholder="First Name" value="Eleven">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 pl-1">
                                                    <div class="form-group">
                                                        <label>Last Name</label>
                                                        <input type="text" class="form-control" placeholder="Last Name" value="Hopper">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label>Contact Number</label>
                                                            <input type="tel" class="form-control" id="mob" onchange="showmob(this.id)" placeholder="Enter Mobile Number">
                                                        </div>
                                                    </div>
                                            </div>
                                            <!-- <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Address</label>
                                                        <input type="text" class="form-control" placeholder="Home Address" value="Hawkins,Indiana">
                                                    </div>
                                                </div>
                                            </div> -->
                                            <!-- <div class="row">
                                                <div class="col-md-4 pr-1">
                                                    <div class="form-group">
                                                        <label>City</label>
                                                        <input type="text" class="form-control" placeholder="City" value="Hawkins">
                                                    </div>
                                                </div>
                                                <div class="col-md-4 px-1">
                                                    <div class="form-group">
                                                        <label>Country</label>
                                                        <input type="text" class="form-control" placeholder="Country" value="USA">
                                                    </div>
                                                </div>
                                                <div class="col-md-4 pl-1">
                                                    <div class="form-group">
                                                        <label>Postal Code</label>
                                                        <input type="number" class="form-control" placeholder="ZIP Code" value="411043">
                                                    </div>
                                                </div>
                                            </div> -->
                                            <!-- <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>About Me</label>
                                                        <textarea rows="4" cols="80" class="form-control" placeholder="Here can be your description" value="Mike">Lamborghini Mercy, Your chick she so thirsty, I'm in that two seat Lambo.</textarea>
                                                    </div>
                                                </div>
                                            </div> -->
                                            <button type="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>
                                            <div class="clearfix"></div>
                                        </form>
                                    </div>
                                </div>
                            </div> 
                            <div class="col-md-4">
                                    <div class="card card-user">
                                        <div class="card-image">
                                            <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400" alt="...">
                                        </div>
                                        <div class="card-body">
                                            <hr>
                                            <div class="author">
                                                <img class="avatar border-gray" id="userImage" src="../assets/img/faces/face-9.png" alt="...">
                                                <h5 class="title"> User Name </h5>
                                            </div>
                                            <hr>
                                        </div>
                                       
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
             <!--footer-->
              <footer class="footer" >
                 <div class="container-fluid">
                     <nav>
                         <ul class="footer-menu">
                             <li>
                                 <a href="#">
                                    About us
                                 </a>
                             </li>
                         </ul>
                         <p class="copyright text-center">
                             ©
                             <script>
                                 document.write(new Date().getFullYear())
                             </script>
                             <a href="http://www.pict.edu">DBMS Mini Project</a>,made by TE student,L-10 Batch
                         </p>
                     </nav>
                 </div>
             </footer>
         </div>
     </div> 
 </body>

 <!-- User Image Changing JS -->

 <script>
    function changeUser(id){
        var item= document.getElementById(id);
        var itemvalue= item.options[item.selectedIndex].value;
        var image=document.getElementById("userImage"); 
        image.src="../assets/img/faces/"+itemvalue;
    }
 </script>

 <!--   Core JS Files   -->
 <script src="../assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
 <script src="../assets/js/core/popper.min.js" type="text/javascript"></script>
 <script src="../assets/js/core/bootstrap.min.js" type="text/javascript"></script>
 <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
 <script src="../assets/js/plugins/bootstrap-switch.js"></script>
 <!--  Notifications Plugin    -->
 <script src="../assets/js/plugins/bootstrap-notify.js"></script>
 <!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
 <script src="../assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
 <!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! --> 
 </html>
 