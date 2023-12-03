package controller;

import java.util.List;

public interface Controller <T>{
    boolean salvar(T t);
    List<T> exibirTodos();
    T exibir(Long id);
    boolean editar(Long id, T t);
    boolean excluir(Long id);
}

