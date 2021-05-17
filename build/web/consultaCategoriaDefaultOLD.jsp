<%-- 
    Document   : consultaCategoriaDefault
    Created on : 16 de nov de 2020, 10:13:42
    Author     : entra21
--%>

<%@page import="Modelos.CategoriaDefault"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <title>Minha Agenda Financeira</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/estilos.css">  
    </head>
    <body style="background-color:rgba(255,160,122)">
        <header>
            <div class="logo"><img src="imagens/logo.png"></div>
        </header>
        <div class="login">
        <img src="imagens/avatar.jpg" style="width:66px">
        <p> Olá,
            <%
            //verifica sessão
            String nomeUser = "";
            String usuarioEsperado = "entra21";     // usuario autorizado para manutenção
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            }
            else if (!usuario.contains(usuarioEsperado)) {
                response.sendRedirect("index.html");
            } else {
                nomeUser = (String) session.getAttribute("nome");
                out.write(nomeUser);
            }
            %> !!
        </p>
        <div class="topnav a">
            <a href="#"><img src="imagens/envelope.png"></i> </a>
            <a href="login.jsp"><img src="imagens/usuario.png"></i></a>
            <a href="cadastroCategoriaDefault.jsp"><img src="imagens/configura.png"></i></a>
        </div>
        </div>
        <div class="painel"> Painel de Controle </div><br>
        <div class="menu">
        <div class="clearfix">
        <div class="column">
        <ul>
            <li><a class="link" href="menu.jsp" ><img src="imagens/menu.png" hspace="4">  MENU </a></li>
            <li><a class="link" href="cadastroDespesa.jsp"><img src="imagens/gasto.png" hspace="3">  Seu novo Gasto</a> </li>
            <li><a class="link" href="cadastroReceita.jsp"><img src="imagens/renda.png" hspace="3">  Sua nova Renda</a></li>
            <li><a class="link" href="cadastroCategoria.jsp"><img src="imagens/categoria.png" hspace="3">   Crie nova Categoria</a></li>
            <li><a class="link" href="consultaBalancete.jsp"><img src="imagens/resumo.png" hspace="3">  Resumo Financeiro</a></li>
            <li><a class="link" href="consultaUsuario.jsp"><img src="imagens/usuario.png" hspace="3">  Meus Dados</a></li>
            <li><a class="link" href="consultaCategoriaDefault.jsp"><img src="imagens/configura.png" hspace="3">  Configurações</a></li>
        </ul>
        </div>
        </div>
        </div>
                
        <div class="container1"><p>Consulta Categorias (Padrões na inicialização do Usuario)</p></div>

        <%
            CategoriaDefault categoriaDefault = new CategoriaDefault();
            ResultSet rs = categoriaDefault.consultarTodas();
        %>
           
        <table class="container6">
            <thead>
                <!--<th>id</th>-->
                <th>Descrição</th>
                <th>Tipo Categoria</th>
                <th>Editar</th>
                <th>Excluir</th>
            </thead>
            <tbody>
                <%while (rs.next()) {%>
                    <tr>
                        <!--<td><%out.write(""+rs.getInt("id"));%></td>-->
                        <td><%out.write(rs.getString("descricao"));%></td>
                        <%if (rs.getString("tipo").contains("R")) {%>
                            <td><%out.write(rs.getString("tipo") + "ECEITA");%></td>
                        <%}%>
                        <%if (rs.getString("tipo").contains("D")) {%>
                            <td><%out.write(rs.getString("tipo") + "ESPESA");%></td>
                        <%}%>
                        <td><% out.write("<a href=editarCategoriaDefault.jsp?id=" + 
                                rs.getInt("id") + ">Editar</a>"); %></td>
                        <td><% out.write("<a href=excluirCategoriaDefault.jsp?id=" + 
                                rs.getInt("id") + ">Excluir</a>"); %></td>
                    </tr>
                <%}%>
            </tbody>
        </table>

        <!--<p class="novo"><a href="cadastroCategoriaDefault.jsp">Clique <strong>aqui</strong> 
            para Incluir uma nova Categoria</a></p>-->
        
        <div class="final">
            <p> <strong>C</strong> - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech</p>
        </div>  
    </body>
</html>
