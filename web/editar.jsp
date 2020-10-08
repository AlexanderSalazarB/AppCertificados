<%-- 
    Document   : editar
    Created on : 27/09/2020, 06:15:06 PM
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
        <h2 alig="center">Editar Usuario!</h2>
        <%
            String cod=request.getParameter("cod");
            Connection   cnx=null;    
            Statement sta=null;
            ResultSet rs=null;
            
            try{    
                Class.forName("com.mysql.jdbc.Driver");
                cnx =DriverManager.getConnection
                ("jdbc:mysql://localhost/bd_certificados?user=root&password=");
                                           
                sta=cnx.createStatement();
                rs=sta.executeQuery("Select * from usuario where cod_usuario='"+cod+"'");
                
                while(rs.next()){



            %>
        
        <form action="">
            <table border="1" width ="250" align="center">  
                <tr>
                    <td> Codigo:</td>
                    <td><input type="text" name="txtCod" value="<%=rs.getString(1)%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" value="<%=rs.getString(2)%>" name="txtNom" ></td>
                </tr>
                <tr>
                    <td> Cargo :</td>
                    <td><input type="text" name="txtCargo" value="<%=rs.getString(3)%>"></td>
                </tr>
                <tr>
                    <td> Nivel :</td>
                    <td><input type="text" name="txtNivel" value="<%=rs.getString(4)%>"></td>
                </tr>
                <tr>
                    <td> Password :</td>
                    <td><input type="text" name="txtPass" value="<%=rs.getString(5)%>"></td>
                </tr>
                <tr>    
                    <th colspan="2">
                        <input type="submit" name="btnGrabar"
                               value="Editar Usuario"></th>
                </tr>
                    
            </table>
        </form>
                <%
                    }
}catch(Exception e){}

if(request.getParameter("btnGrabar")!=null){ 
            String codu=request.getParameter("txtCod");
            String nomu=request.getParameter("txtNom");
            String cargo=request.getParameter("txtCargo");
            String nivel=request.getParameter("txtNivel");
            String pass=request.getParameter("txtPass");

            sta.executeUpdate("update usuario set descripcion_usuario='"+nomu+"',cargo='"+cargo+"',nive_acceso='"+nivel+"',Password='"+
            pass+"' where cod_usuario='"+codu+"'");
            
            request.getRequestDispatcher("index.jsp").forward(request,response);
}
    


                    %>
                    
    </body>
</html>
