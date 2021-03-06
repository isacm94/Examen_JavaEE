/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PracticaJavaEE;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 2DAW
 */
public class Login extends HttpServlet {

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
            throws ServletException, IOException {
        //Recogemos datos enviados por post
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");

        Boolean sesionIniciada = false;
        String Error = "";

        HttpSession sesion = request.getSession();

        //Si los datos son correcto y no se ha iniciado sesión
        if (UsuarioCorrecto(username, pass)) {
            sesion.setAttribute("username", username);
            sesionIniciada = true;
        } else {
            Error = "Usuario o contraseña incorrectos";
            sesionIniciada = false;
        }

        if (!sesionIniciada) {
            //Pasamos los datos a Login.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");

            request.setAttribute("username", username);
            request.setAttribute("Error", Error);
            dispatcher.forward(request, response);//Redirigimos al formulario de la calculadora
        } else {
            response.sendRedirect("Menu.jsp");
        }
    }

    protected boolean UsuarioCorrecto(String user, String clave) {
        ArrayList usuarios = new ArrayList();
        ArrayList claves = new ArrayList();

        usuarios.add("u1");
        usuarios.add("u2");
        usuarios.add("juan");

        claves.add("c1");
        claves.add("c2");
        claves.add("cjuan");

        if (usuarios.contains(user) && claves.contains(clave)) {
            return true;
        } else {
            return false;
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
        processRequest(request, response);
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
        processRequest(request, response);
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
