package DAO;

import Models.Articulo;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.regex.Pattern;

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

    public boolean registrarArticulo(Articulo articulo, int idUsuario, String foto) throws SQLException {
        if (this.conn == null) {
            System.out.println("No existe una conexión con la base de datos.");
            return false;
        } else {
            if (articulo.getNombre() != null || articulo.getNombre() == "" || articulo.getDescripcion() != null || articulo.getDescripcion() == null) {
                char[] ch = articulo.getNombre().toCharArray();
                for (char c : ch) {
                    if (Character.isDigit(c)) {
                        return false;
                    }
                }
            }
            if (idUsuario <= 0) {
                return false;
            }
            if (foto.equals("DEFAULT")){
                return false;
            }
            
            if (articulo.getPrecio() <= 0){
                return false;
            }
            
            Statement st = this.conn.createStatement();
            String consulta = "INSERT INTO `articulos` (`id`, `nombre`, `descripcion`, `estado`, `fotoArticulo`, `precio`, `fechaRegistro`, `fechaVenta`, `idVendedor`, `idComprador`) VALUES (NULL, '" + articulo.getNombre() + "', '" + articulo.getDescripcion() + "', 'Publicado'";
            if (!"DEFAULT".equals(foto)) {
                consulta += ", '" + foto + "', ";
            } else {
                consulta += ", DEFAULT, ";
            }
            consulta += articulo.getPrecio() + ", current_timestamp(), NULL, " + idUsuario + ", NULL);";
            System.out.println(consulta);
            st.executeUpdate(consulta);
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
