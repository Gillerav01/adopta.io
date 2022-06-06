var usuarios = [];
var articulos = [];
var incidencias = [];
var mascotas = [];

function borrarUsuario(id) {
    var peticion = $.ajax({
        url: "http://localhost/apiAdopta.io/borrarUsuario.php",
        type: "post",
        data: {
            idUsuario: id
        },
        dataType: "json",
        success: function (response) {
            Swal.fire({
                title: 'Usuario borrado',
                text: 'El usuario ha sido borrado correctamente',
                type: 'success',
                confirmButtonText: 'Ok'
            });
        },
        error: function (response) {
            console.log("ERROH");
            Swal.fire({
                title: 'Error',
                text: 'El usuario no ha podido ser borrado',
                type: 'error',
                confirmButtonText: 'Ok'
            });
        }
    });
}

function verInformacionUsuario(id) {
    var peticion = $.ajax({
        url: "http://localhost/apiAdopta.io/getUsuario.php",
        type: "post",
        data: {
            idUsuario: id
        },
        dataType: "json",
        success: function (response) {
            console.log(response.usuario[0]);
            Swal.fire({
                title: 'Informacion del usuario',
                text: `Nombre: ${response.usuario[0].nombre}<br>
                        Email: ${response.usuario[0].email}<br>
                        Telefono: ${response.usuario[0].telefono}<br>
                        DNI: ${response.usuario[0].dni}<br>
                        Comunidad: ${response.usuario[0].comunidad}`,
                type: 'success',
                confirmButtonText: 'Ok'
            });
        },
        error: function (response) {
            console.log("ERROH");
        }
    });
}

function borrarArticulo(id) {
    var peticion = $.ajax({
        url: "http://localhost/apiAdopta.io/borrarArticulo.php",
        type: "post",
        data: {
            idArticulo: id
        },
        dataType: "json",
        success: function (response) {
            Swal.fire({
                title: 'Articulo borrado',
                text: 'El articulo ha sido borrado correctamente',
                type: 'success',
                confirmButtonText: 'Ok'
            });
        },
        error: function (response) {
            console.log("ERROH");
            Swal.fire({
                title: 'Error',
                text: 'El articulo no ha podido ser borrado',
                type: 'error',
                confirmButtonText: 'Ok'
            });
        }
    });
}

function borrarMascota(id) {
    var peticion = $.ajax({
        url: "http://localhost/apiAdopta.io/borrarMascota.php",
        type: "post",
        data: {
            idMascota: id
        },
        dataType: "text",
        success: function (response) {
            Swal.fire({
                icon: 'success',
                title: 'Mascota borrada',
                text: 'La mascota ha sido borrada correctamente',
                type: 'success',
                confirmButtonText: 'Ok'
            });
        },
        error: function (response) {
            console.log("ERROH");
            Swal.fire({
                title: 'Error',
                text: 'La mascota no ha podido ser borrada',
                type: 'error',
                confirmButtonText: 'Ok'
            });
        }
    });
}

function verInformacionArticulo(id) {
    // Se crea una variable que contiene la peticion ajax.
    var peticion = $.ajax({
        url: "http://localhost/apiAdopta.io/getArticulo.php",
        type: "post",
        data: {
            idArticulo: id
        },
        dataType: "json",
        success: function (response) {
            console.log(response.articulo[0]);
            Swal.fire({
                title: 'Informacion del articulo',
                text: `
                        ID: ${response.articulo[0].id} \n,
                        Nombre: ${response.articulo[0].nombre} \n,
                        Descripcion: ${response.articulo[0].descripcion} \n,
                        Estado: ${response.articulo[0].estado} \n,
                        Precio: ${response.articulo[0].precio} \n,
                        Fecha: ${response.articulo[0].fechaRegistro} \n,
                        idVendedor: ${response.articulo[0].idVendedor} \n,
                `,
                type: 'success',
                confirmButtonText: 'Ok'
            });
        },
        error: function (response) {
            console.log("ERROH");
        }
    });
}

function verInformacionMascota(id) {
    // Se crea una variable que contiene la peticion ajax.
    var peticion = $.ajax({
        url: "http://localhost/apiAdopta.io/getMascota.php",
        type: "post",
        data: {
            idMascota: id
        },
        dataType: "json",
        success: function (response) {
            console.log(response.mascota[0]);
            Swal.fire({
                title: 'Informacion de la mascota',
                text: `
                    id: ${response.mascota[0].id} \n,
                    nombre: ${response.mascota[0].nombre} \n,
                    tipo: ${response.mascota[0].tipo} \n,
                    raza: ${response.mascota[0].raza} \n,
                    perdida: ${response.mascota[0].perdida} \n,
                    idUsuario: ${response.mascota[0].idUsuario} \n,

                `,
                type: 'success',
                confirmButtonText: 'Ok'
            });
        },
        error: function (response) {
            console.log("ERROH");
        }
    });
}

