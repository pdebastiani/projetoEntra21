<%-- 
    Document   : excluirCategoria
    Created on : 9 de nov de 2020, 17:52:36
    Author     : Paulo
--%>
<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            int idUser = Integer.parseInt(request.getParameter("idUser"));
            if (id != 0 && idUser != 0) {
                Categoria categoria = new Categoria();
                categoria = categoria.consultar(id, idUser);
                if (categoria != null) {
                    String msg = "";
                    if (categoria.excluir()) {
                        msg = "Categoria excluida com sucesso!";
                    } else {
                        msg = "Problemas ao excluir! Há despesas nesta Categoria!";
                    }
                    response.sendRedirect("informacao.jsp?msg=" + msg);
                }
            }
        %>
    </body>
</html>
