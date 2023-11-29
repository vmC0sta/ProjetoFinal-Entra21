package model.endereco;

public class Cep {
    private Long id;
    private String codigoPostal;
    private Municipio municipio;
    private Estado estado;
    private Pais pais;

    public Cep() {
    }

    public Cep(String codigoPostal, Municipio municipio, Estado estado, Pais pais) {
        this.codigoPostal = codigoPostal;
        this.municipio = municipio;
        this.estado = estado;
        this.pais = pais;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public Municipio getMunicipio() {
        return municipio;
    }

    public void setMunicipio(Municipio municipio) {
        this.municipio = municipio;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    @Override
    public String toString() {
        return "Cep{" +
                "id=" + id +
                ", codigoPostal='" + codigoPostal + '\'' +
                ", municipio=" + municipio +
                ", estado=" + estado +
                ", pais=" + pais +
                '}';
    }
}
