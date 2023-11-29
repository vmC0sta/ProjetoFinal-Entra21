package model.pedido.venda;

import model.pedido.ModalidadeTransporte;
import model.pessoa.Pessoa;

import java.util.Date;

public class Venda {
    private Long id;
    private Pessoa pessoa;
    private Date data;
    private Status status;
    private double valorTotal;
    private ModalidadeTransporte modalidadeTransporte;

    public Venda() {
    }

    public Venda(Pessoa pessoa, Date data, Status status, double valorTotal, ModalidadeTransporte modalidadeTransporte) {
        this.pessoa = pessoa;
        this.data = data;
        this.status = status;
        this.valorTotal = valorTotal;
        this.modalidadeTransporte = modalidadeTransporte;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public ModalidadeTransporte getModalidadeTransporte() {
        return modalidadeTransporte;
    }

    public void setModalidadeTransporte(ModalidadeTransporte modalidadeTransporte) {
        this.modalidadeTransporte = modalidadeTransporte;
    }

    @Override
    public String toString() {
        return "Venda{" +
                "id=" + id +
                ", pessoa=" + pessoa +
                ", data=" + data +
                ", status=" + status +
                ", valorTotal=" + valorTotal +
                ", modalidadeTransporte=" + modalidadeTransporte +
                '}';
    }
}
