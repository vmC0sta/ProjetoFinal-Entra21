package controller.pessoa;

import controller.Controller;
import model.pessoa.Pessoa;

import java.util.List;

public class PessoaController implements Controller<Pessoa> {
    @Override
    public boolean salvar(Pessoa pessoa) {
        return false;
    }

    @Override
    public List<Pessoa> exibirTodos() {
        return null;
    }

    @Override
    public Pessoa exibir(Long id) {
        return null;
    }

    @Override
    public void excluir(Long id) {

    }
}
