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
public class Staf_reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Staf_reg() {
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
		                                            // extract the user name and password from req object sent by client
		    
		    
		    String fname = request.getParameter("fname");
		    String lname = request.getParameter("lname");
		    String email = request.getParameter("email");
		    String password = request.getParameter("password");
		
		
		
		try
	    {
	    		
	    String driverName = "com.mysql.cj.jdbc.Driver";
		Class.forName(driverName);
	    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/RAS","java","pass1234");
	    		
	    
	    String sql1="insert into staff_log values(?,?,?,?)";
		PreparedStatement stmt1=con.prepareStatement(sql1);
		stmt1.setString(1,fname);
		stmt1.setString(2,lname);
		stmt1.setString(3,email);
		stmt1.setString(4,password);

		
		stmt1.execute();
		
		
		response.sendRedirect("http://localhost:8080/ResultAnalysis/Dashboard/examples/dashboard.jsp");

		
			 
	    con.close();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
	 	}   
		
		    
		    
	}

}