function borrarIncidencia(id) {
    // Se crea una variable que contiene la peticion ajax.
    var peticion = $.ajax({
        url: "http://localhost/apiAdopta.io/borrarIncidencia.php",
        type: "post",
        data: {
            idIncidencia: id
        },
        dataType: "json",
        success: function (response) {
            Swal.fire({
                title: 'Incidencia borrada',
                text: 'La incidencia ha sido borrada correctamente',
                type: 'success',
                confirmButtonText: 'Ok'
            });
        },
        error: function (response) {
            console.log("ERROH");
            Swal.fire({
                title: 'Error',
                text: 'La incidencia no ha podido ser borrada',
                type: 'error',
                confirmButtonText: 'Ok'
            });
        }
    });
}

function atenderIncidencia(id) {
    // Se crea una variable que contiene la peticion ajax.
    var peticion = $.ajax({
        url: "http://localhost/apiAdopta.io/atenderIncidencia.php",
        type: "post",
        data: {
            idIncidencia: id,
            idEncargado: document.getElementById("idActual").value
        },
        dataType: "json",
        success: function (response) {
            Swal.fire({
                title: 'Incidencia atendida',
                text: 'La incidencia se ha marcado como "Atendiendo".',
                type: 'success',
                confirmButtonText: 'Ok'
            });
        },
        error: function (response) {
            console.log("ERROH");
            Swal.fire({
                title: 'Error',
                text: 'La incidencia no ha podido ser atendida',
                type: 'error',
                confirmButtonText: 'Ok'
            });
        }
    });
}

function verInformacionIncidencia(id) {
    // Se crea una variable que contiene la peticion ajax.
    var peticion = $.ajax({
        url: "http://localhost/apiAdopta.io/getIncidencia.php",
        type: "post",
        data: {
            idIncidencia: id
        },
        dataType: "json",
        success: function (response) {
            console.log(response.incidencia[0]);
            Swal.fire({
                title: 'Informacion de la incidencia',
                text: `
                    id: ${response.incidencia[0].id} \n 
                    descripcion: ${response.incidencia[0].descripcion} \n
                    estado: ${response.incidencia[0].estado} \n
                    motivo: ${response.incidencia[0].motivo} \n
                    idUsuario: ${response.incidencia[0].idUsuario} \n
                `,
                type: 'success',
                confirmButtonText: 'Ok'
            });
        },
        error: function (response) {
            console.log("ERROH");
        }
    });
}

function addRol(id) {
    // Se crea una variable que contiene la peticion ajax.
    var rol = document.getElementById("rolesNoObtenidos").value;
    var peticion = $.ajax({
        url: "http://localhost/apiAdopta.io/addRol.php",
        type: "post",
        data: {
            idUsuario: id,
            idRol: rol
        },
        dataType: "json",
        success: function (response) {
            Swal.fire({
                title: 'Rol asignado',
                text: 'El rol ha sido asignado correctamente',
                type: 'success',
                confirmButtonText: 'Ok'
            });
        },
        error: function (response) {
            console.log("ERROH");
            Swal.fire({
                title: 'Error',
                text: 'El rol no ha podido ser asignado',
                type: 'error',
                confirmButtonText: 'Ok'
            });
        }
    });
}

function rmRol(id) {
    // Se crea una variable que contiene la peticion ajax.
    var rol = document.getElementById("rolesObtenidos").value;
    var peticion = $.ajax({
        url: "http://localhost/apiAdopta.io/revocarRol.php",
        type: "post",
        data: {
            idUsuario: id,
            idRol: rol
        },
        dataType: "json",
        success: function (response) {
            Swal.fire({
                title: 'Rol eliminado',
                text: 'El rol ha sido eliminado correctamente',
                type: 'success',
                confirmButtonText: 'Ok'
            });
        },
        error: function (response) {
            console.log("ERROH");
            Swal.fire({
                title: 'Error',
                text: 'El rol no ha podido ser eliminado',
                type: 'error',
                confirmButtonText: 'Ok'
            });
        }
    });
}

