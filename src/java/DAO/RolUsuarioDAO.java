package DAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class RolUsuarioDAO {
     
    private Connection conn;

        
    public Connection getConn() {
        return conn;
    }
        /***
         * Otorga un rol a un usuario
         * @param idUsuario
         * @return
         * @throws SQLException 
         */
        public boolean otorgarRolUsuario(int idUsuario) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return false;
        } else {
            Statement st = this.conn.createStatement();
            st.executeUpdate("INSERT INTO `rolusuario` (`id`, `idRol`, `idUsuario`) VALUES (NULL, '2', '" + idUsuario + "'); ");
            return true;
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
