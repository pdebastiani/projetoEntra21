<%-- 
    Document   : recebeEditaCategoria
    Created on : 8 de nov de 2020, 21:51:26
    Author     : Paulo
--%>

<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Categoria categoria = new Categoria();
    categoria.setId(Integer.parseInt(request.getParameter("id")));
    categoria.setIdUsuario(Integer.parseInt(request.getParameter("idUser")));
    categoria.setDescricao(request.getParameter("descricao"));
    categoria.setTipo(request.getParameter("tipo"));

    String msg = "";
    if (categoria.alterar()) {
        //direciona para a página de informações
        msg = "Categoria alterada com Sucesso!";
    } else {
        msg = "Problemas ao alterar Categoria!";
    }
    response.sendRedirect("informacao.jsp?msg=" + msg);
%>
