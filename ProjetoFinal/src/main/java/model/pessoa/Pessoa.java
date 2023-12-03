package model.pessoa;

import model.endereco.Endereco;

public class Pessoa {
    private Long id;
    private String nome;
    private TipoPessoa tipoPessoa; /*Pessoa física ou Pessoa jurídica*/
    private String Identificacao;
    private String telefone;
    private String celular;
    private String informacaoComplementar;
    private Cargo cargo;
    private String email;
    private Endereco endereco;
    public Pessoa() {
    }
    public Pessoa(String nome, TipoPessoa tipoPessoa, String identificacao, String telefone, String celular, String informacaoComplementar, Cargo cargo, String email, Endereco endereco) {
        this.nome = nome;
        this.tipoPessoa = tipoPessoa;
        Identificacao = identificacao;
        this.telefone = telefone;
        this.celular = celular;
        this.informacaoComplementar = informacaoComplementar;
        this.cargo = cargo;
        this.email = email;
        this.endereco = endereco;
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

    public TipoPessoa getTipoPessoa() {
        return tipoPessoa;
    }

    public void setTipoPessoa(TipoPessoa tipoPessoa) {
        this.tipoPessoa = tipoPessoa;
    }

    public String getIdentificacao() {
        return Identificacao;
    }

    public void setIdentificacao(String identificacao) {
        Identificacao = identificacao;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getInformacaoComplementar() {
        return informacaoComplementar;
    }

    public void setInformacaoComplementar(String informacaoComplementar) {
        this.informacaoComplementar = informacaoComplementar;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }
    @Override
    public String toString() {
        return "Pessoa{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", tipoPessoa=" + tipoPessoa +
                ", Identificacao='" + Identificacao + '\'' +
                ", telefone='" + telefone + '\'' +
                ", celular='" + celular + '\'' +
                ", informacaoComplementar='" + informacaoComplementar + '\'' +
                ", cargo=" + cargo +
                ", email='" + email + '\'' +
                ", endereco=" + endereco +
                '}';
    }
}
