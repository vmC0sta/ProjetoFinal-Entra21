package controller.endereco;

import controller.Controller;

import java.util.List;

public class CepController<Cep> implements Controller<Cep> {
    @Override
    public boolean salvar(Cep cep) {
        return false;
    }

    @Override
    public List<Cep> exibirTodos() {
        return null;
    }

    @Override
    public Cep exibir() {
        return null;
    }

    @Override
    public void excluir() {

    }
}
