<%-- 
    Document   : recebeDadosCategoriaDefault
    Created on : 29 de out de 2020, 10:13:01
    Author     : entra21
--%>

<%@page import="Modelos.Usuario"%>
<%@page import="Modelos.CategoriaDefault"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%
    CategoriaDefault categoriaDefault = new CategoriaDefault();
    /*if (categoria.userExiste(request.getParameter("email"))) {
        //voltar para cadastro
        String msg = "Usuario já existe";
        response.sendRedirect("informacao.jsp?msg="+msg);
    } else {*/
    categoriaDefault.setDescricao(request.getParameter("descricao"));
    categoriaDefault.setTipo(request.getParameter("tipo"));
    if (categoriaDefault.salvar()) {
        //direciona para a página de informações
        String msg = "Categoria Default salva com Sucesso!";
        response.sendRedirect("informacao.jsp?msg=" + msg);
    }
    // }
%>



