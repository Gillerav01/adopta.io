/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Guillermo
 */
public class Usuario {

    private int id;
    private String nombre;
    private String email;
    private String telefono;
    private String dni;
    private String password;
    private String urlImagen;
    private String localidad;
    private String comunidad;

    public Usuario() {
    }

    public Usuario(int id, String nombre, String email, String telefono, String dni, String password, String urlImagen, String localidad, String comunidad) {
        this.id = id;
        this.nombre = nombre;
        this.email = email;
        this.telefono = telefono;
        this.dni = dni;
        this.password = password;
        this.urlImagen = urlImagen;
        this.localidad = localidad;
        this.comunidad = comunidad;
    }

    public Usuario(String nombre, String email, String telefono, String dni, String password, String urlImagen, String localidad, String comunidad) {
        this.nombre = nombre;
        this.email = email;
        this.telefono = telefono;
        this.dni = dni;
        this.password = password;
        this.urlImagen = urlImagen;
        this.localidad = localidad;
        this.comunidad = comunidad;
    }

    public Usuario(String nombre, String email, String telefono, String dni, String password, String localidad, String comunidad) {
        this.nombre = nombre;
        this.email = email;
        this.telefono = telefono;
        this.dni = dni;
        this.password = password;
        this.localidad = localidad;
        this.comunidad = comunidad;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUrlImagen() {
        return urlImagen;
    }

    public void setUrlImagen(String urlImagen) {
        this.urlImagen = urlImagen;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getComunidad() {
        return comunidad;
    }

    public void setComunidad(String comunidad) {
        this.comunidad = comunidad;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", nombre=" + nombre + ", email=" + email + ", telefono=" + telefono + ", dni=" + dni + ", password=" + password + ", urlImagen=" + urlImagen + ", localidad=" + localidad + ", comunidad=" + comunidad + '}';
    }
    
    
    
}
