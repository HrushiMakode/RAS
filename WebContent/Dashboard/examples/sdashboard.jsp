<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% 
int total=100,pass=100,fail=100,fcd=0,fc=0,hsc=0,sc=0;

String sub[]=new String[5];
float submarks[]=new float[5];
    
    try
    {
    		
    String driverName = "com.mysql.cj.jdbc.Driver";
	Class.forName(driverName);
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/RAS","java","pass1234");
    		
	Statement stmt1=con.createStatement();
	Statement stmt2=con.createStatement();
		ResultSet rs1=stmt1.executeQuery("select count(*) from final_result where yearofstudy='TE'");
		rs1.next();
		total=rs1.getInt(1);
    	ResultSet rs2=stmt2.executeQuery("select count(*) from final_result where yearofstudy='TE' and sgpa>=7.75");
    	rs2.next();
    	fcd=rs2.getInt(1);
    	
    	rs2=stmt2.executeQuery("select count(*) from final_result where yearofstudy='TE' and sgpa>=6.75 and sgpa<7.75");
    	rs2.next();
    	fc=rs2.getInt(1);
    	
    	rs2=stmt2.executeQuery("select count(*) from final_result where yearofstudy='TE' and sgpa>=6.25 and sgpa<6.75");
    	rs2.next();
    	hsc=rs2.getInt(1);
    	
    	rs2=stmt2.executeQuery("select count(*) from final_result where yearofstudy='TE' and sgpa>=5.5 and sgpa<6.25");
    	rs2.next();
    	sc=rs2.getInt(1);
    	
    	rs2=stmt2.executeQuery("select count(*) from final_result where yearofstudy='TE' and sgpa>0 and sgpa<5.5");
    	rs2.next();
    	pass=rs2.getInt(1);
    	
    	fail=total-(fcd+fc+hsc+sc+pass);
    	System.out.println(fail+" "+total);
    	

    	
    
     
    con.close();
	}
	catch(Exception ex)
	{
    out.println(ex);
 	}







%>







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
                     <a href="/examples/sdashboard.jsp" class="simple-text">
                        RAS
                     </a>
                 </div>
 
                 <ul class="nav">
                        <li>
                            <a class="nav-link active" href="suser.jsp">
                                <i class="nc-icon nc-circle-09"></i>
                                <p>User Profile</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="sdashboard.jsp">
                                <i class="nc-icon nc-chart-pie-35"></i>
                                <p>Analysis</p>
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
             <div class="content">
                 <div class="container-fluid">
                     <div class="row">
                         <div class="col-md-12">
                             <div class="card ">
                                 <div class="card-header ">
                                     <h4 class="card-title">Pie Analysis</h4>
                                     <p class="card-category">Result Analysis Pie Chart</p>
                                 </div>
                                 <div class="card-body ">
                                        <div>
                                          <canvas id="pieChart" style="max-width: 600px;margin-left: 120px;"></canvas>
                                        </div>
                                    <hr>
                                     <div class="stats">
                                         <i class="fa fa-clock-o"></i> Updated Pie Analysis
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="col-md-12">
                             <div class="card ">
                                 <div class="card-header ">
                                     <h4 class="card-title">Bar Graph Analysis</h4>
                                     <p class="card-category">Description of Bar Graph</p>
                                 </div>
                                 <div>
                                        <canvas id="barChart" style="max-width: 600px;margin-left: 120px;"></canvas>
                                </div>
                                 <div class="card-footer ">
                                     <hr>
                                     <div class="stats">
                                         <i class="fa fa-history"></i> Updated bar Analysis
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="row">
                        <div class="col-md-12">
                            <div class="card strpied-tabled-with-hover">
                                <div class="card-header ">
                                    <h4 class="card-title">Striped Table with Hover</h4>
                                    <p class="card-category">Here is a subtitle for this table</p>
                                </div>
                                <div class="card-body table-full-width table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Salary</th>
                                            <th>Country</th>
                                            <th>City</th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Dakota Rice</td>
                                                <td>$36,738</td>
                                                <td>Niger</td>
                                                <td>Oud-Turnhout</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Minerva Hooper</td>
                                                <td>$23,789</td>
                                                <td>Curaçao</td>
                                                <td>Sinaai-Waas</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Sage Rodriguez</td>
                                                <td>$56,142</td>
                                                <td>Netherlands</td>
                                                <td>Baileux</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Philip Chaney</td>
                                                <td>$38,735</td>
                                                <td>Korea, South</td>
                                                <td>Overland Park</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Doris Greene</td>
                                                <td>$63,542</td>
                                                <td>Malawi</td>
                                                <td>Feldkirchen in Kärnten</td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>Mason Porter</td>
                                                <td>$78,615</td>
                                                <td>Chile</td>
                                                <td>Gloucester</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                     </div>
                 </div>
             </div>
              <footer class="footer">
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
                             <a href="http://www.pict.edu">DBMS Mini Project</a>,made by TE student L-10 Batch
                         </p>
                     </nav>
                 </div>
             </footer>
         </div>
     </div> 
 </body>


<!-- Pie chart Working Plugin  -->
<!-- Start -->
<script type="text/javascript" src="../snippet/js/jquery-3.3.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="../snippet/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="../snippet/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="../snippet/js/mdb.min.js"></script>

<!-- End -->



<script type="text/javascript">
      //pie
      var ctxP = document.getElementById("pieChart").getContext('2d');
      var myPieChart = new Chart(ctxP, {
        type: 'pie',
        data: {
          labels: ["First Class With Distinction","First Class","Higher Second Class","Second Class","Pass Class","Fail"],
          datasets: [{
            data: [<%=fcd%>,<%=fc%>,<%=hsc%>,<%=sc%>,<%=pass%>,<%=fail%>],
            backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360","#FD4B45"],
            hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774","#FD4B45"]
          }]
        }
        ,
        options: {
          responsive: true
        }
      });

var ctx = document.getElementById('barChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
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
 