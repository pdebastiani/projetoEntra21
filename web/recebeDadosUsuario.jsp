<%-- 
    Document   : recebeDadosUsuario
    Created on : 18/12/2020, 08:17:57
    Author     : entra21
--%>

<%@page import="Modelos.Usuario"%>
<%@page import="Modelos.Categoria"%>
<%@page import="Modelos.CategoriaDefault"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String msg = "";
    Usuario usuario = new Usuario();
    if (usuario.userExiste(request.getParameter("usuario"))) {
        //voltar para cadastro
        msg = "Usuario ja existe";
        response.sendRedirect("informacao.jsp?msg="+msg);
    } else {
        usuario.setNome(request.getParameter("nome"));
        usuario.setCpf(request.getParameter("cpf"));
        usuario.setDataNasc(Date.valueOf(request.getParameter("dataNascimento")));
        usuario.setFone(request.getParameter("fone"));
        usuario.setCep(request.getParameter("cep"));
        usuario.setEndereco(request.getParameter("endereco"));
        usuario.setBairro(request.getParameter("bairro"));
        usuario.setCidade(request.getParameter("cidade"));
        usuario.setUf(request.getParameter("uf"));
        usuario.setEmail(request.getParameter("usuario"));
        usuario.setSenha(request.getParameter("senha"));
        String email = request.getParameter("usuario");
        if (usuario.salvar()) {
            //cadastrar as Categorias Padrões para este usuario
            usuario = usuario.consultar(email);
            //int idUser = usuario.getIdUser();
            CategoriaDefault categoriaDefault = new CategoriaDefault();
            
            List<CategoriaDefault> categoriasDefault = new ArrayList<>();
            categoriasDefault = categoriaDefault.consultar();
            // gravando Categorias Default para Categorias do Usuario
            for (CategoriaDefault x : categoriasDefault) {
                Categoria categoria = new Categoria();
                categoria.setIdUsuario(usuario.getIdUser());
                categoria.setDescricao(x.getDescricao());
                categoria.setTipo(x.getTipo());
                categoria.salvar();
            }
            msg = "Usuario salvo com Sucesso!";
        } else {
        msg = "Erro ao salvar Usuario!";
        }
        //direciona para a página de informações
        response.sendRedirect("informacao.jsp?msg="+msg);
    }
%>