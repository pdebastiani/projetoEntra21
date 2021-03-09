#Projeto Entra21

- Este Projeto faz parte da conclusão do Curso JAVA WEB, ref. ao Programa Entra21 edição 2020
- Realizado pela equipe "moneycare" Jaqueline Reis, João Baptista, Juan Day e Paulo Sergio Debastiani(EU)
- Este projeto não é completo, tem muitas coisas a melhorar. O objetivo foi demonstrar nossas capacidades 
	e demonstrar todo o conhecimento adquirido no curso, e salientar que somos capazes de ir mais longe, 
	pois demonstramos que muitos detalhes que estão apresentados neste projeto, não estava na ementa do 
	curso, mas que achamos que fazia sentido e fomos atrás para por em prática:
	Ex: 	- Utilizar recursos de API para consultar CEP;
		- Usar recursos gráficos para demonstrar variações de valores;
		- Validar CPF; e
		- usar máscaras de campos de Telefone e CPF.


Siga estas informações iniciaos para ter Êxito nos testes deste Projeto:


Foi utilizados o Postgres como SGBD

Passo 1: Crie um database treinamento
Passo 2: execute dentro do datbase treinamento as informações contidas no arquivo
	"Comandos SQL para criar as tabelas.txt"


Basename: treinamento

JDBC URL: jdbc:postgresql://localhost:5432/postgres
Senha: 123

Abaixo segue a Classe de conexão utilizada:

public class Conexao {
    
    public static Connection conectar(){
        Connection con = null;
        String url = "jdbc:postgresql://localhost:5432/treinamento";
        String user = "postgres";
        String password = "123";
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro ao conectar com o banco (treinamento)");
        }
        return con;                
    }
}


Tecnologias utilizadas:

- Java Web JSP
- JDK - 8
- IDE NetBeans 11.2
- Postgres

Observações: 

- Usar a tecnologia JSP é porque fez parte da ementa do curso. Mas assim coneguimos mostrar que soubemos como
	interagir com o SGBD, dentro da Boa Prática de programação, seguindo os princípios da POO.
- Não fiz testes Unitários: Sei do que se trata, já li sobre o assunto, 
	mas ainda não estudei a ferramenta. Vou precisar estudar sobre JUnit