function modificarRoles(id) {
    var rolesUsuario = [];
    var rolesNoObtenidos = [];
    var peticionRolesUsuario = $.ajax({
        url: "http://localhost/apiAdopta.io/getRolesPertenecientesUsuario.php",
        type: "post",
        data: {
            idUsuario: id
        },
        dataType: "json",
        success: function (response) {
            for (var i = 0; i < response.rolesUsuario.length; i++) {
                rolesUsuario.push([response.rolesUsuario[i].id, response.rolesUsuario[i].nombre]);
            }
            console.log(rolesUsuario);
        },
        error: function (response) {
            console.log("ERROH");
        }
    });
    var peticionRolesNoObtenidos = $.ajax({
        url: "http://localhost/apiAdopta.io/getRolesNoPertenecientesUsuario.php",
        type: "post",
        data: {
            idUsuario: id
        },
        dataType: "json",
        success: function (response) {
            for (var i = 0; i < response.rolesUsuario.length; i++) {
                rolesNoObtenidos.push([response.rolesUsuario[i].id, response.rolesUsuario[i].nombre]);
            }
            console.log(rolesNoObtenidos);
        },
        error: function (response) {
            console.log("ERROH");
        }
    });
    Promise.all([peticionRolesUsuario, peticionRolesNoObtenidos]).then(function (values) {
        var html = `<div class="form-group">
                        <label for="rolesObtenidos">Roles obtenidos</label>`;
        if (rolesUsuario.length == 0) {
            html += `<select class="form-control" id="rolesObtenidos" disabled>
                        <option>No hay roles obtenidos</option>
                    </select>`;
        } else {
            html += `<select class="form-control" id="rolesObtenidos">`;
            for (var i = 0; i < rolesUsuario.length; i++) {
                html += `<option value="${rolesUsuario[i][0]}">${rolesUsuario[i][1]}</option>`;
            }
            html += `</select>`;
            html += `</div>`;
        }
        html += `<div class="form-group">
                    <label for="rolesNoObtenidos">Roles no obtenidos</label>`;
        if (rolesNoObtenidos.length == 0) {
            html += `<select class="form-control" id="rolesNoObtenidos" disabled>
                        <option>No hay roles no obtenidos</option>
                    </select>`;
        } else {
            html += `<select class="form-control" id="rolesNoObtenidos">`;
            for (var i = 0; i < rolesNoObtenidos.length; i++) {
                html += `<option value="${rolesNoObtenidos[i][0]}">${rolesNoObtenidos[i][1]}</option>`;
            }
            html += `</select>`;
            html += `</div>`;
        }
        html += `<button type="button" class="btn btn-primary" onclick="addRol(${id})">Agregar</button>
                <button type="button" class="btn btn-danger" onclick="rmRol(${id})">Eliminar</button>`;
        Swal.fire({
            title: 'Modificar roles',
            html: html,
            showCancelButton: true,
            showConfirmButton: false,
            cancelButtonText: 'Cancelar',
            showLoaderOnConfirm: true,
        }).then((result) => {
        }).catch(() => {
            Swal.fire({
                title: 'Cancelado',
                text: 'No se ha modificado ningun rol',
                type: 'error',
                confirmButtonText: 'Ok'
            });
        }
        );
    });
}




