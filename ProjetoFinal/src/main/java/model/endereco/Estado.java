package model.endereco;

public class Estado {
    private Long id;
    private String descricao;
    private Pais pais;

    public Estado() {
    }

    public Estado(String descricao, Pais pais) {
        this.descricao = descricao;
        this.pais = pais;
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

    public Pais getPais() {
        return pais;
    }
    public void setPais(Pais pais) {
        this.pais = pais;
    }
    @Override
    public String toString() {
        return "Estado{" +
                "id=" + id +
                ", descricao='" + descricao + '\'' +
                ", pais=" + pais +
                '}';
    }
}
