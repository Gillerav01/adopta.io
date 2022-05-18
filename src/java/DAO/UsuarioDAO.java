package DAO;

import Lib.util;
import Models.Usuario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UsuarioDAO {
    
    private Connection conn;

    public boolean crearUsuario(Usuario Usuario) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return false;
        } else {
            System.out.println(Usuario);
            Statement st = this.conn.createStatement();
            st.executeUpdate("INSERT INTO `usuarios` (`id`, `nombre`, `email`, `telefono`, `dni`, `password`, `urlImagen`, `localidad`, `comunidad`) "
                    + "VALUES (NULL, '" + Usuario.getNombre() + "', '" + Usuario.getEmail() + "', '" + Usuario.getTelefono() + "', '" + Usuario.getDni() + "', '" + util.convertirSHA256(Usuario.getPassword()) + "', DEFAULT, '" + Usuario.getLocalidad() + "', '" + Usuario.getComunidad() + "');");
            return true;
        }
    }

    public Usuario verificar(String login, String pwd) throws SQLException {
        Statement stmt = this.conn.createStatement();
        ResultSet result = stmt.executeQuery("SELECT * FROM usuarios WHERE email = '" + login + "'");
        while (result.next()) {
            if (result.getString("password").equals(util.convertirSHA256(pwd))) {
                return new Usuario(result.getString("nombre"), result.getString("email"), result.getString("telefono"), result.getString("dni"), result.getString("urlImagen"), result.getString("localidad"), result.getString("comunidad"));
            }
        }
        return null;
    }

    public Connection getConn() {
        return conn;
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