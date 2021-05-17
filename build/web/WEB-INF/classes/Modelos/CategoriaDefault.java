/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

/**
 *
 * @author entra21
 */
public class CategoriaDefault {

    private int id;
    private String descricao;
    private String tipo;

    public boolean salvar() {
        String sql = "INSERT INTO CATEGORIA_DEFAULT(DESCRICAO, TIPO)";
        sql += " VALUES(?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.descricao);
            stm.setString(2, this.tipo);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterar() {

        Connection con = Conexao.conectar();
        String sql = "UPDATE CATEGORIA_DEFAULT SET ";
        sql += "DESCRICAO = ?,";
        sql += "TIPO = ?";
        sql += " WHERE ID = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.descricao);
            stm.setString(2, this.tipo);
            stm.setInt(3, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public CategoriaDefault consultar(int id) {
        Connection con = Conexao.conectar();
        String sql = "SELECT ID, DESCRICAO, TIPO"
                + " FROM CATEGORIA_DEFAULT WHERE ID = ?";
        CategoriaDefault categoria_default = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                categoria_default = new CategoriaDefault();
                categoria_default.setId(rs.getInt("id"));
                categoria_default.setDescricao(rs.getString("descricao"));
                categoria_default.setTipo(rs.getString("tipo"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return categoria_default;
    }

    public ResultSet consultarTodas() {
        Connection con = Conexao.conectar();
        String sql = "SELECT * FROM CATEGORIA_DEFAULT ORDER BY TIPO, ID;";
        ResultSet rs = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return rs;
    }

    public List<CategoriaDefault> consultar() {
        List<CategoriaDefault> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "SELECT ID, DESCRICAO, TIPO FROM CATEGORIA_DEFAULT "
                + "ORDER BY TIPO, ID";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CategoriaDefault categoria_default = new CategoriaDefault();
                categoria_default.setId(rs.getInt("id"));
                categoria_default.setDescricao(rs.getString("descricao"));
                categoria_default.setTipo(rs.getString("tipo"));
                lista.add(categoria_default);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "DELETE FROM CATEGORIA_DEFAULT ";
        sql += " WHERE ID = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public List<CategoriaDefault> consultar(String tipo) {
        List<CategoriaDefault> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "SELECT ID, DESCRICAO, TIPO FROM CATEGORIA_DEFAULT "
                + "WHERE TIPO = ? ORDER BY DESCRICAO;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, tipo);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CategoriaDefault categoria_default = new CategoriaDefault();
                categoria_default.setId(id);
                categoria_default.setDescricao(rs.getString("descricao"));
                categoria_default.setTipo(rs.getString("tipo"));
                lista.add(categoria_default);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
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

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

}
