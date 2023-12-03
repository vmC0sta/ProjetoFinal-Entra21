package model.pessoa;

public class Cargo{
	
    private Long id;
    private String descricao;
    
    public Cargo() {
    }
    
    public Cargo(String descricao) {
        this.descricao = descricao;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    @Override
    public String toString() {
        return "Cargo{" +
                "id=" + id +
                ", cargo='" + descricao +
                '}';
    }
	
}