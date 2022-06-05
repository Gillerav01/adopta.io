package Models;

public class Mascota {
    private int id;
    private String nombre;
    private String tipo;
    private String raza;
    private int prioridad;
    private boolean perdida;
    private String comunidad;
    private String motivo;
    private String imagenMascota;
    private int idUsuario;

    public Mascota() {
    }

    public Mascota(int id, String nombre, String tipo, String raza, int prioridad, boolean perdida, int idUsuario) {
        this.id = id;
        this.nombre = nombre;
        this.tipo = tipo;
        this.raza = raza;
        this.prioridad = prioridad;
        this.perdida = perdida;
        this.idUsuario = idUsuario;
    }

    public Mascota(int id, String nombre, String tipo, String raza, int prioridad, boolean perdida, String comunidad, String motivo, String imagenMascota, int idUsuario) {
        this.id = id;
        this.nombre = nombre;
        this.tipo = tipo;
        this.raza = raza;
        this.prioridad = prioridad;
        this.perdida = perdida;
        this.comunidad = comunidad;
        this.motivo = motivo;
        this.imagenMascota = imagenMascota;
        this.idUsuario = idUsuario;
    }
    
    

    public Mascota(String nombre, String tipo, String raza, int prioridad, boolean perdida, int idUsuario) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.raza = raza;
        this.prioridad = prioridad;
        this.perdida = perdida;
        this.idUsuario = idUsuario;
    }

    public Mascota(String nombre, String tipo, String raza, int prioridad, int idUsuario) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.raza = raza;
        this.prioridad = prioridad;
        this.idUsuario = idUsuario;
    }

    public Mascota(int id, String nombre, String tipo, String raza, int prioridad, boolean perdida, String imagenMascota, int idUsuario) {
        this.id = id;
        this.nombre = nombre;
        this.tipo = tipo;
        this.raza = raza;
        this.prioridad = prioridad;
        this.perdida = perdida;
        this.imagenMascota = imagenMascota;
        this.idUsuario = idUsuario;
    }
    
    

    public Mascota(String nombre, String tipo, String raza, int prioridad, boolean perdida, String imagenMascota, int idUsuario) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.raza = raza;
        this.prioridad = prioridad;
        this.perdida = perdida;
        this.imagenMascota = imagenMascota;
        this.idUsuario = idUsuario;
    }

    public Mascota(String nombre, String tipo, String raza, int prioridad) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.raza = raza;
        this.prioridad = prioridad;
    }
    
    public Mascota(String nombre, String tipo, String raza, int prioridad, String comunidad) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.raza = raza;
        this.prioridad = prioridad;
        this.comunidad = comunidad;
    }
    
        public Mascota(String nombre, String tipo, String raza, int prioridad, String comunidad, String motivo) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.raza = raza;
        this.prioridad = prioridad;
        this.comunidad = comunidad;
        this.motivo = motivo;
    }


    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getMotivo() {
        return motivo;
    }
        
    public String getImagenMascota() {
        return imagenMascota;
    }

    public void setImagenMascota(String imagenMascota) {
        this.imagenMascota = imagenMascota;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public int getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(int prioridad) {
        this.prioridad = prioridad;
    }

    public boolean isPerdida() {
        return perdida;
    }

    public void setPerdida(boolean perdida) {
        this.perdida = perdida;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getComunidad() {
        return comunidad;
    }

    public void setComunidad(String comunidad) {
        this.comunidad = comunidad;
    }

    @Override
    public String toString() {
        return "Mascota{" + "id=" + id + ", nombre=" + nombre + ", tipo=" + tipo + ", raza=" + raza + ", prioridad=" + prioridad + ", perdida=" + perdida + ", idUsuario=" + idUsuario + '}';
    }
    
}
