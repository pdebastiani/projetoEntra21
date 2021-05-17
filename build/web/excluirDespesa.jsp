<%-- 
    Document   : excluirDespesa
    Created on : 13/12/2020, 20:01:48
    Author     : User
--%>

<%@page import="java.sql.Date"%>
<%@page import="Modelos.Despesa"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int idUser = Integer.parseInt(request.getParameter("idUser"));
    if (id != 0 && idUser != 0) {
        Despesa despesa = new Despesa();
        despesa = despesa.consultar(id, idUser);
        if (despesa != null) {
            String msg = "";
            if (despesa.excluir()) {
                msg = "Despesa excluida com sucesso!";
            } else {
                msg = "Problemas ao excluir Despesa!";
            }
            response.sendRedirect("informacao.jsp?msg=" + msg);
        }
    }
%>