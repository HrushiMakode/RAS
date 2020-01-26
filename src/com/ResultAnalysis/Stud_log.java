package com.ResultAnalysis;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class val
 */
public class Stud_log extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stud_log() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();
		                                            // extract the user name and password from req object sent by client
		    
		    
		    String str1 = request.getParameter("prn");
		    String str2 = request.getParameter("password");
		
		
		
		try
	    {
	    		
	    String driverName = "com.mysql.cj.jdbc.Driver";
		Class.forName(driverName);
	    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/RAS","java","pass1234");
	    		
	    
	    String sql1="select password from student_log where prn=?";
		PreparedStatement stmt1=con.prepareStatement(sql1);
		stmt1.setString(1,str1);
		
		ResultSet rs1=stmt1.executeQuery();
		
		
		
		if(rs1.next())
		{
		
		if(str2.equals(rs1.getString(1)))
			response.sendRedirect("http://localhost:8080/ResultAnalysis/Dashboard/examples/suser.jsp");
		else
			out.print("not valid password");
		}
		else
			out.print("username not valid");
			 
	    con.close();
		}
		catch(Exception ex)
		{
			out.println(ex);
	 	}
		
		
		
		     
		    
		
		    
		    
	}

}
