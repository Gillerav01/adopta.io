package DAO;

import Lib.util;
import Models.Mascota;
import Models.Usuario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MascotaDAO {

    private Connection conn;
    /***
     * Cuenta las mascotas en la base de datos
     * @return
     * @throws SQLException 
     */
    public int contarMascotas() throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return -1;
        } else {
            Statement stmt = this.conn.createStatement();
            ResultSet result = stmt.executeQuery("SELECT count(id) FROM mascotas;");
            while (result.next()) {
                System.out.println(result.getInt(1));
                return result.getInt(1);
            }
        }
        this.cerrarConexion();
        return -1;
    }
    /***
     * Devuelve lsa mascotas dependiendo del numero de registros pasados y la página actual
     * @param numeroRegistros
     * @param paginaActual
     * @param numeroMascotas
     * @return
     * @throws SQLException 
     */
    public ArrayList<Mascota> devolverMascotas(int numeroRegistros, int paginaActual) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return null;
        } else {
            Statement stmt = this.conn.createStatement();

            ResultSet result = stmt.executeQuery("SELECT * FROM mascotas WHERE NOT perdida = 1 ORDER BY fechaRegistro DESC LIMIT " + paginaActual * (numeroRegistros + 1) + ", " + numeroRegistros + ";");
            ArrayList<Mascota> mascotas = new ArrayList<>();
            while (result.next()) {
                System.out.println("Mascota con ID: " + result.getInt("id"));
                mascotas.add(new Mascota(result.getInt("id"), result.getString("nombre"), result.getString("tipo"), result.getString("raza"), result.getInt("prioridad"), false, result.getString("fotoMascota"), result.getInt("idUsuario")));
            }
            this.cerrarConexion();
            return mascotas;
        }
    }
    /***
     * Devuelve las mascotas NO PERDIDAS filtradas dependiendo del tipo de mascota, comunidad, numero de registros y la página actual.
     * @param tipoMascota
     * @param comunidad
     * @param numeroRegistros
     * @param paginaActual
     * @param numeroMascotas
     * @return
     * @throws SQLException 
     */
    public ArrayList<Mascota> devolverMascotasFiltradas(String tipoMascota, String comunidad, int numeroRegistros, int paginaActual, int numeroMascotas) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return null;
        } else {
            Statement stmt = this.conn.createStatement();
            String consulta = "SELECT * FROM mascotas WHERE perdida = 0 ";
            if (!"Por defecto".equals(comunidad)) {
                consulta += "AND mascotas.comunidad = '" + comunidad + "' ";
            }
            if (!"Por defecto".equals(tipoMascota)) {
                consulta += "AND mascotas.tipo = '" + tipoMascota + "'";
            }
            
            System.out.println(consulta);

            ResultSet result = stmt.executeQuery(consulta + " ORDER BY fechaRegistro DESC LIMIT " + paginaActual * (numeroRegistros + 1) + ", " + numeroRegistros + ";");

            ArrayList<Mascota> mascotas = new ArrayList<>();
            while (result.next()) {
                mascotas.add(new Mascota(result.getInt("id"), result.getString("nombre"), result.getString("tipo"), result.getString("raza"), result.getInt("prioridad"), true, result.getString("fotoMascota"), result.getInt("idUsuario")));
            }
            this.cerrarConexion();
            return mascotas;
        }
    }
    
    /***
     * Devuelve las mascotas PERDIDAS filtradas dependiendo del tipo de mascota, comunidad, numero de registros y la página actual.
     * @param tipoMascota
     * @param comunidad
     * @param numeroRegistros
     * @param paginaActual
     * @param numeroMascotas
     * @return
     * @throws SQLException 
     */
    public ArrayList<Mascota> devolverMascotasPerdidasFiltradas(String tipoMascota, String comunidad, int numeroRegistros, int paginaActual, int numeroMascotas) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return null;
        } else {
            Statement stmt = this.conn.createStatement();
            String consulta = "SELECT * FROM mascotas WHERE perdida = 1 ";
            if (!"Por defecto".equals(comunidad)) {
                consulta += "AND mascotas.comunidad = '" + comunidad + "' ";
            }
            if (!"Por defecto".equals(tipoMascota)) {
                consulta += "AND mascotas.tipo = '" + tipoMascota + "'";
            }

            ResultSet result = stmt.executeQuery(consulta + " ORDER BY fechaRegistro DESC LIMIT " + paginaActual * (numeroRegistros + 1) + ", " + numeroRegistros + ";");

            ArrayList<Mascota> mascotas = new ArrayList<>();
            while (result.next()) {
                mascotas.add(new Mascota(result.getInt("id"), result.getString("nombre"), result.getString("tipo"), result.getString("raza"), result.getInt("prioridad"), true, result.getString("fotoMascota"), result.getInt("idUsuario")));
            }
            this.cerrarConexion();
            return mascotas;
        }
    }
    /***
     * Devuelven las mascotas perdidas sin filtro
     * @param numeroRegistros
     * @param paginaActual
     * @param numeroMascotas
     * @return
     * @throws SQLException 
     */
    public ArrayList<Mascota> devolverMascotasPerdidas(int numeroRegistros, int paginaActual, int numeroMascotas) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return null;
        } else {
            Statement stmt = this.conn.createStatement();

            ResultSet result = stmt.executeQuery("SELECT * FROM mascotas WHERE NOT perdida = 0 ORDER BY fechaRegistro DESC LIMIT " + paginaActual * (numeroRegistros + 1) + ", " + numeroRegistros + ";");
            ArrayList<Mascota> mascotas = new ArrayList<>();
            while (result.next()) {
                mascotas.add(new Mascota(result.getInt("id"), result.getString("nombre"), result.getString("tipo"), result.getString("raza"), result.getInt("prioridad"), true, result.getString("fotoMascota"), result.getInt("idUsuario")));
            }
            this.cerrarConexion();
            return mascotas;
        }
    }
    
    
    /***
     * Busca la información de una mascota en especifico
     * @param id
     * @return
     * @throws SQLException 
     */
    public ArrayList<Mascota> informacionMascotaEspecifica(int id) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return null;
        } else {
            Statement stmt = this.conn.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM mascotas WHERE mascotas.id = " + id);
            ArrayList<Mascota> mascotas = new ArrayList<>();
            while (result.next()) {
                boolean perdida = false;
                if (result.getInt("perdida") == 1) {
                    perdida = true;
                }
                mascotas.add(new Mascota(result.getInt("id"), result.getString("nombre"), result.getString("tipo"), result.getString("raza"), result.getInt("prioridad"), perdida, result.getString("comunidad"), result.getString("motivo"), result.getString("fotoMascota"), result.getInt("idUsuario")));
            }
            this.cerrarConexion();
            return mascotas;
        }
    }

     /***
     * Busca la información de una mascota en especifico
     * @param id
     * @return
     * @throws SQLException 
     */
    public Mascota informacionMascotaDetallado(int id) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return null;
        } else {
            Statement stmt = this.conn.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM mascotas WHERE mascotas.id = " + id);
            while (result.next()) {
                return new Mascota(result.getInt("id"), result.getString("nombre"), result.getString("tipo"), result.getString("raza"), result.getInt("prioridad"), result.getBoolean("perdida"), result.getString("comunidad"), result.getString("motivo"), result.getString("fotoMascota"), result.getInt("idUsuario"));
            }
            this.cerrarConexion();
            return null;
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

    
    /***
     * Recibe un objeto de mascota, perdida, idUsuario y la foto, para registrar la mascota.
     * @param mascota
     * @param perdida
     * @param idUsuario
     * @param foto
     * @return
     * @throws SQLException 
     */
    public boolean registrarMascota(Mascota mascota, int perdida, int idUsuario, String foto) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return false;
        } else {
        Statement st = this.conn.createStatement();
        System.out.println(mascota.toString());
        String consulta = "INSERT INTO `mascotas` (`id`, `nombre`, `tipo`, `raza`, `prioridad`, `perdida`, `comunidad`, `motivo`, `fotoMascota`, `idUsuario`, `idAdoptante`, `fechaRegistro`) VALUES (NULL, '" + mascota.getNombre() + "', '" + mascota.getTipo() + "', '" + mascota.getRaza() + "', " + mascota.getPrioridad() + "," + perdida + ", '" + mascota.getComunidad() + "', '" + mascota.getMotivo() + "'";
        if (!"DEFAULT".equals(foto)) {
            consulta += ", '" + foto + "', ";
        } else {
            consulta += ", DEFAULT, ";
        }
        st.executeUpdate(consulta + "'" + idUsuario + "', NULL, DEFAULT);");
        return true;
    }

}
}
