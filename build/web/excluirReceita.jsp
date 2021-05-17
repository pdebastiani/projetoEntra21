<%-- 
    Document   : excluirReceita
    Created on : 13/12/2020, 20:01:48
    Author     : User
--%>

<%@page import="java.sql.Date"%>
<%@page import="Modelos.Receita"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int idUser = Integer.parseInt(request.getParameter("idUser"));
    if (id != 0 && idUser != 0) {
        Receita receita = new Receita();
        receita = receita.consultar(id, idUser);
        if (receita != null) {
            String msg = "";
            if (receita.excluir()) {
                msg = "Receita excluida com sucesso!";
            } else {
                msg = "Problemas ao excluir Receita!";
            }
            response.sendRedirect("informacao.jsp?msg=" + msg);
        }
    }
%>