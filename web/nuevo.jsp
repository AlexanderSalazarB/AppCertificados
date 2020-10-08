<%-- 
    Document   : nuevo
    Created on : 27 set. 2020, 09:21:02
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
        <h2 alig="center">Registro de Usuarios!</h2>
        <form action="">
            <table border="1" width ="250" align="center">  
                <tr>
                    <td> Codigo:</td>
                    <td><input type="text" name="txtCod"></td>
                </tr>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="txtNom"></td>
                </tr>
                <tr>
                    <td> Cargo :</td>
                    <td><input type="text" name="txtCargo"></td>
                </tr>
                <tr>
                    <td> Nivel :</td>
                    <td><input type="text" name="txtNivel"></td>
                </tr>
                <tr>
                    <td> Password :</td>
                    <td><input type="text" name="txtPass"></td>
                </tr>
                <tr>    
                    <th colspan="2">
                        <input type="submit" name="btnGrabar"
                               value="Grabar Usuario"></th>
                </tr>
                    
            </table>
        </form>
        <%
            if(request.getParameter("btnGrabar")!=null){ 
            String cod=request.getParameter("txtCod");
            String nom=request.getParameter("txtNom");
            String cargo=request.getParameter("txtCargo");
            String nivel=request.getParameter("txtNivel");
            String pass=request.getParameter("txtPass");
            
            java.sql.Connection cnx=null;
            ResultSet rs=null;
            Statement sta=null;
            try{
            Class.forName("com.mysql.jdbc.Driver");
            cnx=DriverManager.getConnection("jdbc:mysql://localhost/bd_certificados?user=root&password=");
            
            sta=cnx.createStatement();
            sta.executeUpdate("insert into usuario values('"+cod+"','"+nom+"','"+cargo+"','"+nivel+"','"+pass+"')");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            }catch(Exception e){out.print(e+"");}
            
            }
            %>
        
        
        
    </body>
</html>
