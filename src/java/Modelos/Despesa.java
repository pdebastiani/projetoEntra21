/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

/**
 *
 * @author User
 */
public class Despesa {

    private int id;
    private int idUsuario;
    private int idCategoria;
    private String descricao;
    private float valor;
    private Date data;
    private Date dataInicial;
    private Date dataFinal;

    public boolean salvar() {
        String sql = "insert into despesa(idusuario, idcategoria, descricao, valor, data)";
        sql += "values(?,?,?,?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1,this.idUsuario);
            stm.setInt(2, this.idCategoria);
            stm.setString(3, this.descricao);
            stm.setFloat(4, this.valor);
            stm.setDate(5, this.data);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterar() {
        Connection con = Conexao.conectar();
        String sql = "update despesa set ";
        sql += "idcategoria = ?,";
        sql += "descricao = ?,";
        sql += "valor = ?,";
        sql += "data = ?";
        sql += " where id = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idCategoria);
            stm.setString(2, this.descricao);
            stm.setFloat(3, this.valor);
            stm.setDate(4, this.data);
            stm.setInt(5, this.id);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public Despesa consultar(int pId, int pIdUser) {
        Connection con = Conexao.conectar();
        String sql = "select id, idusuario, idcategoria, descricao, valor, data "
                + "from despesa where id = ? and idusuario = ?;";
        Despesa despesa = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pId);
            stm.setInt(2, pIdUser);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                despesa = new Despesa();
                despesa.setId(pId);
                despesa.setIdUsuario(pIdUser);
                despesa.setIdCategoria(rs.getInt("idcategoria"));
                despesa.setDescricao(rs.getString("descricao"));
                despesa.setValor(rs.getFloat("valor"));
                despesa.setData(rs.getDate("data"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return despesa;
    }
    
    public Despesa consultar(int id) {
        Connection con = Conexao.conectar();
        String sql = "select id, descricao, valor, data"
                + " from despesa where id = ?";
        Despesa despesa = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                despesa = new Despesa();
                despesa.setId(id);
                despesa.setDescricao(rs.getString("descricao"));
                despesa.setValor(rs.getFloat("valor"));
                despesa.setData(rs.getDate("data"));

            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return despesa;
    }
    
     public ResultSet consultarInner(int pIdUser) {
        Connection con = Conexao.conectar();
        String sql = "select d.id, d.idusuario, d.idcategoria, c.descricao categoria, "
                + "d.descricao, d.valor, d.data "
                + "from despesa d, categoria c "
                + "where d.idcategoria = c.id "
                + "and d.idusuario = ? "
                + "order by data;";
        ResultSet rs = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pIdUser);
            rs = stm.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return rs;
    }
      
    public float getTotalDespesa(int idUser, Date dataInicio, Date dataFim){
       List<Despesa> lista =  consultaLancamentosByIntervaloData(idUser,dataInicio, dataFim, true);
       float valor = 0f;
       for (Despesa d : lista){
           valor += d.getValor();
       }
       return valor;
    }
     
     public List<Despesa> consultaLancamentosByIntervaloData(int idUser, Date dataInicio, Date dataFim, boolean agrupar) {
        Connection con = Conexao.conectar();
        List<Despesa> lista = new ArrayList<>();
     /*   String sql = "select despesa.descricao, despesa.data, ";

        if (agrupar) {
            sql += " sum(despesa.valor) as valor ";
        } else {
            sql += " despesa.valor   ";
        }

        sql += " from despesa ";
        sql += " where despesa.idusuario = ?";
        sql += " and despesa.data between ? and ? ";
        if (agrupar) {
            sql += " group by despesa.descricao, despesa.data ";
        }
        sql += " order by despesa.descricao";
*/
        String sql = "select cat.descricao, ";

        if (agrupar) {
            sql += " sum(despesa.valor) as valor ";
        } else {
            sql += " despesa.valor   ";
        }

        sql += " from despesa, categoria cat ";
        sql += " where despesa.idcategoria = cat.id ";
        sql += " and despesa.idusuario = ?";
        sql += " and despesa.data between ? and ? ";
       // sql += " and despesa.idcategoria = ?";
        if (agrupar) {
            sql += " group by cat.descricao";
        }
        sql += " order by cat.descricao";
     
        Despesa despesa = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idUser);
            stm.setDate(2, dataInicio);
            stm.setDate(3, dataFim);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                despesa = new Despesa();
                despesa.setDescricao(rs.getString("descricao"));
                despesa.setValor(rs.getFloat("valor"));
                //despesa.setData(rs.getDate("data"));
                lista.add(despesa);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }
     
     public List<Despesa> consultaLancamentosByIntervaloData(int idUser, Date dataInicio, Date dataFim, boolean agrupar, int categoria) {
        Connection con = Conexao.conectar();
        List<Despesa> lista = new ArrayList<>();
        String sql = "select despesa.descricao, despesa.data, ";

        if (agrupar) {
            sql += " sum(despesa.valor) as valor ";
        } else {
            sql += " despesa.valor   ";
        }

        sql += " from despesa ";
        sql += " where despesa.idusuario = ?";
        sql += " and despesa.data between ? and ? ";
        sql += " and despesa.idcategoria = ?";
        if (agrupar) {
            sql += " group by despesa.descricao, despesa.data ";
        }
        sql += " order by despesa.descricao";
        
        Despesa despesa = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idUser);
            stm.setDate(2, dataInicio);
            stm.setDate(3, dataFim);
            stm.setInt(4, categoria);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                despesa = new Despesa();
                despesa.setDescricao(rs.getString("descricao"));
                despesa.setValor(rs.getFloat("valor"));
                despesa.setData(rs.getDate("data"));
                lista.add(despesa);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }
     
     public List<Despesa> consultar() {
        List<Despesa> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select id, descricao, valor, data from despesa";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Despesa despesa = new Despesa();
                despesa.setId(rs.getInt("id"));
                despesa.setDescricao(rs.getString("descricao"));
                despesa.setValor(rs.getFloat("valor"));
                despesa.setData(rs.getDate("data"));

                lista.add(despesa);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "delete from despesa ";
        sql += " where id = ? and idusuario = ?;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.setInt(2, this.idUsuario);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public Date getDataInicial() {
        return dataInicial;
    }

    public void setDataInicial(Date dataInicial) {
        this.dataInicial = dataInicial;
    }

    public Date getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(Date dataFinal) {
        this.dataFinal = dataFinal;
    }
    
}
