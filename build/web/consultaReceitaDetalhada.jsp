<%-- 
    Document   : consultaReceitaDetalhada
    Created on : 08/02/2021, 10:54:37
    Author     : entra21
--%>

<%@page import="utils.ConversorData"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Receita"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <body style="background-color:rgba(173,216,230)">          
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
        
        <div class="container4"><h2 style="text-align: center">Consulta Renda Detalhada</h2>
        <form action="consultaReceitaDetalhada.jsp" method="POST">
            
                <label>Digite a Data Inicial</label>
                <input style="width: 35%" type="date" name="dataInicio" />
                <br>
                <label>Digite a Data Final</label>
                <input style="width: 35%" type="date" name="dataFim" />
                <br>
                <%
                    Categoria cat = new Categoria();
                    List<Categoria> categorias = cat.consultar(idUser, "R");
                %>

                <input type="checkbox" name="filtrarByCategoria"> Filtrar por categoria?</input>
                <select style="width: 35%" name="categoria">
                    <%for (Categoria ct : categorias) { %>
                    <option value=<%out.write("" + ct.getId());%>><%out.write(ct.getDescricao());%></option>
                    <%}%>
                </select>
                <br>              
                <!--<label>Agrupar?</label>-->
                <input type="hidden" name="agrupar" checked="true" />               
                <input class="consultar" type="button" value="Consultar"  onclick="enviaForm()"/>
        </form>
        </div>

            <%
                Receita receita = new Receita();
                List<Receita> receitas = new ArrayList<>();
                
                String filtrarByCategoria = request.getParameter("filtrarByCategoria");
                String categoria = request.getParameter("categoria");
               
                String inicio = request.getParameter("dataInicio");
                String fim = request.getParameter("dataFim");
                String agrupar = request.getParameter("agrupar");
                
                if (inicio != null && fim != null) {
                    Date dataInicio = Date.valueOf(inicio);
                    Date dataFim = Date.valueOf(fim);
                    boolean agrupa = false;
                    if (agrupar != null) {
                        agrupa = true;
                    }
                    
                    //busca por categoria
                    if (filtrarByCategoria != null){
                       int idCategoria = Integer.parseInt(categoria);                     
                       receitas = receita.consultaLancamentosByIntervaloData(idUser, dataInicio, dataFim, agrupa, idCategoria);
                    }
                    else
                       receitas = receita.consultaLancamentosByIntervaloData(idUser, dataInicio, dataFim, agrupa);
                }
            %> 


            <%
                if (inicio == null && fim == null) {
                    out.write("<table style='display:none'>");
                } else {
                    if (inicio.isEmpty() && fim.isEmpty()) {
                        out.write("<table style='display:none'>");
                    } else {
                        out.write("<table style='display:block'>");
                    }
                }
            %>
            <table class="container5"> 
            <thead>
            <% if (inicio != null) { %>
            <th>Descricao</th>
            <th>Valor</th>
            <th>Data</th>
            <%}%>
        </thead> 
        <tbody>
            <% for (Receita r : receitas) {%>
            <tr>
                <td><% out.write(r.getDescricao());%></td>
                <td><% out.write(ConversorData.formataMoeda(r.getValor()));%></td>
                <td><% 
                        if (r.getData() == null)
                           out.write("-");
                        else           
                           out.write(String.valueOf(r.getData()));
                    %></td> 
                <input type="hidden" name="cat" value="<% out.write(r.getDescricao()); %>"/>
                <input type="hidden" name="vlr" value="<% out.write(String.valueOf(r.getValor())); %>"/>
            </tr>
            <%}%>
        </tbody>           
    </table>
        <div class="col-4 chart" style="position: absolute; left: 890px; top: 100px;">
            <canvas id="myChart1" width="400" height="400"></canvas>
            <script src="scripts/grafico1.js"></script>
        </div>    
<script>
                    function enviaForm() {
                        debugger;
                        var dataInicio = document.getElementsByName("dataInicio")[0];
                        if (dataInicio.value === "") {
                            dataInicio.focus();
                            alert("Informe data de Inicio");
                            return;
                        }
                        var dataFim = document.getElementsByName("dataFim")[0];
                        if (dataFim.value === "") {
                            dataFim.focus();
                            alert("Informe data de Final");
                            return;
                        }
                        document.forms[0].submit();
                    }
    </script>
    <div class="final">
        <p> <strong>C</strong> - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech</p>
    </div>  
</body>
</html>
