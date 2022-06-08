package DAO;

import Models.Rol;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class RolDAO {
         
    private Connection conn;

        
    public Connection getConn() {
        return conn;
    }
    
    /***
     * Devuelve los roles de un usuario.
     * @param idUsuario
     * @return
     * @throws SQLException 
     */
    public ArrayList<Rol> devolverRolesUsuario(int idUsuario) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return null;
        } else {
            Statement stmt = this.conn.createStatement();

            ResultSet result = stmt.executeQuery("SELECT roles.nombre FROM usuarios, roles, rolusuario WHERE usuarios.id = " + idUsuario + " AND roles.id = rolusuario.idRol AND usuarios.id = rolusuario.idUsuario;");
            ArrayList<Rol> roles = new ArrayList<>();
            while (result.next()) {
                roles.add(new Rol(result.getString("nombre")));
            }
            return roles;
        }
    }
    
    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public Connection cerrarConexion() {
        try {
            this.conn.close();
            System.out.println("Cerrando conexion" + this.conn);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        this.conn = null;
        return this.conn;
    }
}
