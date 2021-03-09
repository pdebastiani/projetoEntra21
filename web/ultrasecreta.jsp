<%-- 
    Document   : ultrasecreta
    Created on : 18/12/2020, 08:47:52
    Author     : entra21
--%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <style>
        p{
            font-size: 48px;
            color: red;
            background-color: yellow;
        }
    </style>
</head>
<body>
    <%
        String usuario = (String) session.getAttribute("usuario");
        int idUser = (int) session.getAttribute("idUser");
    
        if (usuario == null) {
            response.sendRedirect("login.jsp");
        }
        out.print("<p>" + usuario +  + idUser + "</p>");
    %>

</body>
</html>
