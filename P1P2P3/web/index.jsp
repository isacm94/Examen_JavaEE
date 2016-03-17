<%-- 
    Document   : index
    Created on : 16-mar-2016, 18:22:05
    Author     : 2DAW
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>P1P2P3</title>
        <link rel="stylesheet" type="text/css" href="assets/estilos.css" media="screen" />
    </head>
    <body>
        <ul>
            <li><a href="Calculadora.jsp">Calculadora</a></li>
            <li><a href="TablasMultiplicar.jsp">Tablas de Multiplicar</a></li>
            <li><a href="ListadoUsuarios">Mostrar todos los usuarios</a></li>
            <li><a href="Porcentaje">Mostrar porcentaje de apellidos</a></li>
            <li>
                <form action="ListadoUsuarios" method="POST">
                    Usuarios empiecen por:
                    <input type="text" name="cadena">
                    <input type="submit" value="Mostrar" name="mostrar">
                </form>
            </li>
        </ul>
        
        <script src="assets/jquery.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $("tr:odd").addClass("impar"); // filas impares
            $("tr:even").addClass("par"); // filas pares
        });
    </script>
    </body>
</html>
