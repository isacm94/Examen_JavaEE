<%-- 
    Document   : TablasMultiplicar
    Created on : 06-mar-2016, 10:16:59
    Author     : Isabel
--%>

<%  HttpSession s2 = request.getSession(); %>
<% if (s2.getAttribute("username") == null) {//Sesion NO INICIADA%>
<%@ include file="login.jsp"%><%--Vamos al login --%>
<% }

    
        else { %>
<%--Declaramos las variables --%>
<%! String tabla = "";
    String numero = "";
    String error_msg = "";
%>
<%--Asignamos las variables si no son nulas, ya que la 1ª vez que se accede a la app son nulas --%>
<%
    if (request.getAttribute("tabla") != null) {
        tabla = (String) request.getAttribute("tabla");
    }

    if (request.getAttribute("numero") != null) {
        numero = (String) request.getAttribute("numero");
    }

    if (request.getAttribute("error") != null) {
        error_msg = (String) request.getAttribute("error");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tablas de Multiplicar</title>
        <link rel="stylesheet" type="text/css" href="assets/estilos.css" media="screen" />
        <link rel="icon" href="assets/tablas.png" type="image/gif" sizes="16x16">
    </head>
    <body>
        <%@ include file="Menu.jsp"%><%--Incluimos menú --%>
    <center>
        <hr noshade>
        <h1>Tablas de Multiplicar</h1>
        <form action="Tabla" method="post"> <!--Lo mandamos al servlet TablaMultiplicar.java-->
            <p>
                Número:
                <input type="text" name="numero" value="<%=numero%>"/>                
                <input type="submit" name="mostrar" value="Mostrar tabla" />

                <%  if (!error_msg.equals("")) {
                        out.println("<div class='error'>");
                        out.println(error_msg);
                        out.println("</div>");
                    }
                %>
            </p>
        </form>

        <form action="Tablas" method="post"><!--Lo mandamos al servlet TablasMultiplicar.java-->
            <p>
                <input type="hidden" name="numero" value="<%=numero%>">
                <input type="submit" name="mostrartodas" value="Motrar todas las tablas" />
            </p>
        </form>
        <p> Menú rapido:</p>
        <% for (int i = 1; i <= 10; i++) {
                        out.println("<a href='Tabla?numero=" + i + "'>- Tabla del " + i + "</a><br>");
                    }%>
        <br>

        <%--Mostramos la tabla generada --%>
        <%  if (!tabla.equals("")) {
                out.println(tabla);
            }
        %>
    </center>
    <%  if (request.getAttribute("lista") != null) {
            out.println(request.getAttribute("lista"));
        }
    %>
</body>
</html>
<% }%>
