<%-- 
    Document   : recebeCategoriaDefault
    Created on : 8 de nov de 2020, 21:51:26
    Author     : Paulo
--%>

<%@page import="Modelos.CategoriaDefault"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>

<%
    CategoriaDefault categoriaDefault = new CategoriaDefault();
    categoriaDefault.setId(Integer.parseInt(request.getParameter("id")));
    categoriaDefault.setDescricao(request.getParameter("descricao"));
    categoriaDefault.setTipo(request.getParameter("tipo"));

    String msg = "";
    if (categoriaDefault.alterar()) {
        //direciona para a página de informações
        msg = "Categoria Default alterada com Sucesso!";
    } else {
        msg = "Problemas ao alterar Categoria Default!";
    }
    response.sendRedirect("informacao.jsp?msg=" + msg);
%>
