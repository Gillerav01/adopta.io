package Models;

import java.sql.Date;

public class Articulo {
    private int id;
    private String nombre;
    private String descripcion;
    private String estado;
    private String fotoArticulo;
    private double precio;
    private Date fechaRegistro;
    private Date fechaCompra;
    private int idVendedor;
    private int idComprador;

    public Articulo() {
    }

    public Articulo(int id, String nombre, String descripcion, String estado, double precio, Date fechaRegistro, Date fechaCompra, int idVendedor, int idComprador) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.estado = estado;
        this.precio = precio;
        this.fechaRegistro = fechaRegistro;
        this.fechaCompra = fechaCompra;
        this.idVendedor = idVendedor;
        this.idComprador = idComprador;
    }

    public Articulo(String nombre, String descripcion, String estado, double precio, Date fechaRegistro, Date fechaCompra, int idVendedor, int idComprador) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.estado = estado;
        this.precio = precio;
        this.fechaRegistro = fechaRegistro;
        this.fechaCompra = fechaCompra;
        this.idVendedor = idVendedor;
        this.idComprador = idComprador;
    }

    public Articulo(int id, String nombre, String descripcion, String estado, String fotoArticulo, double precio, Date fechaRegistro, int idVendedor) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.estado = estado;
        this.fotoArticulo = fotoArticulo;
        this.precio = precio;
        this.fechaRegistro = fechaRegistro;
        this.idVendedor = idVendedor;
    }

    
    
    public Articulo(int id, String nombre, String descripcion, String estado, String fotoArticulo, double precio, Date fechaRegistro, Date fechaCompra, int idVendedor, int idComprador) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.estado = estado;
        this.fotoArticulo = fotoArticulo;
        this.precio = precio;
        this.fechaRegistro = fechaRegistro;
        this.fechaCompra = fechaCompra;
        this.idVendedor = idVendedor;
        this.idComprador = idComprador;
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

    public String getFotoArticulo() {
        return fotoArticulo;
    }

    public void setFotoArticulo(String fotoArticulo) {
        this.fotoArticulo = fotoArticulo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public Date getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(Date fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public int getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(int idVendedor) {
        this.idVendedor = idVendedor;
    }

    public int getIdComprador() {
        return idComprador;
    }

    public void setIdComprador(int idComprador) {
        this.idComprador = idComprador;
    }

    @Override
    public String toString() {
        return "Articulo{" + "id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + ", estado=" + estado + ", precio=" + precio + ", fechaRegistro=" + fechaRegistro + ", fechaCompra=" + fechaCompra + ", idVendedor=" + idVendedor + ", idComprador=" + idComprador + '}';
    }
    
}
