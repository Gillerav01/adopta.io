/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAO.ConectorBD;
import DAO.RolDAO;
import DAO.UsuarioDAO;
import Lib.util;
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
public class indexController extends HttpServlet {

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
        Connection conn;
        
        if (request.getParameter("iniciarSesion") != null){
            System.out.println("Has pulsado iniciar sesion");
            System.out.println("El usuario es: " + request.getParameter("nombre") + " y la contraseña es " + request.getParameter("password"));
            UsuarioDAO logueando = new UsuarioDAO();
            conn = bdActual.getConexion();
            logueando.setConn(conn);
            Usuario comprobacionLogueo = logueando.verificar(request.getParameter("nombre"), request.getParameter("password"));
            System.out.println(util.convertirSHA256(request.getParameter("password")));
            if(comprobacionLogueo != null){
                HttpSession session = request.getSession(true);
                session.setAttribute("usuarioLogueado", comprobacionLogueo);
                RolDAO recibirRoles = new RolDAO();
                recibirRoles.setConn(conn);
                session.setAttribute("rolesUsuarioLogueado", recibirRoles.devolverRolesUsuario(comprobacionLogueo.getId()));
                rd = getServletContext().getRequestDispatcher("/index.jsp");
                System.out.println("El usuario: " + comprobacionLogueo + " se ha logueado con exito.");
                logueando.cerrarConexion();
                rd.forward(request, response);
            } else {
                System.out.println("No se ha logueado correctamente.");
                rd = getServletContext().getRequestDispatcher("/index.jsp");
                System.out.println("El usuario: " + comprobacionLogueo + " se ha logueado con exito.");
                logueando.cerrarConexion();
                rd.forward(request, response);
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
            Logger.getLogger(indexController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(indexController.class.getName()).log(Level.SEVERE, null, ex);
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
