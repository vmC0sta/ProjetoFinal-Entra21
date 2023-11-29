package model.pedido;

public class ModalidadeTransporte {
    private Long id;
    private String descricao;

    public ModalidadeTransporte() {
    }

    public ModalidadeTransporte(String descricao) {
        this.descricao = descricao;
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

    @Override
    public String toString() {
        return "ModalidadeTransporte{" +
                "id=" + id +
                ", descricao='" + descricao + '\'' +
                '}';
    }
}
