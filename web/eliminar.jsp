<%-- 
    Document   : eliminar
    Created on : 27/09/2020, 05:43:37 PM
    Author     : Alexander
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            
            String cod=request.getParameter("cod");
            
            java.sql.Connection cnx=null;
            ResultSet rs=null;
            Statement sta=null;
            try{
            Class.forName("com.mysql.jdbc.Driver");
            cnx=DriverManager.getConnection("jdbc:mysql://localhost/bd_certificados?user=root&password=");
            
            sta=cnx.createStatement();
            sta.executeUpdate("delete from usuario where cod_usuario='"+cod+"'");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            }catch(Exception e){out.print(e+"");}
                        
            %>
        
    </body>
</html>
