package controller.endereco;

import controller.Controller;
import model.endereco.Endereco;

import java.util.List;

public class EnderecoController implements Controller<Endereco> {

    @Override
    public boolean salvar(Endereco endereco) {
        return false;
    }

    @Override
    public List<Endereco> exibirTodos() {
        return null;
    }

    @Override
    public Endereco exibir() {
        return null;
    }

    @Override
    public void excluir() {

    }
}
