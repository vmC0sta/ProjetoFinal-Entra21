package model.produto;

public class Estoque {
    private Long id;
    private double quantidade;
    private Produto produto;
    private double valortotal;

    public Estoque() {
    }

    public Estoque(double quantidade, Produto produto, double valortotal) {
        this.quantidade = quantidade;
        this.produto = produto;
        this.valortotal = valortotal;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(double quantidade) {
        this.quantidade = quantidade;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public double getValortotal() {
        return valortotal;
    }

    public void setValortotal(double valortotal) {
        this.valortotal = valortotal;
    }

    @Override
    public String toString() {
        return "Estoque{" +
                "id=" + id +
                ", quantidade=" + quantidade +
                ", produto=" + produto +
                ", valortotal=" + valortotal +
                '}';
    }
}
