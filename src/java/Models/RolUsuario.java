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
public class RolUsuario {
    
    private int id;
    private int idUsuario;
    private int idRol;

    public RolUsuario() {
    }

    public RolUsuario(int id, int idUsuario, int idRol) {
        this.id = id;
        this.idUsuario = idUsuario;
        this.idRol = idRol;
    }

    public RolUsuario(int idUsuario, int idRol) {
        this.idUsuario = idUsuario;
        this.idRol = idRol;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    @Override
    public String toString() {
        return "RolUsuario{" + "id=" + id + ", idUsuario=" + idUsuario + ", idRol=" + idRol + '}';
    }
    
}
