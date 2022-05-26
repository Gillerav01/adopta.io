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

    public int contarMascotas() throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return -1;
        } else {
            Statement stmt = this.conn.createStatement();
            ResultSet result = stmt.executeQuery("SELECT count(id) FROM mascotas;");
            while (result.next()) {
                return result.getInt(1);
            }
        }
        return -1;
    }

    public ArrayList<Mascota> devolverMascotas(int numeroRegistros, int paginaActual, int numeroMascotas) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return null;
        } else {
            Statement stmt = this.conn.createStatement();

            ResultSet result = stmt.executeQuery("SELECT * FROM mascotas WHERE NOT perdida = 1 LIMIT " + paginaActual * (numeroRegistros + 1) + ", " + numeroRegistros + ";");
            ArrayList<Mascota> mascotas = new ArrayList<>();
            while (result.next()) {
                mascotas.add(new Mascota(result.getInt("id"), result.getString("nombre"), result.getString("tipo"), result.getString("raza"), result.getInt("prioridad"), false, result.getString("fotoMascota"), result.getInt("idUsuario")));
            }
            return mascotas;
        }
    }

    public ArrayList<Mascota> devolverMascotasPerdidas(int numeroRegistros, int paginaActual, int numeroMascotas) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return null;
        } else {
            Statement stmt = this.conn.createStatement();

            ResultSet result = stmt.executeQuery("SELECT * FROM mascotas WHERE NOT perdida = 0 LIMIT " + paginaActual * (numeroRegistros + 1) + ", " + numeroRegistros + ";");
            ArrayList<Mascota> mascotas = new ArrayList<>();
            while (result.next()) {
                mascotas.add(new Mascota(result.getInt("id"), result.getString("nombre"), result.getString("tipo"), result.getString("raza"), result.getInt("prioridad"), true, result.getString("fotoMascota"), result.getInt("idUsuario")));
            }
            return mascotas;
        }
    }

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
            return mascotas;
        }
    }
    
        public Mascota informacionMascotaDetallado(int id) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return null;
        } else {
            Statement stmt = this.conn.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM mascotas WHERE mascotas.id = " + id);
            while (result.next()) {
                return new Mascota(result.getInt("id"), result.getString("nombre"), result.getString("tipo"), result.getString("raza"), result.getInt("prioridad"), result.getBoolean("perdida"), result.getString("fotoMascota"), result.getInt("idUsuario"));
            }
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
    
        public boolean registrarMascota(Mascota mascota, int perdida, int idUsuario) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return false;
        } else {
            Statement st = this.conn.createStatement();
            st.executeUpdate("INSERT INTO `mascotas` (`id`, `nombre`, `tipo`, `raza`, `prioridad`, `perdida`, `comunidad`, `motivo`, `fotoMascota`, `idUsuario`, `idAdoptante`) VALUES (NULL, '" + mascota.getNombre() + "', '" + mascota.getTipo() + "', '" + mascota.getRaza() + "', " + mascota.getPrioridad() + "," + perdida + ", '" + mascota.getComunidad() + "', '" + mascota.getMotivo() + "'" + ", DEFAULT, '" + idUsuario + "', NULL);");
            return true;
        }
    }

}
