<%-- 
    Document   : index
    Created on : 26 set. 2020, 14:47:57
    Author     : Alexander
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <h1 align="center">Listado de Usuarios!</h1>
        <table border="1" width="600" align="center">
            <tr bgcolor="Skyblue">
                <th colspan="5">Mantenimiento Usuario</th>
                <th><a href="nuevo.jsp">
                    <img src="Iconos/nuevo.png"witdht="30"height="30"></a></th>
            </tr>
            <tr bgcolor="Skyblue">
                <th>Codigo Usuario</th><<th>Descripcion</th>
                <th>Cargo</th><th>Nivel</th>
                <th>Password</th><th>Accion</th> 
            </tr>
            <%
            Connection   cnx=null;    
            Statement sta=null;
            ResultSet rs=null;
            
            try{    
                Class.forName("com.mysql.jdbc.Driver");
                cnx =DriverManager.getConnection
                ("jdbc:mysql://localhost/bd_certificados?user=root&password=");
                                           
                sta=cnx.createStatement();
                rs=sta.executeQuery("Select * from usuario");
                
                while(rs.next()){
                    %>
                    <tr>
                        <th><%=rs.getString(1)%></th>
                        <th><%=rs.getString(2)%></th>
                        <th><%=rs.getString(3)%></th>
                        <th><%=rs.getString(4)%></th>
                        <th><%=rs.getString(5)%></th>
                        <<th>
                            
                            <a href="editar.jsp?cod=<%=rs.getString(1)%>">
                            <img src="Iconos/editar.png"witdht="30"height="30"> 
                            </a>
                            <a href="eliminar.jsp?cod=<%=rs.getString(1)%>">
                            <img src="Iconos/eliminar.png"witdht="30"height="30">
                            </a>
                        </th>
                    </tr>    
                    <%
                      }
            sta.close();
            rs.close();
            cnx.close();
                }catch (Exception e){}

            %>
        </table>
    </body>
</html>
