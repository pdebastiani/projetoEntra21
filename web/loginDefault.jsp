<%-- 
    Document   : login
    Created on : 09/12/2020, 15:46:18
    Author     : User
--%>

<%@page import="Modelos.Usuario"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color:rgba(0, 0, 242, 0.1)">
     <head>
        <title>Minha Agenda Financeira</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/estilos.css">
        
    </head>
    <body>
        
        
        <header>
            <div class="logo"><img src="imagens/logo.png"></div>
        </header>
    
        <div class="login">
        <img src="imagens/avatar.jpg" style="width:66px">
        <h3> Olá... !!</h3>
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

            <div class="cadcat1"><h1>Tela de Login Default</h1>
            <br>
            <form action="loginDefault.jsp" method="POST">
                <label>Usuario</label>
                <input style="width:50%" type="text" name="usuario" />
                <br>
                <br>
                <label>Senha</label>
                <input style="width:30%" type="password" name="senha" />
                <br>
                <br>
                <input class="salvar" type="submit" value="Logar" />  
                <a href="index.html"><input class="cancelar" type="button" value="Cancelar" /><a/>
            </form>        
        </div>   
        <%
            String usuarioEsperado = "entra21";     // usuario autorizado para manutenção
            String usuario = request.getParameter("usuario");
            String senha = request.getParameter("senha");
  
            if ((usuario != null) && (senha != null) && !(usuario.isEmpty())
                    && !(senha.isEmpty())) {
                if (Usuario.podeLogar(usuario, senha)) {
                    if (usuario.contains(usuarioEsperado)) {
                        response.sendRedirect("consultaCategoriaDefault.jsp");
                    } else {
                        String msg = "Usuario não Autorizado na Manutenção!";
                        response.sendRedirect("informacao.jsp?msg=" + msg);
                    }
                }
            }
        %>
        
        <footer>
            <i class="final"><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
        </footer>
        
    </body>
</html>
