    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.google.gson.Gson"%>
    <%@ page import="com.google.gson.JsonObject"%>
     
    <%
    Gson gsonObj = new Gson();
    Map<Object,Object> map = null;
    List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
    
    int total=100,pass=100,fail=100,fcd=0,fc=0,hsc=0,sc=0;
    
    try
    {
    		
    String driverName = "com.mysql.cj.jdbc.Driver";
	Class.forName(driverName);
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/temp2","java","pass1234");
    		
	Statement stmt1=con.createStatement();
	Statement stmt2=con.createStatement();
		ResultSet rs1=stmt1.executeQuery("select count(*) from stud_info");
		rs1.next();
		total=rs1.getInt(1);
    	ResultSet rs2=stmt2.executeQuery("select count(*) from stud_info where sgpa>=7.75");
    	rs2.next();
    	fcd=rs2.getInt(1);
    	
    	rs2=stmt2.executeQuery("select count(*) from stud_info where sgpa>=6.75 and sgpa<7.75");
    	rs2.next();
    	fc=rs2.getInt(1);
    	
    	rs2=stmt2.executeQuery("select count(*) from stud_info where sgpa>=6.25 and sgpa<6.75");
    	rs2.next();
    	hsc=rs2.getInt(1);
    	
    	rs2=stmt2.executeQuery("select count(*) from stud_info where sgpa>=5.5 and sgpa<6.25");
    	rs2.next();
    	sc=rs2.getInt(1);
    	
    	rs2=stmt2.executeQuery("select count(*) from stud_info where sgpa>0 and sgpa<5.5");
    	rs2.next();
    	pass=rs2.getInt(1);
    	
    	fail=total-(fcd+fc+hsc+sc+pass);
    
     
    con.close();
	}
	catch(Exception ex)
	{
    out.println(ex);
 	}
    
     
    map = new HashMap<Object,Object>(); map.put("label", "Pass"); map.put("y", pass*100/total); map.put("exploded", true); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "Fail"); map.put("y", fail*100/total); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "First class with distinction"); map.put("y", fcd*100/total); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "First class"); map.put("y", fc*100/total); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "Higher second class"); map.put("y",hsc*100/total); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "Second class"); map.put("y",sc*100/total); list.add(map);
 
    
    String dataPoints = gsonObj.toJson(list);
    
    
    
    %>
     
    <!DOCTYPE HTML>
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
    window.onload = function() { 
     
    var chart = new CanvasJS.Chart("chartContainer", {
    	theme: "light2",
    	animationEnabled: true,
    	exportFileName: "Pass Fail Result",
    	exportEnabled: true,
    	title:{
    		text: "Pass Fail Result"
    	},
    	data: [{
    		type: "pie",
    		showInLegend: true,
    		legendText: "{label}",
    		toolTipContent: "{label}: <strong>{y}%</strong>",
    		indexLabel: "{label} {y}%",
    		dataPoints : <%out.print(dataPoints);%>
    	}]
    });
     
    chart.render();
     
    }
    </script>
    </head>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <body>
    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    <div class="container">
  <h2>Result Overview</h2>
  <table class="table">
    <thead>
      <tr>
        <th>Category</th>
        <th>Count</th>
        <th>Percentage</th>
      </tr>
    </thead>
    <tbody>      
      <tr class="success">
        <td>First Class With Distinction</td>
        <td><%=fcd%></td>
        <td><%=fcd*100/total%></td>
      </tr>
      <tr class="info">
        <td>First Class</td>
        <td><%=fc%></td>
        <td><%=fc*100/total%></td>
      </tr>
      <tr class="success">
        <td>Higher Second Class</td>
        <td><%=hsc%></td>
        <td><%=hsc*100/total%></td>
      </tr>
      <tr class="info">
        <td>Second Class</td>
        <td><%=sc%></td>
        <td><%=sc*100/total%></td>
      </tr>
      <tr class="success">
        <td>Pass Class</td>
        <td><%=pass%></td>
        <td><%=pass*100/total%></td>
      </tr>
      <tr class="danger">
        <td>Fail</td>
        <td><%=fail%></td>
        <td><%=fail*100/total%></td>
      </tr>
    </tbody>
  </table>
</div>

<% 
try
{
	String driverName = "com.mysql.cj.jdbc.Driver";
	Class.forName(driverName);
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/temp2?allowLoadLocalInfile=true","java","pass1234");
    		
	/* Passing argument through the question mark */
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from stud_info order by sgpa desc limit 10"); 
		
		%><div class="container">
		  <h2>Topper's List</h2>
		  <table class="table">
		    <thead>
		      <tr>
		      	<th>Rank</th>
		        <th>Roll No </th>
		        <th>PRN</th>
		        <th>SGPA</th>
		      </tr>
		    </thead>
		    <tbody> <%     
		    		int rank=1;
				    while(rs.next())
				    {
				    	%>
				    	<tr class="success">
				    	<td><%=rank%></td>
				        <td><%=rs.getString(1)%></td>
				        <td><%=rs.getString(2)%></td>
				        <td><%=rs.getFloat(3)%></td>
				      </tr>
				      	<%
				      	rank++;
				      	if(rs.next())
				      	{
				      		%>
					    	<tr class="info">
					    	<td><%=rank%></td>
					        <td><%=rs.getString(1)%></td>
					        <td><%=rs.getString(2)%></td>
					        <td><%=rs.getFloat(3)%></td>
					      </tr>
					      	<%
				      	}
				      rank++;
				    }
				    

				         con.close();
				    }
				    catch(Exception ex)
				    {
				        System.out.println(ex);
				     }

%>
	</tbody>
  </table>
</div>




    </body>
    </html>                              