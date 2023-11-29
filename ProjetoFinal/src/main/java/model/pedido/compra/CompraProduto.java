package model.pedido.compra;

import model.produto.Produto;

public class CompraProduto {
    private Compra compra;
    private Produto produto;
    private double quantidade;
    private double valor;

    public CompraProduto() {
    }

    public CompraProduto(Compra compra, Produto produto, double quantidade, double valor) {
        this.compra = compra;
        this.produto = produto;
        this.quantidade = quantidade;
        this.valor = valor;
    }

    public Compra getCompra() {
        return compra;
    }

    public void setCompra(Compra compra) {
        this.compra = compra;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public double getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(double quantidade) {
        this.quantidade = quantidade;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        return "CompraProduto{" +
                "compra=" + compra +
                ", produto=" + produto +
                ", quantidade=" + quantidade +
                ", valor=" + valor +
                '}';
    }
}
