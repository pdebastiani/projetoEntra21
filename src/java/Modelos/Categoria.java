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
 * @author entra21
 */
public class Categoria {

    private int id;
    private int idUsuario;
    private String descricao;
    private String tipo;

    public boolean salvar() {
        String sql = "INSERT INTO CATEGORIA(IDUSUARIO, DESCRICAO, TIPO)";
        sql += "VALUES(?,?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idUsuario);
            stm.setString(2, this.descricao);
            stm.setString(3, this.tipo);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterar() {
        Connection con = Conexao.conectar();
        String sql = "UPDATE CATEGORIA SET ";
        sql += "DESCRICAO = ?,";
        sql += "TIPO = ? ";
        sql += "WHERE ID = ? AND IDUSUARIO = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.descricao);
            stm.setString(2, this.tipo);
            stm.setInt(3, this.id);
            stm.setInt(4, this.idUsuario);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public Categoria consultar(int id, int idUser) {
        Connection con = Conexao.conectar();
        String sql = "SELECT ID, IDUSUARIO, DESCRICAO, TIPO"
                + " FROM CATEGORIA WHERE ID = ? AND IDUSUARIO = ?";
        Categoria categoria = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setInt(2, idUser);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                categoria = new Categoria();
                categoria.setId(rs.getInt("id"));
                categoria.setIdUsuario(rs.getInt("idusuario"));
                categoria.setDescricao(rs.getString("descricao"));
                categoria.setTipo(rs.getString("tipo"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return categoria;
    }

    public List<Categoria> consultar(int pUser) {
        List<Categoria> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "SELECT ID, IDUSUARIO, DESCRICAO, TIPO FROM CATEGORIA"
                + " WHERE IDUSUARIO = ?"
                + " ORDER BY TIPO, DESCRICAO";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pUser);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(rs.getInt("id"));
                categoria.setIdUsuario(rs.getInt("idusuario"));    // remover depois
                categoria.setDescricao(rs.getString("descricao"));
                categoria.setTipo(rs.getString("tipo"));
                lista.add(categoria);
            }
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "DELETE FROM CATEGORIA ";
        sql += " WHERE ID = ? AND IDUSUARIO = ?";
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
    
     public List<Categoria> consultar(){
        List<Categoria> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select id, descricao, tipo from categoria";
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           ResultSet rs = stm.executeQuery();
           while(rs.next()){
            Categoria categoria = new Categoria();
            categoria.setId(rs.getInt("id"));
            categoria.setDescricao(rs.getString("descricao"));
            categoria.setTipo(rs.getString("tipo"));
            
            lista.add(categoria);
           }
           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
        }      
        return lista; 
    }

    public List<Categoria> consultar(int pIdUser, String pTipo) {
        List<Categoria> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "SELECT ID, IDUSUARIO, DESCRICAO, TIPO "
                + "FROM CATEGORIA "
                + "WHERE IDUSUARIO = ? AND TIPO = ? "
                + "ORDER BY DESCRICAO";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pIdUser);
            stm.setString(2, pTipo);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(rs.getInt("id"));
                categoria.setIdUsuario(rs.getInt("idusuario"));
                categoria.setDescricao(rs.getString("descricao"));
                categoria.setTipo(rs.getString("tipo"));
                lista.add(categoria);
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

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

}
