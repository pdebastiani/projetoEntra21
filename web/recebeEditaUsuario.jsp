<%-- 
    Document   : recebeDadosUsuario
    Created on : 18/12/2020, 08:17:57
    Author     : entra21
--%>

<%@page import="Modelos.Usuario"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%
        //verifica sessão
        String usuario = (String) session.getAttribute("usuario");
        int idUser = (int) session.getAttribute("idUser");
        if (usuario == null) {
            response.sendRedirect("login.jsp");
        }

        Usuario user = new Usuario();
        if (user.userExiste(request.getParameter("usuario"))) {
            user.setIdUser(idUser);
            user.setNome(request.getParameter("nome"));
            user.setCpf(request.getParameter("cpf"));
            user.setDataNasc(Date.valueOf(request.getParameter("dataNascimento")));
            user.setFone(request.getParameter("fone"));
            user.setCep(request.getParameter("cep"));
            user.setEndereco(request.getParameter("endereco"));
            user.setBairro(request.getParameter("bairro"));
            user.setCidade(request.getParameter("cidade"));
            user.setUf(request.getParameter("uf"));
            user.setEmail(request.getParameter("usuario"));
            user.setSenha(request.getParameter("senha"));
            if (user.alterar(idUser)) {
                String msg = "Usuario alterado";
                response.sendRedirect("informacao.jsp?msg=" + msg);
            }
        } else {
            String msg = "Usuario não encontrato para alterar!";
            response.sendRedirect("informacao.jsp?msg=" + msg);
        }
%>