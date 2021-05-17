<%-- 
    Document   : categoriaDefault
    Created on : 29 de out de 2020, 10:44:15
    Author     : entra21
--%>

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
        <h3> Olá,
            <%
            //verifica sessão
            String nomeUser = "";
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("loginDefault.jsp");
            } else if (usuario == "entra21") {
                nomeUser = (String) session.getAttribute("nome");
                out.write(nomeUser);
                response.sendRedirect("consultaCategoriaDefault.jsp");
            }
            %> !!
        <h3>
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

        <div class="cadcat"><h2>Cadastro de Categorias (Padrão/inicial)</h2>
                
                <form action="recebeDadosCategoriaDefault.jsp" method="POST">
                    <label>Descrição</label>
                    <input type ="text" name="descricao" /> 
                        <br>
                        <br>
                        <label>Informe o tipo</label>
                        <select  style="width: 15%" name="tipo">
                            <option value="R">Receita</option>
                            <option value="D">Despesa</option>
                        </select>
                        <br>
                        <br>      
                        
                    <input class="salvar" type="button" value="Salvar" onclick="enviaForm()" />
                    <input class="cancelar" type="reset" value="Limpar" />
                </form>
                </div>

                <p class="error" id="erros" style= "margin-left: 70px; margin-bottom: 50px;
                                            color: red; font-size: 14px;"></p>

                <script>
                    function enviaForm(){
                        var descricao = document.getElementsByName("descricao");
                        if(descricao[0].value === ""){
                            descricao[0].focus();
                            erros.innerHTML = "Informe a Categoria";
                            exit();
                        }
                        
                        document.forms[0].submit();
                    }
                </script>
            </article>
        </section>
        <div class="final">
        <p> <strong>C</strong> - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech</p>
        </div>
    </body>
</html>
