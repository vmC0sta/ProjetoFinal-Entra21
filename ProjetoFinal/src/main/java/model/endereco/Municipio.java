package model.endereco;

public class Municipio {
    private Long id;
    private String descricao;
    private Estado estado;

    public Municipio() {
    }

    public Municipio(String descricao, Estado estado) {
        this.descricao = descricao;
        this.estado = estado;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
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
                ", estado=" + estado +
                '}';
    }
}
