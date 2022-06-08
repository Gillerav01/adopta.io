package DAO;

import Lib.util;
import Models.Usuario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UsuarioDAO {

    private Connection conn;

    /***
     * Recibe un usuario para crearlo en la base de datos
     * @param Usuario
     * @return
     * @throws SQLException 
     */
    public boolean crearUsuario(Usuario Usuario) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return false;
        } else {
            System.out.println(Usuario);
            Statement st = this.conn.createStatement();
            st.executeUpdate("INSERT INTO `usuarios` (`id`, `nombre`, `email`, `telefono`, `dni`, `password`, `urlImagen`, `comunidad`) "
                    + "VALUES (NULL, '" + Usuario.getNombre() + "', '" + Usuario.getEmail() + "', '" + Usuario.getTelefono() + "', '" + Usuario.getDni() + "', '" + util.convertirSHA256(Usuario.getPassword()) + "', DEFAULT, '" + Usuario.getComunidad() + "');");
            return true;
        }
    }

    /***
     * Recibe el usuario y la contraseña de un usuario y devuelve un usuario si es que lo encuentra.
     * @param login
     * @param pwd
     * @return
     * @throws SQLException 
     */
    public Usuario verificar(String login, String pwd) throws SQLException {
        Statement stmt = this.conn.createStatement();
        ResultSet result = stmt.executeQuery("SELECT * FROM usuarios WHERE email = '" + login + "'");
        while (result.next()) {
            if (result.getString("password").equals(util.convertirSHA256(pwd))) {
                return new Usuario(result.getInt("id"), result.getString("nombre"), result.getString("email"), result.getString("telefono"), result.getString("dni"), result.getString("urlImagen"), result.getString("localidad"), result.getString("comunidad"));
            }
        }
        return null;
    }
    
    /***
     * Busca la información de un usuario en concreto
     * @param id
     * @return
     * @throws SQLException 
     */
    public Usuario informacionUsuarioDetallada(int id) throws SQLException {
        Statement stmt = this.conn.createStatement();
        ResultSet result = stmt.executeQuery("SELECT nombre, email, telefono, dni, urlImagen, comunidad FROM usuarios WHERE id = " + id);
        while (result.next()) {
            return new Usuario(result.getString("nombre"), result.getString("email"), result.getString("telefono"), result.getString("dni"), result.getString("urlImagen"), result.getString("comunidad"));
        }
        return null;
    }
    /***
     * Busca el dueño de un artículo por ID
     * @param idArticulo
     * @return
     * @throws SQLException 
     */
    public int buscarIdDuenioArticulo(int idArticulo) throws SQLException {
        Statement stmt = this.conn.createStatement();
        ResultSet result = stmt.executeQuery("SELECT articulos.idVendedor FROM articulos WHERE articulos.id = " + idArticulo);
        while (result.next()) {
            return result.getInt("idVendedor");
        }
        return -1;
    }
    
    /***
     * Busca la ID de un usuario por el correo
     * @param email
     * @return
     * @throws SQLException 
     */
    public int buscarIdUsuario(String email) throws SQLException{
           Statement stmt = this.conn.createStatement();
           ResultSet result = stmt.executeQuery("SELECT usuarios.id FROM usuarios WHERE usuarios.email = '" + email + "'");
           while (result.next()) {
               return result.getInt("id");
           }
           return -1;
    }

    /***
     * Busca el dueño de la mascota por id de la mascota
     * @param idMascota
     * @return
     * @throws SQLException 
     */
    public int buscarIdDuenioMascota(int idMascota) throws SQLException {
        Statement stmt = this.conn.createStatement();
        ResultSet result = stmt.executeQuery("SELECT mascotas.idUsuario FROM mascotas WHERE mascotas.id = " + idMascota);
        while (result.next()) {
            return result.getInt("idUsuario");
        }
        return -1;
    }

    
    /***
     * Busca el id del usuario por correo
     * @param email
     * @return
     * @throws SQLException 
     */
    public int buscarIdUsuarioPorCorreo(String email) throws SQLException {
        Statement stmt = this.conn.createStatement();
        ResultSet result = stmt.executeQuery("SELECT id FROM usuarios WHERE email = '" + email + "'");
        while (result.next()) {
            return result.getInt("id");
        }
        return -1;
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
