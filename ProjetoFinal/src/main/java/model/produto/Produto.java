package model.produto;

public class Produto {
    private Long id;
    private String codigoReferencia;
    private String descricao;
    private Categoria categoria;
    private UnidadeMedida unidadeMedida;

    public Produto() {
    }

    public Produto(String codigoReferencia, String descricao, Categoria categoria, UnidadeMedida unidadeMedida) {
        this.codigoReferencia = codigoReferencia;
        this.descricao = descricao;
        this.categoria = categoria;
        this.unidadeMedida = unidadeMedida;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCodigoReferencia() {
        return codigoReferencia;
    }

    public void setCodigoReferencia(String codigoReferencia) {
        this.codigoReferencia = codigoReferencia;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public UnidadeMedida getUnidadeMedida() {
        return unidadeMedida;
    }

    public void setUnidadeMedida(UnidadeMedida unidadeMedida) {
        this.unidadeMedida = unidadeMedida;
    }
    @Override
    public String toString() {
        return "Produto{" +
                "id=" + id +
                ", codigoReferencia='" + codigoReferencia + '\'' +
                ", descricao='" + descricao + '\'' +
                ", categoria=" + categoria +
                ", unidadeMedida=" + unidadeMedida +
                '}';
    }
}
