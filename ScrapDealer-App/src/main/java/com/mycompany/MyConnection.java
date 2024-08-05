package com.mycompany;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnection {
	public static Connection makeConnection()
	  {
	       Connection cn=null;
	      try
	      {
	    Class.forName("com.mysql.cj.jdbc.Driver");
			
	    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/scrap_app","root","");  
	       
	      }
	      catch(Exception e)
	      {
	          
	      }
	         return cn;
	  }
}