function tablaUsuarios() {
                fetch('http://localhost/apiAdopta.io/getUsuarios.php')
                    .then(function (response) {
                        return response.json();
                    }).then(function (myJson) {
                        for (var i = 0; i < myJson.usuarios.length; i++) {
                            usuarios.push([myJson.usuarios[i].id, myJson.usuarios[i].nombre, myJson.usuarios[i].email, myJson.usuarios[i].telefono, myJson.usuarios[i].dni, myJson.usuarios[i].comunidad]);
                        }
                        $('#table-usuarios').DataTable({
                            data: usuarios,
                            columns: [
                                { title: "ID" },
                                { title: "Nombre" },
                                { title: "Email" },
                                { title: "Telefono" },
                                { title: "DNI" },
                                { title: "Comunidad" },
                            ],
                            "language": {
                                "lengthMenu": "Mostrando MENU usuarios por página",
                                "zeroRecords": "No se ha encontrado el usuario.",
                                "info": "Mostrando página PAGE de PAGES",
                                "infoEmpty": "No se ha encontrado el usuario...",
                                "infoFiltered": "(filtrado de MAX usuarios)"
                            },
                            "autoWidth": false,
                            "lengthChange": false,
                            "responsive": true,
                        });
                        var tabla = $('#table-usuarios');
                        $('#table-usuarios tbody').on('click', 'tr', function () {
                            // Guarda los datos del usuario seleccionado
                            var datos = tabla.DataTable().row(this).data();
                            console.log("Datos: " + datos);
                            Swal.fire({
                                title: `Usuario ${datos[1]}`,
                                // Añade un HTML con 4 botones, Borrar usuario, modificar roles, ver informacion y cancelar.
                                html: `<div class="row">
                            <div class="col-md-6">
                                <button type="button" class="btn btn-danger" onclick="borrarUsuario(${datos[0]})">Borrar usuario</button>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-primary" onclick="modificarRoles(${datos[0]})">Modificar roles</button>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-success" onclick="verInformacionUsuario(${datos[0]})">Ver informacion</button>
                            </div>
                        </div>`,
                                showCloseButton: true,
                                showCancelButton: true,
                                showConfirmButton: false,
                                focusConfirm: false,
                                focusCancel: false,
                                allowOutsideClick: true,
                                allowEscapeKey: true,
                                allowEnterKey: true,
                            }).then((result) => {
                                if (result.value) {
                                    console.log("Cancelado");
                                }
                            })
                        });
                    }).catch(function (error) {
                        console.log(error);
                    });
            }

function tablaArticulos() {
                fetch('http://localhost/apiAdopta.io/getArticulos.php')
                    .then(function (response) {
                        return response.json();
                    }).then(function (myJson) {
                        for (var i = 0; i < myJson.articulos.length; i++) {
                            articulos.push([myJson.articulos[i].id, myJson.articulos[i].nombre, myJson.articulos[i].descripcion, myJson.articulos[i].precio, myJson.articulos[i].fechaRegistro, myJson.articulos[i].idVendedor]);

                        }
                        $('#table-articulos').DataTable({
                            data: articulos,
                            columns: [
                                { title: "ID" },
                                { title: "Nombre" },
                                { title: "Descripcion" },
                                { title: "Precio" },
                                { title: "Fecha registro" },
                                { title: "ID del vendedor" },
                            ],
                            "language": {
                                "lengthMenu": "Mostrando MENU usuarios por página",
                                "zeroRecords": "No se ha encontrado el usuario.",
                                "info": "Mostrando página PAGE de PAGES",
                                "infoEmpty": "No se ha encontrado el usuario...",
                                "infoFiltered": "(filtrado de MAX usuarios)"
                            },
                            "autoWidth": false,
                            "lengthChange": false
                        });
                        var tabla = $('#table-articulos');
                        $('#table-articulos tbody').on('click', 'tr', function () {
                            // Guarda los datos del articulo seleccionado
                            var datos = tabla.DataTable().row(this).data();
                            console.log("Datos: " + datos);
                            Swal.fire({
                                title: `Articulo ${datos[1]}`,
                                // Añade un HTML con 4 botones, Borrar articulo, modificar articulo, ver informacion y cancelar.
                                html: `<div class="row">
                            <div class="col-md-6">
                                <button type="button" class="btn btn-danger" onclick="borrarArticulo(${datos[0]})">Borrar articulo</button>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-success" onclick="verInformacionArticulo(${datos[0]})">Ver informacion</button>
                            </div>
                        </div>`,
                                showCloseButton: true,
                                showCancelButton: true,
                                showConfirmButton: false,
                                focusConfirm: false,
                                focusCancel: false,
                                allowOutsideClick: true,
                                allowEscapeKey: true,
                                allowEnterKey: true,
                                responsive: true,
                            }).then((result) => {
                                if (result.value) {
                                    console.log("Cancelado");
                                }
                            })
                        });
                    }).catch(function (error) {
                        console.log(error);
                    });

            }

