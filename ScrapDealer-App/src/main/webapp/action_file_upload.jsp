<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mycompany.MyConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Image</title>
</head>
 <body>
        <%
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   String filePath = "E:/Eclipse Project/ScrapDealer-App/src/main/webapp/scrap_img/";

   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      factory.setRepository(new File("c:\\temp"));
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax( maxFileSize );
      
      try{ 
      
         HttpSession hs=request.getSession(false);
         String mail=(String)hs.getAttribute("gmail");
         Integer iid=(Integer)hs.getAttribute("id");
         
         
         List fileItems = upload.parseRequest(request);
         Iterator i = fileItems.iterator();
        
         
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )  {
                String fieldName = fi.getFieldName();
                String fileName = fi.getName();
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();
                
                String s[]=fileName.split("\\.");
                int l=s.length;
                String imgType=s[l-1];
                
                fileName=""+iid+"th-img."+imgType;
                file = new File( filePath+fileName) ;
                
                fi.write( file ) ;
//                out.println("Uploaded Filename:" + filePath + fileName + "<br>");
                
                
           Connection cn=MyConnection.makeConnection();
            Statement smt=cn.createStatement();
            
           
            int j=smt.executeUpdate("update user_request set image='"+fileName+"' where gmail='"+mail+"'");
             
               if(j>0){
                out.println("<h2 style='color:yellow; text-align:center; position: absolute;top:90px;padding-left: 40%;'>Request Submited</h2>");
                
                RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
                rd.include(request, response);
                
            }
            else{
                out.println("<h5 style='color:red; text-align:center; position: absolute;top:100px;padding-left: 40%;'>Request Not Send Due To Some Error</h5>");                
                RequestDispatcher rd=request.getRequestDispatcher("img_upload.jsp");
                rd.include(request, response);
            }
                
               
            	  
            	   	
            	   	
            	   	
                
            }
         }
         
      }catch(Exception ex) {
         out.println(ex.toString());
      }
   }else{
      out.println("<html>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
%>
    </body>
</html>