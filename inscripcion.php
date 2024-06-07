<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscripcion</title>
    <link rel="stylesheet" href="./styles/inscripcion.css">

<!-- 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#pais').change(function () {
                var pais_id = $(this).val();
                $.ajax({
                    type: 'POST',
                    url: 'components/departamentos.php',
                    data: { pais_id: pais_id },
                    success: function (response) {
                        $('#departamento').html(response);
                        $('#municipio').html('<option value="">Selecciona un municipio</option>');
                    }
                });
            });

            $('#departamento').change(function () {
                var departamento_id = $(this).val();
                $.ajax({
                    type: 'POST',
                    url: 'components/municipios.php',
                    data: { departamento_id: departamento_id },
                    success: function (response) {
                        $('#municipio').html(response);
                    }
                });
            });
        });
    </script> -->




</head>

<body>

    <header class="header">
        <div class="Logo">
            <img src="img/udeo.png" Logo" class="logo-img" style="width: 256px; height: 128px;">
        </div>
        <div class="nombre-logo">
            <label>UNIVERSIDAD DE OCCIDENTE</label>
        </div>
    </header>


    <nav>
        <ul>
            <li><a href="">LOGIN</a></li>
        </ul>
    </nav>

    <section>

        <form action="inscripcion_codigo.php" method="post">
            <input type="hidden" name="action" value="insert">
            <div class="datos-personales">

                <div class="datospersonales-uno">
                    <h2>Datos Personales</h2>

                    <label for="cui">CUI</label>
                    <input type="number" id="cui" name="cui" required>

                    <label for="nombres">Nombres</label>
                    <input type="text" id="nombres" name="nombres" required>

                    <label for="apellidos">Apellidos</label>
                    <input type="text" id="apellidos" name="apellidos" required>

                    <label for="fecha_nacimiento">Fecha Nacimiento</label>
                    <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required>

                    <label for="telefono">Teléfono</label>
                    <input type="tel" id="telefono" name="telefono" required>

                </div>

                <div class="datospersonales-dos">


                    <label for="pais">País</label>
                    <select name="pais" id="pais" required>
                        <?php include 'components/paises.php'; ?>
                    </select>


                    <label for="departamento">Departamento</label>
                    <select name="departamento" id="departamento" required>
                        <option value="">Selecciona un departamento</option>
                    </select>

                    <label for="municipio">Municipio</label>
                    <select name="municipio" id="municipio" required>
                        <option value="">Selecciona un municipio</option>
                    </select>

                    <label for="direccion">Dirección</label>
                    <input type="text" id="direccion" name="direccion">
                </div>

            </div>


            <div class="datos-academicos">
                <h2>Datos Académicos</h2>
                <label for="diver">Diversificado</label>
                <select name="diver" id="diver" required>
                    <option value="range">Selecciona una opción</option>
                </select>

                <label for="carrera">Carreras</label>
                <select name="carrera" id="carrera required>
                    <option value=" range">Selecciona una carrera</option>
                </select>

                <label for="jornada">Jornada</label>
                <select name="jornada" id="jornada" required>
                    <option value="range">Selecciona una jornada</option>
                </select>

                <button type="submit" class="guardar-button">Guardar</button>
            </div>


        </form>

    </section>


    <footer>

    </footer>



</body>

</html>