function tablaIncidencias() {
                fetch('http://localhost/apiAdopta.io/verIncidencias.php')
                    .then(function (response) {
                        return response.json();
                    }
                    ).then(function (myJson) {
                        for (var i = 0; i < myJson.incidencias.length; i++) {
                            console.log(myJson.incidencias[i].id);
                            incidencias.push([myJson.incidencias[i].id, myJson.incidencias[i].descripcion, myJson.incidencias[i].estado, myJson.incidencias[i].motivo, myJson.incidencias[i].idEncargado, myJson.incidencias[i].idUsuario, myJson.incidencias[i].idArticulo, myJson.incidencias[i].idUsuario]);
                        }
                        $('#table-incidencias').DataTable({
                            data: incidencias,
                            columns: [
                                { title: "ID" },
                                { title: "Descripcion" },
                                { title: "Estado" },
                                { title: "Motivo" },
                                { title: "idEncargado" },
                                { title: "idUsuario" },
                            ],
                            "language": {
                                "lengthMenu": "Mostrando MENU usuarios por página",
                                "zeroRecords": "No se ha encontrado el usuario.",
                                "info": "Mostrando página PAGE de PAGES",
                                "infoEmpty": "No se ha encontrado el usuario...",
                                "infoFiltered": "(filtrado de MAX usuarios)"
                            },
                            "autoWidth": false,
                            "lengthChange": false
                        });
                        var tabla = $('#table-incidencias');
                        $('#table-incidencias tbody').on('click', 'tr', function () {
                            // Guarda los datos del articulo seleccionado
                            var datos = tabla.DataTable().row(this).data();
                            console.log("Datos: " + datos);
                            Swal.fire({
                                title: `Incidencia ${datos[1]}`,
                                // Añade un HTML con 4 botones, Borrar articulo, modificar articulo, ver informacion y cancelar.
                                html: `<div class="row">
                            <div class="col-md-6">
                                <button type="button" class="btn btn-danger" onclick="borrarIncidencia(${datos[0]})">Borrar incidencia</button>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-success" onclick="verInformacionIncidencia(${datos[0]})">Ver informacion</button>
                            </div>
                            <div class="col-md-6">
                                </div><button type="button" class="btn btn-success" onclick="atenderIncidencia(${datos[0]})">Atender incidencia</button>
                            </div>
                        </div>`,
                                showCloseButton: true,
                                showCancelButton: true,
                                showConfirmButton: false,
                                focusConfirm: false,
                                focusCancel: false,
                                allowOutsideClick: true,
                                allowEscapeKey: true,
                                allowEnterKey: true,
                            }).then((result) => {
                                if (result.value) {
                                    console.log("Cancelado");
                                }
                            })
                        }
                        );
                    }).catch(function (error) {
                        console.log(error);
                    });
            }

function tablaMascotas() {
                fetch('http://localhost/apiAdopta.io/getMascotas.php')
                    .then(function (response) {
                        return response.json();
                    }).then(function (myJson) {
                        for (var i = 0; i < myJson.mascotas.length; i++) {
                            mascotas.push([myJson.mascotas[i].id, myJson.mascotas[i].nombre, myJson.mascotas[i].tipo, myJson.mascotas[i].raza, myJson.mascotas[i].perdida, myJson.mascotas[i].idUsuario]);
                        }
                        $('#table-mascotas').DataTable({
                            data: mascotas,
                            columns: [
                                { title: "ID" },
                                { title: "Nombre" },
                                { title: "Tipo" },
                                { title: "Raza" },
                                { title: "Perdida" },
                                { title: "ID del usuario" },
                            ],
                            "language": {
                                "lengthMenu": "Mostrando MENU usuarios por página",
                                "zeroRecords": "No se ha encontrado el usuario.",
                                "info": "Mostrando página PAGE de PAGES",
                                "infoEmpty": "No se ha encontrado el usuario...",
                                "infoFiltered": "(filtrado de MAX usuarios)"
                            },
                            "autoWidth": false,
                            "lengthChange": false
                        });
                        var tabla = $('#table-mascotas');
                        $('#table-mascotas tbody').on('click', 'tr', function () {
                            // Guarda los datos del articulo seleccionado
                            var datos = tabla.DataTable().row(this).data();
                            console.log("Datos: " + datos);
                            Swal.fire({
                                title: `Mascota ${datos[1]}`,

                                html: `<div class="row">
                            <div class="col-md-6">
                                <button type="button" class="btn btn-danger" onclick="borrarMascota(${datos[0]})">Borrar mascota</button>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-success" onclick="verInformacionMascota(${datos[0]})">Ver informacion</button>
                            </div>
                        </div>`,
                                showCloseButton: true,
                                showCancelButton: true,
                                showConfirmButton: false,
                                focusConfirm: false,
                                focusCancel: false,
                                allowOutsideClick: true,
                                allowEscapeKey: true,
                                allowEnterKey: true,
                            }).then((result) => {
                                if (result.value) {
                                    console.log("Cancelado");
                                }
                            })
                        });
                    }).catch(function (error) {
                        console.log(error);
                    });

            }


$(document).ready(function () {
                tablaUsuarios();
                tablaArticulos();
                tablaIncidencias();
                tablaMascotas();
            });