package controller.pedido;

import controller.Controller;
import model.pedido.ModalidadeTransporte;

import java.util.List;

public class ModalidadeTransporteController implements Controller<ModalidadeTransporte> {
    @Override
    public boolean salvar(ModalidadeTransporte modalidadeTransporte) {
        return false;
    }

    @Override
    public List<ModalidadeTransporte> exibirTodos() {
        return null;
    }

    @Override
    public ModalidadeTransporte exibir() {
        return null;
    }

    @Override
    public void excluir() {

    }
}
