<%-- 
    Document   : excluirCliente
    Created on : 9 de nov de 2020, 17:52:36
    Author     : Paulo
--%>

<%@page import="Modelos.CategoriaDefault"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    CategoriaDefault categoriaDefault = new CategoriaDefault();
    categoriaDefault = categoriaDefault.consultar(id);
    if (id != 0) {
        String msg = "";
        if (categoriaDefault.excluir()) {
            msg = "Categoria Default excluida com sucesso!";
        } else {
            msg = "Problemas ao excluir Categoria Default!";
        }
        response.sendRedirect("informacao.jsp?msg=" + msg);
    }
%>
