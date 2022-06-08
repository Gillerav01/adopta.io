package DAO;

import Models.Incidencia;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class IncidenciaDAO {
    
        private Connection conn;
    
        /***
         * Recibe un objeto de tipo incidencia para registrarla en la base de datos
         * @param incidencia
         * @return
         * @throws SQLException 
         */
        public boolean crearIncidencia(Incidencia incidencia) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return false;
        } else {
            Statement st = this.conn.createStatement();
            st.executeUpdate("INSERT INTO `incidencias` (`id`, `motivo`, `descripcion`, `estado`, `idEncargado`, `idUsuario`) VALUES (NULL, '" 
                    + incidencia.getMotivo() + "', '" + incidencia.getDescripcion() + "', '" + incidencia.getEstado() + "', '" + incidencia.getIdEncargado() 
                    + "', '" + incidencia.getIdUsuario() + "');");
            return true;
        }
    }
        /***
         * Recibe el ID de la incidencia y el estado de la incidencia a la que queremos modificar.
         * @param idIncidencia
         * @param estadoIncidencia
         * @return
         * @throws SQLException 
         */
        public boolean actualizarEstadoIncidencia(int idIncidencia, String estadoIncidencia) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return false;
        } else {
            Statement st = this.conn.createStatement();
            st.executeUpdate("UPDATE `incidencias` SET `estado` = '" + estadoIncidencia +  "' WHERE `incidencias`.`id` = " + idIncidencia + ";");
            return true;
        }
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
