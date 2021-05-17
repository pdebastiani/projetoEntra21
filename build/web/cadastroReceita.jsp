<%-- 
    Document   : cadastroReceita
    Created on : 13/12/2020, 20:01:48
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<html>
     <head>
        <title>Minha Agenda Financeira</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/estilos.css">   
    </head>
    <body style="background-color:rgba(173,216,230)">
        <header>
            <div class="logo"><img src="imagens/logo.png"></div>
        </header>
        <div class="login">
        <img src="imagens/avatar.jpg" style="width:66px">
        <p> Olá,
            <%
            //verifica sessão
            int idUser = 0;
            String nomeUser = "";
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
                idUser = (int) session.getAttribute("idUser");
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
        
        <div class="cadcat"><h2 style="text-align: center">Cadastro da Nova Renda</h2>
        <%
            Categoria categoria = new Categoria();
            List<Categoria> categorias = categoria.consultar(idUser, "R");  //consulta as categorias tipo=RECEITA
        %>
        <div>
            <form action="recebeDadosReceita.jsp" method="POST">
                <label>Informe a categoria</label>
                <select style="width: 30%; padding: 8px" name="idCategoria"><% for (Categoria c : categorias) { %>
                    <option value="<%out.write("" + c.getId());%>"><%out.write(c.getDescricao());%></option>
                    <%}%>
                </select> 
                <br />
               
                <label>Informe a descrição</label>
                <input type="text" name="descricao" /> 

                <br />
                <label>Informe o valor</label>
                <input style="width: 30%; padding: 4px" type="text" name="valor" />

                <br />
                <label>Informe a data</label>
                <input style="width: 30%; padding: 4px" type="date" name="data" />

                <br />
                <input class="salvar" type="button" value="Salvar" onclick="enviaForm()" />
                <input class="cancelar" type="reset" value="Cancelar" />
        </div>
    </form>
    <script>
        function enviaForm() {
            /*var descricao = document.getElementsByName("descricao");
            if (descricao[0].value === "") {
                descricao[0].focus();
                alert("informe a descricao");
                exit();
            }*/
            var valor = document.getElementsByName("valor");
            if (valor[0].value === "") {
                valor[0].focus();
                alert("informe o valor");
                exit();
            }
            var data = document.getElementsByName("data");
            if (data[0].value === "") {
                data[0].focus();
                alert("informe a data");
                exit();
            }

            document.forms[0].submit();
        }
        </script>
        </div>
    <div class="final">
        <p> <strong>C</strong> - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech</p>
    </div>
</body>
</html>
