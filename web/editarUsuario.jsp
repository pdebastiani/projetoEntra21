<%-- 
    Document   : editarUsuario
    Created on : 13/12/2020, 20:02:04
    Author     : User
--%>

<%@page import="Modelos.Usuario"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <title>Minha Agenda Financeira</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/estilos.css">  
    </head>
    <body style="background-color:rgba(240,248,255)">
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
            String usuario = (String) session.getAttribute("usuario");
            int idUser = (int) session.getAttribute("idUser");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        
        <div class="cadcat3"><h2 style="text-align: center">Faça Alteração de seus Dados</h2>
                <%
                    Usuario user = new Usuario();
                    user = user.consultar(idUser);
                %>
                <p id="erros"></p>

                <form action="recebeEditaUsuario.jsp" method="POST">
                    <div>
                    <label>Nome</label>
                    <label id="erroNome" class="error"></label> 
                    <input type="text" name="nome" value="<%out.write(user.getNome());%>"/>
                    <br>
                    <label>Cpf</label>
                    <label id="erroCpf" class="error"></label> 
                    <input type="text" name="cpf" value="<%out.write(user.getCpf());%>"/>
                    <br>
                    <label>Data Nascimento</label>
                    <input type="date" name="dataNascimento" value="<%out.write(String.valueOf(user.getDataNasc()));%>"/> 
                    <br> 
                    <label>Fone</label>
                    <label id="erroFone" class="error"></label>
                    <input type="text" name="fone" value="<%out.write(user.getFone());%>"/>
                    <br>
                    <label>Cep</label>
                    <input type="text" name="cep" value="<%out.write(user.getCep());%>"/> 
                    <br>
                    <label>Endereço</label>
                    <input type="text" name="endereco" value="<%out.write(user.getEndereco());%>"/> 
                    <br>
                    <label>Bairro</label>
                    <input type="text" name="bairro" value="<%out.write(user.getBairro());%>"/>
                    <br>
                    <label>Cidade</label>
                    <input type="text" name="cidade" value="<%out.write(user.getCidade());%>"/>
                    <br>
                    <label>Estado</label>
                    <input type="text" name="uf" value="<%out.write(user.getUf());%>"/> 
                    <br>
                    <label>e-Mail/Usuario</label>
                    <input type="text" name="usuario" value="<%out.write(user.getEmail());%>"/>
                    <br>
                    <label>Senha</label>
                    <input type="password" name="senha" value="<%out.write(user.getSenha());%>"/> 
                    <br>
                   
                    <input class="alterar" type="button" value="Alterar" onclick="enviarDados()" />
                    </div>
                </form>

                <script>
                    function enviarDados(){
                        var semErros = true;
                        var nome = document.getElementsByName("nome");
                        if (nome[0].value === ""){
                            //erros.innerHTML += "<br>Informe nome";
                            //nome[0].style="border: red solid 3px";
                            //nome[0].focus();
                            document.getElementById("erroNome").innerHTML = " <<< Informe Nome >>>";
                            semErros = false;
                        }
                        var cpf = document.getElementsByName("cpf");
                        if (cpf[0].value === ""){
                            //erros.innerHTML += "<br>Informe cpf";
                            document.getElementById("erroCpf").innerHTML = " <<< Informe Cpf >>>";
                            //cpf[0].focus();
                            semErros = false;
                        }
                        var fone = document.getElementsByName("fone");
                        if (fone[0].value === ""){
                            document.getElementById("erroFone").innerHTML = " <<< Informe Telefone/Celular >>>";
                            semErros = false;
                        }

                        if(semErros){
                            document.forms[0].submit();
                        }
                    }
                </script>
        </div>
    <div class="final">
        <p> <strong>C</strong> - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech</p>
    </div> 
    </body>
</html>
