<%-- 
    Document   : recebeDadosCategoria
    Created on : 16/12/2020, 09:36:25
    Author     : entra21
--%>

<%@page import="Modelos.Usuario"%>
<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%
    //verifica sessão
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%
    // para identificar o Id do Usuario
    Usuario user = new Usuario();
    user = user.consultar(usuario);

    //instancia uma nova Categoria
    Categoria categoria = new Categoria();
    categoria.setIdUsuario(user.getIdUser());
    categoria.setDescricao(request.getParameter("descricao"));
    categoria.setTipo(request.getParameter("tipo"));

    String msg = "";
    if (categoria.salvar()) {
        msg = "Categoria salva com sucesso!";
    } else {
        msg = "Problemas ao salvar Categoria!";
    }
   // response.sendRedirect("informacao.jsp?msg=" + msg);
    response.sendRedirect("cadastroCategoria.jsp?msg=" + msg);
%>
