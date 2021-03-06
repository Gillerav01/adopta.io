/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAO.ConectorBD;
import DAO.MascotaDAO;
import Models.Mascota;
import Models.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Guillermo
 */
public class mascotaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rd = null;
        ConectorBD bdActual = new ConectorBD("localhost", "adoptaio", "root", "");
       // Si se ha pulsado registar mascota se recoge los parametros del formulario y se registra en la base de datos
        if (request.getParameter("registrarMascota") != null){
            MascotaDAO registro = new MascotaDAO();
            registro.setConn(bdActual.getConexion());
            HttpSession session = request.getSession(true);
            Usuario actual = (Usuario) session.getAttribute("usuarioLogueado");
            if (registro.registrarMascota(new Mascota(request.getParameter("nombre"), request.getParameter("tipoMascota"), request.getParameter("raza"), Integer.parseInt(request.getParameter("prioridad")), request.getParameter("comunidad"), request.getParameter("motivo")), Integer.parseInt(request.getParameter("perdida")), actual.getId(), request.getParameter("baseImagen"))){
                System.out.println("Se ha registrado correctamente");
                rd = getServletContext().getRequestDispatcher("/mascotas.jsp");
                registro.cerrarConexion();
                rd.forward(request, response);
            } else {
                System.out.println("No se ha registrado.");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(mascotaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(mascotaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
