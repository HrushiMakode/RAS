    <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.google.gson.Gson"%>
    <%@ page import="com.google.gson.JsonObject"%>
     
    <%
    Gson gsonObj = new Gson();
    Map<Object,Object> map = null;
    List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
    
    int total=100,pass=100,fail=100;
    
    try
    {
    		
    String driverName = "com.mysql.cj.jdbc.Driver";
	Class.forName(driverName);
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/temp2","java","pass1234");
    
    Statement stmt=con.createStatement();
	String sql1 ="create table student(RollNo varchar(30),PRN varchar(30),S1_1 numeric,S1_2 numeric,S1_3 numeric,S1_4 numeric,S1_5 numeric,S1_6 numeric,S1_7 numeric,S1_8 numeric,S1_9 varchar(30),S1_10 numeric,S1_11 numeric,S2_1 numeric,S2_2 numeric,S2_3 numeric,S2_4 numeric,S2_5 numeric,S2_6 numeric,S2_7 numeric,S2_8 numeric,S2_9 varchar(30),S2_10 numeric,S2_11 numeric,S3_1 numeric,S3_2 numeric,S3_3 numeric,S3_4 numeric,S3_5 numeric,S3_6 numeric,S3_7 numeric,S3_8 numeric,S3_9 varchar(30),S3_10 numeric,S3_11 numeric,S4_1 numeric,S4_2 numeric,S4_3 numeric,S4_4 numeric,S4_5 numeric,S4_6 numeric,S4_7 numeric,S4_8 numeric,S4_9 varchar(30),S4_10 numeric,S4_11 numeric,S5_1 numeric,S5_2 numeric,S5_3 numeric,S5_4 numeric,S5_5 numeric,S5_6 numeric,S5_7 numeric,S5_8 numeric,S5_9 varchar(30),S5_10 numeric,S5_11 numeric,S6_1 numeric,S6_2 numeric,S6_3 numeric,S6_4 numeric,S6_5 numeric,S6_6 numeric,S6_7 numeric,S6_8 numeric,S6_9 varchar(30),S6_10 numeric,S6_11 numeric,S7_1 numeric,S7_2 numeric,S7_3 numeric,S7_4 numeric,S7_5 numeric,S7_6 numeric,S7_7 numeric,S7_8 numeric,S7_9 varchar(30),S7_10 numeric,S7_11 numeric,S8_1 numeric,S8_2 numeric,S8_3 numeric,S8_4 numeric,S8_5 numeric,S8_6 numeric,S8_7 numeric,S8_8 numeric,S8_9 varchar(30),S8_10 numeric,S8_11 numeric,S9_1 numeric,S9_2 numeric,S9_3 numeric,S9_4 numeric,S9_5 numeric,S9_6 numeric,S9_7 numeric,S9_8 numeric,S9_9 varchar(30),S9_10 numeric,S9_11 numeric,S10_1 numeric,S10_2 numeric,S10_3 numeric,S10_4 numeric,S10_5 numeric,S10_6 numeric,S10_7 numeric,S10_8 numeric,S10_9 varchar(30),S10_10 numeric,S10_11 numeric,S11_1 numeric,S11_2 numeric,S11_3 numeric,S11_4 numeric,S11_5 numeric,S11_6 numeric,S11_7 numeric,S11_8 numeric,S11_9 varchar(30),S11_10 numeric,S11_11 numeric,S12_1 numeric,S12_2 numeric,S12_3 numeric,S12_4 numeric,S12_5 numeric,S12_6 numeric,S12_7 numeric,S12_8 numeric,S12_9 varchar(30),S12_10 numeric,S12_11 numeric,S13_1 numeric,S13_2 numeric,S13_3 numeric,S13_4 numeric,S13_5 numeric,S13_6 numeric,S13_7 numeric,S13_8 numeric,S13_9 varchar(30),S13_10 numeric,S13_11 numeric,S14_1 numeric,S14_2 numeric,S14_3 numeric,S14_4 numeric,S14_5 numeric,S14_6 numeric,S14_7 numeric,S14_8 numeric,S14_9 varchar(30),S14_10 numeric,S14_11 numeric,S15_1 numeric,S15_2 numeric,S15_3 numeric,S15_4 numeric,S15_5 numeric,S15_6 numeric,S15_7 numeric,S15_8 numeric,S15_9 varchar(30),S15_10 numeric,S15_11 numeric,S16_1 numeric,S16_2 numeric,S16_3 numeric,S16_4 numeric,S16_5 numeric,S16_6 numeric,S16_7 numeric,S16_8 numeric,S16_9 varchar(30),S16_10 numeric,S16_11 numeric,S17_1 numeric,S17_2 numeric,S17_3 numeric,S17_4 numeric,S17_5 numeric,S17_6 numeric,S17_7 numeric,S17_8 numeric,S17_9 varchar(30),S17_10 numeric,S17_11 numeric,SGPA numeric)";
	boolean b1=stmt.execute(sql1);
    		
	Statement stmt1=con.createStatement();
	Statement stmt2=con.createStatement();
		ResultSet rs1=stmt1.executeQuery("select count(*) from student");
		rs1.next();
		total=rs1.getInt(1);
    	ResultSet rs2=stmt2.executeQuery("select count(*) from student where sgpa>0");
    	rs2.next();
    	pass=rs2.getInt(1);
    	fail=total-pass;
    	
    	out.print(total+" "+pass+" "+fail);
     
    con.close();
	}
	catch(Exception ex)
	{
    out.println(ex);
 	}
    
     
    map = new HashMap<Object,Object>(); map.put("label", "Pass"); map.put("y", pass*100/total); map.put("exploded", true); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "Fail"); map.put("y", fail*100/total); list.add(map);
    //map = new HashMap<Object,Object>(); map.put("label", "Career"); map.put("y", 18); list.add(map);
    //map = new HashMap<Object,Object>(); map.put("label", "Education"); map.put("y", 15); list.add(map);
    //map = new HashMap<Object,Object>(); map.put("label", "Family"); map.put("y", 5); list.add(map);
    //map = new HashMap<Object,Object>(); map.put("label", "Real Estate"); map.put("y", 7); list.add(map);
     
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
    <body>
    hello
    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </body>
    </html>                              