package model.pedido.venda;

import model.produto.Produto;

public class VendaProduto {
    private Venda venda;
    private Produto produto;
    private double quantidade;
    private double valor;

    public VendaProduto() {
    }

    public VendaProduto(Venda venda, Produto produto, double quantidade, double valor) {
        this.venda = venda;
        this.produto = produto;
        this.quantidade = quantidade;
        this.valor = valor;
    }

    public Venda getVenda() {
        return venda;
    }

    public void setVenda(Venda venda) {
        this.venda = venda;
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
        return "VendaProduto{" +
                "venda=" + venda +
                ", produto=" + produto +
                ", quantidade=" + quantidade +
                ", valor=" + valor +
                '}';
    }
}
