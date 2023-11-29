package model.pedido.compra;

import model.pedido.ModalidadeTransporte;
import model.pedido.venda.Status;
import model.pessoa.Pessoa;

import java.util.Date;

public class Compra {
    private Long id;
    private Pessoa pessoa;
    private Date data;
    private Status status;
    private double valorTotal;
    private ModalidadeTransporte modalidadeTransporte;
    
	public Compra() {
		super();
	}

	public Compra(Pessoa pessoa, Date data, Status status, double valorTotal,
			ModalidadeTransporte modalidadeTransporte) {
		super();
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
		return "Compra [id=" + id + ", pessoa=" + pessoa + ", data=" + data + ", status=" + status + ", valorTotal="
				+ valorTotal + ", modalidadeTransporte=" + modalidadeTransporte + "]";
	}
    
    
    
}
