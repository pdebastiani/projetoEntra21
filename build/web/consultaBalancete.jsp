<%-- 
    Document   : consultalocacao
    Created on : 13 de nov de 2020, 08:17:15
    Author     : entra21
--%>

<%@page import="utils.ConversorData"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Modelos.Despesa"%>
<%@page import="Modelos.Receita"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Minha Agenda Financeira</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/estilos.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    </head>
    <body style="background-color:rgba(245,222,179)">   
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
           
        <div class="container3"><h2 style="text-align: center">Balancete Detalhado</h2><br>
                <form action="consultaBalancete.jsp" method="POST">
                <label>Digite a Data Inicial</label>
                <input style="width: 200px" type="date" name="dataInicio" />
                <br>
               
                <label>Digite a Data Final</label>
                <input style="width: 200px" type="date" name="dataFim" />
                <br>
                <br>
                <input class="consultar" type="button" value="Consultar" onclick="enviaForm()" />
                <br/>
                <br>
                <div>
                    <%
                        String inicio = request.getParameter("dataInicio");
                        String fim = request.getParameter("dataFim");
                        float valorReceita = 0;
                        float valorDespesa = 0;
                        if (inicio != null & fim != null) {
                            Date dataInicio = Date.valueOf(inicio);
                            Date dataFim = Date.valueOf(fim);
                           
                            Receita receita = new Receita();
                            valorReceita = receita.getTotalReceita(idUser, dataInicio, dataFim);
                            Despesa despesa = new Despesa();
                            valorDespesa = despesa.getTotalDespesa(idUser, dataInicio, dataFim);
                        }
                    %>
                    <p class="ret12">Total das Rendas: <span> <%out.write(ConversorData.formataMoeda(valorReceita));%> </span></p>
                    <p class="ret13">Total de Gastos: <span><%out.write(ConversorData.formataMoeda(valorDespesa));%></span> </p>
                    <p class="ret14"> Saldo: <span id="saldo"> <%out.write(ConversorData.formataMoeda(valorReceita - valorDespesa));%></span></p>                
                    <input type="hidden" name="cat" value="Despesa %"/>
                    <input type="hidden" name="vlr" value="<% out.write(String.valueOf(Math.round(valorDespesa * 100 / valorReceita))); %>"/>
                    <input type="hidden" name="cat" value="Receita 100%"/>
                    <input type="hidden" name="vlr" value="<% out.write(String.valueOf(Math.round(100 - (valorDespesa * 100 / valorReceita)))); %>"/>
                </div>    
            </div>
        </form> 
        <div class="col-4 chart" style="position: absolute; left: 890px; top: 100px; font-style: bold">
            <canvas id="myChart3" width="400" height="400"></canvas>
            <script src="scripts/grafico3.js"></script>
        </div>
        <script>
            function enviaForm() {
                var inicio = document.getElementsByName("dataInicio")[0].value;
                var fim = document.getElementsByName("dataFim")[0].value;
                if (inicio === "" || fim === "") {
                    alert("è preciso informar datas");
                } else
                    document.forms[0].submit();
            }
            
            var saldo = document.getElementById("saldo");
            var valor = parseFloat(saldo.innerHTML);
            if (valor < 0){
                saldo.style="color:red";
            }else{
                saldo.style="color:blue";
            }
            
        </script>
        <div class="final">
        <p> <strong>C</strong> - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech</p>
    </div>
    </body>
</html>