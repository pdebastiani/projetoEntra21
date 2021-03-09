<%-- 
    Document   : cadastroUsuario
    Created on : 13/12/2020, 20:02:04
    Author     : User
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
    <body style="background-color:rgba(240,248,255)">
        <header>
            <div class="logo"><img src="imagens/logo.png"></div>
        </header>
        <div class="login">
        <img src="imagens/avatar.jpg" style="width:66px">
        <p> Olá... !!</p>
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
         
        <script type="text/javascript">
            function fMasc(objeto, mascara) {
                obj = objeto
                masc = mascara
                setTimeout("fMascEx()", 1)
            }
            function fMascEx() {
                obj.value = masc(obj.value)
            }
            function mTel(fone) {
                fone = fone.replace(/\D/g, "")
                fone = fone.replace(/^(\d)/, "($1")
                fone = fone.replace(/(.{3})(\d)/, "$1)$2")
                if (fone.length == 9) {
                    fone = fone.replace(/(.{1})$/, "-$1")
                } else if (fone.length == 10) {
                    fone = fone.replace(/(.{2})$/, "-$1")
                } else if (fone.length == 11) {
                    fone = fone.replace(/(.{3})$/, "-$1")
                } else if (fone.length == 12) {
                    fone = fone.replace(/(.{4})$/, "-$1")
                } else if (fone.length > 12) {
                    fone = fone.replace(/(.{4})$/, "-$1")
                }
                return fone;
            }
            function mCNPJ(cnpj) {
                cnpj = cnpj.replace(/\D/g, "")
                cnpj = cnpj.replace(/^(\d{2})(\d)/, "$1.$2")
                cnpj = cnpj.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3")
                cnpj = cnpj.replace(/\.(\d{3})(\d)/, ".$1/$2")
                cnpj = cnpj.replace(/(\d{4})(\d)/, "$1-$2")
                return cnpj
            }
            function mCPF(cpf) {
                cpf = cpf.replace(/\D/g, "")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
                return cpf
            }
            function mCEP(cep) {
                cep = cep.replace(/\D/g, "")
                cep = cep.replace(/^(\d{2})(\d)/, "$1.$2")
                cep = cep.replace(/\.(\d{3})(\d)/, ".$1-$2")
                return cep
            }
            function mNum(num) {
                num = num.replace(/\D/g, "")
                return num
            }
            
            function limpa_formulário_cep() {
                //Limpa valores do formulário de cep.
                document.getElementById('rua').value = ("");
                document.getElementById('bairro').value = ("");
                document.getElementById('cidade').value = ("");
                document.getElementById('uf').value = ("");
                //document.getElementById('ibge').value = ("");
            }
            function meu_callback(conteudo) {
                if (!("erro" in conteudo)) {
                    //Atualiza os campos com os valores.
                    document.getElementById('cep').value = (conteudo.cep);
                    document.getElementById('rua').value = (conteudo.logradouro);
                    document.getElementById('bairro').value = (conteudo.bairro);
                    document.getElementById('cidade').value = (conteudo.localidade);
                    document.getElementById('uf').value = (conteudo.uf);
                   // document.getElementById('ibge').value = (conteudo.ibge);
                } //end if.
                else {
                    //CEP não Encontrado.
                    limpa_formulário_cep();
                    alert("CEP não encontrado.");
                }
            }

            function pesquisacep(valor) {

                //Nova variável "cep" somente com dígitos.
                var cep = valor.replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if (validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        document.getElementById('rua').value = "...";
                        document.getElementById('bairro').value = "...";
                        document.getElementById('cidade').value = "...";
                        document.getElementById('uf').value = "...";
                        //document.getElementById('ibge').value = "...";

                        //Cria um elemento javascript.
                        var script = document.createElement('script');

                        //Sincroniza com o callback.
                        script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';

                        //Insere script no documento e carrega o conteúdo.
                        document.body.appendChild(script);

                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            }
        </script>
    </head>
    <body>  
    <div class="cadcat"><p>Cadastro de Usuarios</p>
        <div>
        <form action="recebeDadosUsuario.jsp" method="POST">
        <div class="row">
        <div class="col-25">            
        <label>Nome</label>
        </div>
        <div class="col-75">
        <input type="text" name="nome" />
        </div>
        </div>
        <div class="row">
        <div class="col-25">
        <label>CPF</label>
        </div> 
        <div class="col-75">    
        <input type="text" name="cpf" onkeydown="javascript: fMasc(this, mCPF);" 
               maxlength="14">
        </div>
        </div>
        <div class="row">
        <div class="col-25">
        <label>Data Nascimento</label>
        </div> 
        <div class="col-75">
        <input type="date" name="dataNascimento" />
        </div>
        </div>
        <div class="row">
        <div class="col-25">
        <label>Telefone</label>
        </div> 
        <div class="col-75">
        <input type="text" name="fone" onkeydown="javascript: fMasc(this, mTel);" 
        maxlength="15">
        </div>
        </div>
        <div class="row">
        <div class="col-25">
        <label>Cep</label>
        </div> 
        <div class="col-75">
        <input type="text" name="cep" id="cep"  
               maxlength="9" onblur="pesquisacep(this.value);">
        </div>
        </div>
        <div class="row">
        <div class="col-25">
        <label>Endereço</label>
        </div> 
        <div class="col-75">
        <input type="text" name="endereco" id="rua" maxlength="60"/>
        </div>
        </div>
        <div class="row">
        <div class="col-25">
        <label>Bairro</label>
        </div> 
        <div class="col-75">
        <input type="text" name="bairro" id="bairro" maxlength="30"/>
        </div>
        </div>
        <div class="row">
        <div class="col-25">
        <label>Cidade</label>
        </div> 
        <div class="col-75">
        <input type="text" name="cidade" id="cidade" maxlength="30"/>
        </div>
        </div>
        <div class="row">
        <div class="col-25">
        <label>Estado</label>
        </div> 
        <div class="col-75">
        <input type="text" name="uf" id="uf" maxlength="2"/>
        </div>
        </div>
        <div class="row">
        <div class="col-25">
        <label>e-Mail/Usuario</label>
        </div> 
        <div class="col-75">
        <input type="email" name="usuario" required />
        </div>
        </div>
        <div class="row">
        <div class="col-25">
        <label>Senha</label>
        </div> 
        <div class="col-75">
        <input type="password" name="senha" required />
        </div>
        </div>
            <br>
            <input class="salvar" type="button" value="Enviar" onclick="enviarDados()" />
            <input class="cancelar" type="reset" value="Cancelar" />
        </div>
        </form>

        <script>
            function enviarDados() {
            var nome = document.getElementsByName("nome");
            if (nome[0].value === "") {
            nome[0].focus();
            alert("informe o Nome");
            exit();
            }
            var cpf = document.getElementsByName("cpf");
            var numsStr = cpf[0].value.replace(/[^0-9]/g, '');
            if (!testaCpf(numsStr)) {
            cpf[0].focus();
            alert("Cpf inválido!");
            exit();
            }
            var dataNascimento = document.getElementsByName("dataNascimento");
            if (dataNascimento[0].value === "") {
            dataNascimento[0].focus();
            alert("informe a Data de Nascimento");
            exit();
            }
            var cep = document.getElementsByName("cep");
            if (cep[0].value === "") {
            cep[0].focus();
            alert("informe o Cep");
            exit();
            }
            document.forms[0].submit();
            }

            function testaCpf(strCPF) {
            var Soma;
            var Resto;
            Soma = 0;
            if (strCPF == "00000000000")
            return false;

            for (i = 1; i <= 9; i++)
            Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (11 - i);
            Resto = (Soma * 10) % 11;

            if ((Resto == 10) || (Resto == 11))
            Resto = 0;
            if (Resto != parseInt(strCPF.substring(9, 10)))
            return false;

            Soma = 0;
            for (i = 1; i <= 10; i++)
            Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (12 - i);
            Resto = (Soma * 10) % 11;

            if ((Resto == 10) || (Resto == 11))
            Resto = 0;
            if (Resto != parseInt(strCPF.substring(10, 11)))
            return false;
            return true;
            }
            </script>       
        </div>
        <div class="final">
            <p> <strong>C</strong> - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech</p>
        </div>  
    </body>
</html>
