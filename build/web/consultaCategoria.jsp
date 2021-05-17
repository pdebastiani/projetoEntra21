<%-- 
    Document   : consultaCategoria
    Created on : 05/01/2021, 15:10:41
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Minha Agenda Financeira</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/estilos.css">   
    </head>
    <body style="background-color:rgba(127,255,212)">   
        <header>
            <div class="logo"><img src="imagens/logo.png"></div>
        </header>
        <div class="login">
        <img src="imagens/avatar.jpg" style="width:66px">
        <p> Olá,
            <% 
              String nomeUser = (String) session.getAttribute("nome");
              out.write(nomeUser);
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
           <li style="background-color: rgba(211,211,211)"><a class="link" href="cadastroDespesa.jsp"><img src="imagens/gasto.png" hspace="3">  Seu novo Gasto</a> </li>
           <li style="background-color: rgba(173,216,230)"><a class="link" href="cadastroReceita.jsp"><img src="imagens/renda.png" hspace="3">  Sua nova Renda</a></li>
           <li style="background-color: rgba(127,255,212)"><a class="link" href="cadastroCategoria.jsp"><img src="imagens/categoria.png" hspace="3">   Crie nova Categoria</a></li>
           <li style="background-color: rgba(245,222,179)"><a class="link" href="consultaBalancete.jsp"><img src="imagens/resumo.png" hspace="3">  Resumo Financeiro</a></li>
           <li style="background-color: rgba(240,248,255)"><a class="link" href="consultaUsuario.jsp"><img src="imagens/usuario.png" hspace="3">  Meus Dados</a></li>
           <li style="background-color: rgba(255,160,122)"><a class="link" href="consultaCategoriaDefault.jsp"><img src="imagens/configura.png" hspace="3">  Configurações</a></li>
        </ul>
        </div>
        </div>
        </div>
        
        <%
            //verifica sessão
            int idUser = 0;
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
                idUser = (int) session.getAttribute("idUser");
            }
        %>
        
        <div class="container1"><p>Suas Categorias cadastradas</p></div>
                
                <%
                    Categoria categoria = new Categoria();
                    List<Categoria> categorias = categoria.consultar(idUser);
                %>
                <table class="container6">
                    <thead>
                    <th>Descricao</th>
                    <th>Tipo</th>
                    <th>Editar</th>
                    <th>Excluir</th>
                    </thead> 

                    <tbody>
                        <% for (Categoria c : categorias) {%>
                        <tr>
                            <td><% out.write(c.getDescricao());%></td>
                            <%if (c.getTipo().equals("R")) {%>
                            <td><%out.write(c.getTipo() + "ECEITA");%></td>
                            <%}%>
                            <%if (c.getTipo().equals("D")) {%>
                            <td><%out.write(c.getTipo() + "ESPESA");%></td>
                            <%}%>
                                <td><%out.write("<a href=editarCategoria.jsp?id=" + c.getId() + "&idUser="
                            + c.getIdUsuario() + ">Editar</a>");%></td>   
                                <td><%out.write("<a href=excluirCategoria.jsp?id=" + c.getId() + "&idUser="
                            + c.getIdUsuario() + ">Excluir</a>");%></td>   
                        </tr>
                        <%}%>
                    
                    </tbody>
                </table>
        </div>
        <div class="final">
        <p> <strong>C</strong> - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech</p>
    </div>  
    </body>
</html>
