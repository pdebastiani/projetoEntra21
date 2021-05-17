<%-- 
    Document   : editarCategoria
    Created on : 8 de nov de 2020, 21:09:00
    Author     : Paulo
--%>

<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
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
        <div class="cadcat1"><h2 style="text-align: center">Editar a sua Categoria</h2>
             <br>
                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    int idUser = Integer.parseInt(request.getParameter("idUser"));
                    Categoria categoria = new Categoria();
                    if (id != 0 && idUser != 0) {
                        categoria = categoria.consultar(id, idUser);
                    }
                %>
            <form action="recebeEditaCategoria.jsp" method="POST">                  
                <input type="hidden" name="id" readonly="true"
                value="<%out.write(""+categoria.getId());%>"/>
                <input type="hidden" name="idUser" readonly="true"
                value="<%out.write(""+categoria.getIdUsuario());%>"/>
                <br />                  
                <label>Categoria</label>
                <select id="tipo" name="tipo">
                <% if (categoria.getTipo().contains("D")) { %>
                <option value="D" selected>DESPESA</option>
                <option value="R">RECEITA</option>
                <%}%>
                <% if (categoria.getTipo().contains("R")) { %>
                <option value="D">DESPESA</option>
                <option value="R" selected>RECEITA</option>
                <%}%>
                </select> 
                <br>
                <label>Descrição</label>
                <input type="text" name="descricao" 
                value="<%out.write(categoria.getDescricao());%>"/> 
                <br>
                <br>
                <input class="cancelar" type="submit" value="Alterar" />
                </form>
        </div>
        <div class="final">
        <p> <strong>C</strong> - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech</p>
    </div>                           
    </body>
</html>
