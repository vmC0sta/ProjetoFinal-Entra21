package model.usuario;

import model.pessoa.Pessoa;

public class Usuario {
    private Long id;
    private String nome;
    private String senha;
    private Pessoa pessoa;
    
    public Usuario() {
    }
    
    public Usuario(String nome, String senha, Pessoa pessoa) {
        this.nome = nome;
        this.senha = senha;
        this.pessoa = pessoa;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    @Override
    public String toString() {
        return "Cargo{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", senha='" + senha + '\'' +
                ", pessoa=" + pessoa +
                '}';
    }
}
