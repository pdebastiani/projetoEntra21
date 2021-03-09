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

public class Usuario {

    private int idUser;
    private String nome;
    private String cpf;
    private Date dataNasc;
    private String fone;
    private String cep;
    private String endereco;
    private String bairro;
    private String cidade;
    private String uf;
    private String email;
    private String senha;

    public static boolean podeLogar(String pUser, String pSenha) {
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where email = ? and senha = ? ;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pUser);
            stm.setString(2, pSenha);
            ResultSet rs = stm.executeQuery();
            return rs.next();

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return false;
    }

    public boolean userExiste(String pUser) {
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where email = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pUser);
            ResultSet rs = stm.executeQuery();
            return rs.next();

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return false;
    }

    public boolean salvar() {
        String sql = "insert into usuario(nome,cpf,datanasc,fone,cep,endereco,bairro,cidade,uf,email,senha)";
        sql += "values(?,?,?,?,?,?,?,?,?,?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.cpf);
            stm.setDate(3, this.dataNasc);
            stm.setString(4, this.fone);
            stm.setString(5, this.cep);
            stm.setString(6, this.endereco);
            stm.setString(7, this.bairro);
            stm.setString(8, this.cidade);
            stm.setString(9, this.uf);
            stm.setString(10, this.email);
            stm.setString(11, this.senha);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterar(int pIdUser) {
        Connection con = Conexao.conectar();
        String sql = "update usuario set ";
        sql += "nome = ?,";
        sql += "cpf = ?,";
        sql += "datanasc = ?,";
        sql += "fone = ?,";
        sql += "cep = ?,";
        sql += "endereco = ?,";
        sql += "bairro = ?,";
        sql += "cidade = ?,";
        sql += "uf = ?,";
        sql += "email = ?,";
        sql += "senha = ?";
        sql += " where id = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.cpf);
            stm.setDate(3, this.dataNasc);
            stm.setString(4, this.fone);
            stm.setString(5, this.cep);
            stm.setString(6, this.endereco);
            stm.setString(7, this.bairro);
            stm.setString(8, this.cidade);
            stm.setString(9, this.uf);
            stm.setString(10, this.email);
            stm.setString(11, this.senha);
            stm.setInt(12, pIdUser);
            
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public Usuario consultar(int pId) {
        Connection con = Conexao.conectar();
        String sql = "select id,nome,cpf,datanasc,fone,cep,endereco,bairro,cidade,uf,email,senha"
                + " from usuario where id = ?";
        Usuario usuario = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setIdUser(pId);
                usuario.setNome(rs.getString("nome"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setDataNasc(rs.getDate("datanasc"));
                usuario.setFone(rs.getString("fone"));
                usuario.setCep(rs.getString("cep"));
                usuario.setEndereco(rs.getString("endereco"));
                usuario.setBairro(rs.getString("bairro"));
                usuario.setCidade(rs.getString("cidade"));
                usuario.setUf(rs.getString("uf"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return usuario;
    }

    public Usuario consultar(String pEmail) {
        Connection con = Conexao.conectar();
        String sql = "select id,nome,cpf,datanasc,fone,cep,endereco,bairro,cidade,uf,email,senha"
                + " from usuario where email = ?";
        Usuario usuario = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pEmail);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setIdUser(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setDataNasc(rs.getDate("datanasc"));
                usuario.setFone(rs.getString("fone"));
                usuario.setCep(rs.getString("cep"));
                usuario.setEndereco(rs.getString("endereco"));
                usuario.setBairro(rs.getString("bairro"));
                usuario.setCidade(rs.getString("cidade"));
                usuario.setUf(rs.getString("uf"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return usuario;
    }

    public List<Usuario> consultar() {
        Connection con = Conexao.conectar();
        String sql = "select id,nome,cpf,datanasc,fone,cep,endereco,bairro,cidade,uf,email,senha"
                + " from cliente";
        Usuario usuario = null;
        List<Usuario> lista = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                usuario = new Usuario();
                usuario.setIdUser(idUser);
                usuario.setNome(rs.getString("nome"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setDataNasc(rs.getDate("datanasc"));
                usuario.setFone(rs.getString("fone"));
                usuario.setCep(rs.getString("cep"));
                usuario.setEndereco(rs.getString("endereco"));
                usuario.setBairro(rs.getString("bairro"));
                usuario.setCidade(rs.getString("cidade"));
                usuario.setUf(rs.getString("uf"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                lista.add(usuario);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "delete from usuario ";
        sql += " where id = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idUser);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int id) {
        this.idUser = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getFone() {
        return fone;
    }

    public void setFone(String fone) {
        this.fone = fone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Date getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(Date dataNasc) {
        this.dataNasc = dataNasc;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

}
