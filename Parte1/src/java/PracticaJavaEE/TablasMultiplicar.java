/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PracticaJavaEE;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Isabel
 */
public class TablasMultiplicar extends HttpServlet {

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

        RequestDispatcher dispatcher = request.getRequestDispatcher("/TablasMultiplicar.jsp");
        String tabla = "";
        String lista = "";
        String numero = request.getParameter("numero");
        
        if (numero.equals("-1")) {
            lista = getLista();
        } else {
            tabla = Tablas();
        }
        request.setAttribute("tabla", tabla);
        request.setAttribute("lista", lista);
        dispatcher.forward(request, response);//Redirigimos al formulario de la tabla de multiplicar
    }

    protected String getLista() {
        String lista = "";

        lista += "<ul>";
        for (int i = 1; i <= 200; i++) {
            lista += "<li>" + i + "</li>";
        }
        lista += "</ul>";
        return lista;
    }

    /**
     * Devuelve las tablas del 1 al 10
     *
     * @return HTML generado de la tabla
     */
    protected String Tablas() {

        String html = "";

        html += "<table class='todas'>";

        for (int i = 1; i <= 10; i++) {

            //Para que muestre dos líneas
            if (i == 1) {
                html += "\n\t<tr>";
            }

            html += "\n\t\t<td class='todas'>";
            for (int j = 1; j <= 10; j++) {
                if (j == 1) {
                    html += "\n\t\t\t<b>Tabla de multiplicar del " + i + "</b><br><hr>";
                }
                html += "\n\t\t\t" + i + " x " + j + " = " + (i * j) + "<br>";
            }

            html += "\n\t\t</td>";

            if (i % 3 == 0) {
                html += "\n\t\t</tr>\n\t\t<tr>";
            }

        }
        html += "</table>";
        return html;
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
