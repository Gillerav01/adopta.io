package Models;

public class Incidencia {
    private int id;
    private String descripcion;
    private String estado;
    private int idUsuario;
    private int idEncargado;

    public Incidencia() {
    }

    public Incidencia(int id, String descripcion, String estado, int idUsuario, int idEncargado) {
        this.id = id;
        this.descripcion = descripcion;
        this.estado = estado;
        this.idUsuario = idUsuario;
        this.idEncargado = idEncargado;
    }

    public Incidencia(String descripcion, String estado, int idUsuario, int idEncargado) {
        this.descripcion = descripcion;
        this.estado = estado;
        this.idUsuario = idUsuario;
        this.idEncargado = idEncargado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdEncargado() {
        return idEncargado;
    }

    public void setIdEncargado(int idEncargado) {
        this.idEncargado = idEncargado;
    }

    @Override
    public String toString() {
        return "Incidencia{" + "id=" + id + ", descripcion=" + descripcion + ", estado=" + estado + ", idUsuario=" + idUsuario + ", idEncargado=" + idEncargado + '}';
    }
    
}
