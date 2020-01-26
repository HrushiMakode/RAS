package com.ResultAnalysis;

import java.util.concurrent.TimeUnit;
import java.sql.*;
import java.time.Year;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;


public class FileUpload extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		//response.setContentType("text/html");  
	    //PrintWriter out = response.getWriter();
		
		
		String yos="";
		String yoe;
		int year=0;
		
		
	    String ext="";
	    String [] SE={"214441","214442","214443","214444","214445","214446","214447","214448","214449","207003_1","207003_2","214450","214451","214452","214453","214454","214455","214456"};
	    String [] TE={"314441","314442","314443","314444","314445","314446_1","314446_2","314447","314448","314450","314451","314452","314453","314454","314455","314456","314457","314458"};
		
			
			
			if (ServletFileUpload.isMultipartContent(request)) {  
				
			     List<FileItem> multipart;
				try {
					multipart = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				

			      for (FileItem item : multipart) 
			      {
			            if (!item.isFormField())
			            	{
			            		try {
			            			item.write(new File("/home/gaurav/eclipse-workspace/ResultAnalysis/" + item.getName()));
			            			ext=item.getName();
			            			} catch (Exception e) 
			            				{
			            				// TODO Auto-generated catch block
			            				e.printStackTrace();
			            				}
			            	}
			            if (item.isFormField()) 
			            {  
			            	if (item.getFieldName().equals("yos")) 
			            	{
			            		yos = item.getString();
			            		//out.print(yos);
			            	}
			            	else if (item.getFieldName().equals("yoe")) 
			            	{
			            		yoe = item.getString();
			            		year =Year.now().getValue();
			            		year=year-Integer.parseInt(yoe);
			            		//out.print(year);
			            	}
			            }
			      }
				} catch (FileUploadException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			
				
				try
				{
					String driverName = "com.mysql.cj.jdbc.Driver";
					Class.forName(driverName);
				    	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/temp","java","pass1234");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/RAS?allowLoadLocalInfile=true","java","pass1234");
				    		
					
						Statement stmt=con.createStatement();
						
						
						
						String sql1 ="create table bigstudent(RollNo varchar(30),PRN varchar(30),S1_1 numeric,S1_2 numeric,S1_3 numeric,S1_4 numeric,S1_5 numeric,S1_6 numeric,S1_7 numeric,S1_8 numeric,S1_9 varchar(30),S1_10 numeric,S1_11 numeric,S2_1 numeric,S2_2 numeric,S2_3 numeric,S2_4 numeric,S2_5 numeric,S2_6 numeric,S2_7 numeric,S2_8 numeric,S2_9 varchar(30),S2_10 numeric,S2_11 numeric,S3_1 numeric,S3_2 numeric,S3_3 numeric,S3_4 numeric,S3_5 numeric,S3_6 numeric,S3_7 numeric,S3_8 numeric,S3_9 varchar(30),S3_10 numeric,S3_11 numeric,S4_1 numeric,S4_2 numeric,S4_3 numeric,S4_4 numeric,S4_5 numeric,S4_6 numeric,S4_7 numeric,S4_8 numeric,S4_9 varchar(30),S4_10 numeric,S4_11 numeric,S5_1 numeric,S5_2 numeric,S5_3 numeric,S5_4 numeric,S5_5 numeric,S5_6 numeric,S5_7 numeric,S5_8 numeric,S5_9 varchar(30),S5_10 numeric,S5_11 numeric,S6_1 numeric,S6_2 numeric,S6_3 numeric,S6_4 numeric,S6_5 numeric,S6_6 numeric,S6_7 numeric,S6_8 numeric,S6_9 varchar(30),S6_10 numeric,S6_11 numeric,S7_1 numeric,S7_2 numeric,S7_3 numeric,S7_4 numeric,S7_5 numeric,S7_6 numeric,S7_7 numeric,S7_8 numeric,S7_9 varchar(30),S7_10 numeric,S7_11 numeric,S8_1 numeric,S8_2 numeric,S8_3 numeric,S8_4 numeric,S8_5 numeric,S8_6 numeric,S8_7 numeric,S8_8 numeric,S8_9 varchar(30),S8_10 numeric,S8_11 numeric,S9_1 numeric,S9_2 numeric,S9_3 numeric,S9_4 numeric,S9_5 numeric,S9_6 numeric,S9_7 numeric,S9_8 numeric,S9_9 varchar(30),S9_10 numeric,S9_11 numeric,S10_1 numeric,S10_2 numeric,S10_3 numeric,S10_4 numeric,S10_5 numeric,S10_6 numeric,S10_7 numeric,S10_8 numeric,S10_9 varchar(30),S10_10 numeric,S10_11 numeric,S11_1 numeric,S11_2 numeric,S11_3 numeric,S11_4 numeric,S11_5 numeric,S11_6 numeric,S11_7 numeric,S11_8 numeric,S11_9 varchar(30),S11_10 numeric,S11_11 numeric,S12_1 numeric,S12_2 numeric,S12_3 numeric,S12_4 numeric,S12_5 numeric,S12_6 numeric,S12_7 numeric,S12_8 numeric,S12_9 varchar(30),S12_10 numeric,S12_11 numeric,S13_1 numeric,S13_2 numeric,S13_3 numeric,S13_4 numeric,S13_5 numeric,S13_6 numeric,S13_7 numeric,S13_8 numeric,S13_9 varchar(30),S13_10 numeric,S13_11 numeric,S14_1 numeric,S14_2 numeric,S14_3 numeric,S14_4 numeric,S14_5 numeric,S14_6 numeric,S14_7 numeric,S14_8 numeric,S14_9 varchar(30),S14_10 numeric,S14_11 numeric,S15_1 numeric,S15_2 numeric,S15_3 numeric,S15_4 numeric,S15_5 numeric,S15_6 numeric,S15_7 numeric,S15_8 numeric,S15_9 varchar(30),S15_10 numeric,S15_11 numeric,S16_1 numeric,S16_2 numeric,S16_3 numeric,S16_4 numeric,S16_5 numeric,S16_6 numeric,S16_7 numeric,S16_8 numeric,S16_9 varchar(30),S16_10 numeric,S16_11 numeric,S17_1 numeric,S17_2 numeric,S17_3 numeric,S17_4 numeric,S17_5 numeric,S17_6 numeric,S17_7 numeric,S17_8 numeric,S17_9 varchar(30),S17_10 numeric,S17_11 numeric,S18_1 numeric,S18_2 numeric,S18_3 numeric,S18_4 numeric,S18_5 numeric,S18_6 numeric,S18_7 numeric,S18_8 numeric,S18_9 varchar(30),S18_10 numeric,S18_11 numeric,SGPA float)";

						boolean b1=stmt.execute(sql1);
						
						
						String sql2="load data local infile ? into table bigstudent fields terminated by ',' enclosed by '\"' lines terminated by '\n' IGNORE 1 LINES;";
						PreparedStatement stmt1=con.prepareStatement(sql2);
						 stmt1.setString(1,"/home/gaurav/eclipse-workspace/ResultAnalysis/" + ext);
						boolean b2=stmt1.execute();
						
						
						
						Statement stmt5=con.createStatement();
						String sql018="select PRN,sgpa from bigstudent";
						ResultSet rs1=stmt5.executeQuery(sql018);
						
						
						while(rs1.next())
						{
						String sql021="insert into final_result values('"+rs1.getString(1)+"',"+rs1.getFloat(2)+",'"+yos+"',"+year+")";
						stmt.execute(sql021);
						}
						
						
							
						
						
						for(int j=1;j<=18;j++)
						{
							String sql020="select PRN,S"+j+"_1,S"+j+"_2,S"+j+"_3,S"+j+"_4,S"+j+"_5,S"+j+"_6,S"+j+"_7,S"+j+"_8,S"+j+"_9,S"+j+"_10,S"+j+"_11 FROM bigstudent";

							PreparedStatement stmt3=con.prepareStatement(sql020);
							ResultSet rs=stmt3.executeQuery();
							
							String sql019;
							if(yos.equals("SE"))
								sql019="insert into result(PRN,subject,insem,theory,total,tw,pr,oral,totper,crd,grd,grdpts,crdpts,yearofexam) values(?,'"+SE[j-1]+"',?,?,?,?,?,?,?,?,?,?,?,"+year+")";
							else
								sql019="insert into result(PRN,subject,insem,theory,total,tw,pr,oral,totper,crd,grd,grdpts,crdpts,yearofexam) values(?,'"+TE[j-1]+"',?,?,?,?,?,?,?,?,?,?,?,"+year+")";
				    	
							System.out.println(sql019);

							while(rs.next())
							{				
					    
								PreparedStatement stmt2=con.prepareStatement(sql019);
								for(int i=1;i<=12;i++)
									stmt2.setString(i,rs.getString(i));
								stmt2.execute();	
							}
					    
					    
						  }
				    
						
						
						
						
						
						
						
						Statement stmt4=con.createStatement();
						String sql022="drop table bigstudent";
						stmt4.execute(sql022);
				 
				         con.close();
				    }
				    catch(Exception ex)
				    {
				        //System.out.println(ex);
				    }
				
				
				response.sendRedirect("http://localhost:8080/ResultAnalysis/Dashboard/examples/tdashboard.jsp");
				return;
			}
			
			
			}	
		
		
	}
	
	

	

		
