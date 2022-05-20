package DAO;

import Models.Articulo;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ArticuloDAO {
    private Connection conn;

    public int contarArticulos() throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return -1;
        } else {
            Statement stmt = this.conn.createStatement();
            ResultSet result = stmt.executeQuery("SELECT count(id) FROM articulos;");
            while (result.next()) {
                return result.getInt(1);
            }
        }
        return -1;
    }

    public ArrayList<Articulo> devolverArticulos(int numeroRegistros, int paginaActual, int numeroArtículos) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return null;
        } else {
            Statement stmt = this.conn.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM articulos  LIMIT " + paginaActual * (numeroRegistros + 1) + ", " + numeroRegistros + ";");
            ArrayList<Articulo> articulos = new ArrayList<>();
            while (result.next()) {
                articulos.add(new Articulo(result.getInt("id"), result.getString("nombre"), result.getString("descripcion"), result.getString("estado"), result.getString("fotoArticulo"), result.getDouble("precio"), result.getDate("fechaRegistro"), result.getInt("idVendedor")));
            }
            return articulos;
        }
    }

    public Articulo informacionArtículoDetallado(int id) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return null;
        } else {
            Statement stmt = this.conn.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM articulos WHERE articulos.id = " + id);
            while (result.next()) {
                return new Articulo(result.getInt("id"), result.getString("nombre"), result.getString("descripcion"), result.getString("estado"), result.getString("fotoArticulo"), result.getDouble("precio"), result.getDate("fechaRegistro"), result.getInt("idVendedor"));
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

}
