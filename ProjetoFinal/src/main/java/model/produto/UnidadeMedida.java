package model.produto;

public class UnidadeMedida {
    private Long id;
    private String descricao;
    private String sigla;

    public UnidadeMedida() {
    }
    public UnidadeMedida(String descricao, String sigla) {
        this.descricao = descricao;
        this.sigla = sigla;
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

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    @Override
    public String toString() {
        return "UnidadeMedida{" +
                "id=" + id +
                ", descricao='" + descricao + '\'' +
                ", sigla='" + sigla + '\'' +
                '}';
    }
}
