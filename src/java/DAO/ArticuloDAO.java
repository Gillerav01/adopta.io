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
    /***ç
     * Cuenta el numero de artículos que hay en la base de datos
     * @return
     * @throws SQLException 
     */
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
    /**
     * Devuelve una cantidad de registros dependiendo del numeroRegistros que le pasemos y la página actual
     * @param numeroRegistros
     * @param paginaActual
     * @param numeroArtículos
     * @return
     * @throws SQLException 
     */
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
    
    /***
     * Recibe la información de un artículo detalladamente
     * @param id
     * @return
     * @throws SQLException 
     */

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
    /***
     * Recibe el artículo, la id del usuario que lo va a registrar y la foto que va a subirse a la base de datos
     * y entonces registra el artículo en esta.
     * @param articulo
     * @param idUsuario
     * @param foto
     * @return
     * @throws SQLException 
     */
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
    /***
     * Realiza la conexion
     * @param conn 
     */
    public void setConn(Connection conn) {
        this.conn = conn;
    }
    /***
     * Cierra la conexion
     * @return 
     */
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
