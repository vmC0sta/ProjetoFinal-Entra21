package model.endereco;

public class Municipio {
    private Long id;
    private String descricao;
    private String nome;
    private Estado estado;

    public Municipio() {
    }

    public Municipio(String descricao, String nome, Estado estado) {
        this.descricao = descricao;
        this.nome = nome;
        this.estado = estado;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Municipio{" +
                "id=" + id +
                ", descricao='" + descricao + '\'' +
                ", nome='" + nome + '\'' +
                ", estado=" + estado +
                '}';
    }
}
