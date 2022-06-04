package Lib;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;

public class util {
        public static String convertirSHA256(String password) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }

        byte[] hash = md.digest(password.getBytes());
        StringBuffer sb = new StringBuffer();

        for (byte b : hash) {
            sb.append(String.format("%02x", b));
        }

        return sb.toString();
    }
    
   public static String convertirBase64(String s){
       return Base64.getEncoder().encodeToString(s.getBytes());
   }
   
   public static int contarPaginas(int x) {
        return x / 9;
   }
   
       public static String devolverComunidad(int n) {
        ArrayList<String> comunidad = new ArrayList(Arrays.asList("Andalucia", "Aragon", "Canarias", "Cantabria", "Castilla y Leon",
                "Castilla-La Mancha", "Catalunya", "Ceuta", "Comunidad Valenciana",
                "Comunidad de Madrid", "Extremadura", "Galicia", "Islas Baleares",
                "La Rioja", "Melilla", "Navarra", "Pais Vasco", "Principado de Asturias",
                "Region de Murcia"));
        return comunidad.get(n);
    }
    
    public static ArrayList<String> devolverArrayComunidad(){
        return new ArrayList(Arrays.asList("Por defecto", "Andalucia", "Aragon", "Canarias", "Cantabria", "Castilla y Leon",
                "Castilla-La Mancha", "Catalunya", "Ceuta", "Comunidad Valenciana",
                "Comunidad de Madrid", "Extremadura", "Galicia", "Islas Baleares",
                "La Rioja", "Melilla", "Navarra", "Pais Vasco", "Principado de Asturias",
                "Region de Murcia"));
    }
    
    public static String devolverProvincia(int n) {
        ArrayList<String> provincia = new ArrayList(Arrays.asList("Alava", "Albacete", "Alicante", "Almería", "Avila", "Badajoz", "Baleares", "Barcelona", "Burgos", "Cáceres",
        "Cádiz", "Castellón", "Ciudad Real", "Córdoba", "La Coruña", "Cuenca", "Gerona", "Granada", "Guadalajara",
        "Guipúzcoa", "Huelva", "Huesca", "Jaén", "León", "Lérida", "La rioja", "Lugo", "Madrid", "Málaga", "Murcia", "Navarra",
        "Orense", "Asturias", "Palencia", "Las Palmas", "Pontevedra", "Salamanca", "Tenerife", "Cantabria", "Segovia", "Sevilla", "Soria", "Tarragona",
        "Teruel", "Toledo", "Valencia", "Valladolid", "Vizcaya", "Zamora", "Zaragoza", "Ceuta", "Melilla"));
        return provincia.get(n);
    }    
   
        public static ArrayList<String> devolverArrayProvincia(){
            return new ArrayList(Arrays.asList("Por defecto", "Alava", "Albacete", "Alicante", "Almería", "Avila", "Badajoz", "Baleares", "Barcelona", "Burgos", "Cáceres",
            "Cádiz", "Castellón", "Ciudad Real", "Córdoba", "La Coruña", "Cuenca", "Gerona", "Granada", "Guadalajara",
            "Guipúzcoa", "Huelva", "Huesca", "Jaén", "León", "Lérida", "La rioja", "Lugo", "Madrid", "Málaga", "Murcia", "Navarra",
            "Orense", "Asturias", "Palencia", "Las Palmas", "Pontevedra", "Salamanca", "Tenerife", "Cantabria", "Segovia", "Sevilla", "Soria", "Tarragona",
            "Teruel", "Toledo", "Valencia", "Valladolid", "Vizcaya", "Zamora", "Zaragoza", "Ceuta", "Melilla"));
    }
    
           public static ArrayList<String> devolverArrayTiposMascota(){
            return new ArrayList(Arrays.asList("Por defecto", "Gato", "Perro", "Pájaro", "Roedor"));
    }
        
}
