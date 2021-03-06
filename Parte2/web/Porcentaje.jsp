<%-- 
    Document   : Porcentaje
    Created on : 09-mar-2016, 19:13:57
    Author     : 2DAW
--%>
<%--Declaramos las variables --%>
<%! int inicio = 0;
    int numApellidos = 0;
    String provincia = "todas";
    int numPaginas = 0;
%>
<%--Asignamos las variables si no son nulas, ya que la 1ª vez que se accede a la app son nulas --%>
<%
    if (request.getAttribute("inicio") != null) {
        inicio = (Integer) request.getAttribute("inicio");
    }
    if (request.getAttribute("numApellidos") != null) {
        numApellidos = (Integer) request.getAttribute("numApellidos");
    }

    if (request.getAttribute("provincia") != null) {
        provincia = (String) request.getAttribute("provincia");
    }

    numPaginas = (Integer) request.getAttribute("numPaginas");

    int pagActual = inicio / 20;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Porcentaje de Apellidos</title>
        <link rel="stylesheet" type="text/css" href="assets/estilos.css" media="screen" />
        <link rel="icon" href="assets/favicon.jpg" type="image/gif">
    </head>
    <body>
        <%@ include file="index.jsp"%><%--Incluimos menú --%>
    <center>
        <hr noshade>
        <h1><u>Estadisticas de relevancia de primero apellido</u></h1>
        <h2>Número de usuarios: <% out.println(request.getAttribute("numUsuarios")); %> - Número de apellidos: <% out.println(request.getAttribute("numApellidos")); %></h2>
        <form action="Porcentaje" method="POST">
            <%
                if (request.getAttribute("select") != null) {
                    out.println(request.getAttribute("select"));
                }
            %>

        </form>
        <br>
        <%
            if (request.getAttribute("tabla") != null) {
                out.println(request.getAttribute("tabla"));
            }
        %>
        <%-- PAGINADOR --%>        
        <p>

            <% if (inicio != pagActual) {%>
                <a href="Porcentaje?inicio=0&provincia=<%=provincia%>" class="paginas" title="Inicio"><</a>
                <a href="Porcentaje?inicio=<%=(inicio - 20) + "&provincia=" + provincia%>" class="paginas" title="Anterior"><<</a>
            <% } %>

            <% for (int i = 0; i < numPaginas; i++) {
                if ((i - 2) <= pagActual && pagActual <= i + 2 && i != pagActual) {%>              

                    <a href="Porcentaje?inicio=<%=(i * 20) + "&provincia=" + provincia%>" class="paginas"><%=i + 1%></a>

                <% } //Fin if%>

                <% if (i == pagActual) {%> 
                    <%="<span class='paginas paginaActual'>" + (i + 1) + "</span>"%>
                <% } //Fin if%>

            <%}//Fin for%>

            <% if (numPaginas != (pagActual+1)) { //pagActual empieza en 0, por eso sumamos 1%>
                <a href="Porcentaje?inicio=<%=(inicio + 20) + "&provincia=" + provincia%>" class="paginas">>></a>
                <a href="Porcentaje?inicio=<%=((numPaginas - 1) * 20) + "&provincia=" + provincia%>" class="paginas">></a>
            <% }%>


        </p>
    </center>

    <script>
        function MuestraProvincia() {
            var idprovincia = document.getElementById("provincia").value;
            window.location = "http://" + window.location.host + "/Parte2/Porcentaje?inicio=0&provincia=" + idprovincia;
        }
    </script>

    <script src="assets/jquery.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function(){
            $("tr:odd").addClass("impar"); // filas impares
            $("tr:even").addClass("par"); // filas pares
        });
    </script>

</body>
</html>
