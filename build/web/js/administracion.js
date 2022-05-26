var usuarios = [];
var articulos = [];
var incidencias = [];
var mascotas = [];
var roles = [];
var rolesCreados = [];
var rolesUsuario = [];

function tablaUsuarios() {
    fetch('http://localhost/apiAdopta.io/getUsuarios.php')
    .then(function(response) {
        return response.json();
    }).then(function(myJson) {
        for (var i = 0; i < myJson.usuarios.length; i++) {
            usuarios.push([myJson.usuarios[i].id, myJson.usuarios[i].nombre, myJson.usuarios[i].email, myJson.usuarios[i].telefono, myJson.usuarios[i].dni, myJson.usuarios[i].localidad]);
        }
        $('#table-usuarios').DataTable( {
                        data: usuarios,
                        columns: [
                            { title: "ID" },
                            { title: "Nombre" },
                            { title: "Email" },
                            { title: "Telefono" },
                            { title: "DNI" },
                            { title: "Localidad" },
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
                    } );
                    var tabla = $('#table-usuarios');
                    $('#table-usuarios tbody').on('click', 'tr', function () {
                        var data = tabla.DataTable().row( this ).data();
                        swal("¡Has seleccionado al usuario " + data[0] + " ," + data[1] + " " + data[2] +"!", {
                            buttons: {
                              cancel: "Cancelar",
                              modificarRol: {
                                text: "Modificar rol",
                                value: "modificarRol",
                              },
                              borrarAUsuario: {
                                text: "Borrar usuario",
                                value: "borrarUsuario",
                              },
                            },
                          })
                          .then((value) => {
                            switch (value) {
                              case "modificarRol":
                                fetch('http://localhost/apiAdopta.io/getRolesPertenecientesUsuario.php?idUsuario=' + data[0])
                                .then(function(response) {
                                    return response.json();
                                }).then(function(myJson) {
                                    rolesUsuario = myJson.rolesUsuario;
                                    fetch('http://localhost/apiAdopta.io/obtenerRoles.php')
                                    .then(function(response) {
                                        return response.json();
                                    }).then(function(myJson) {
                                        rolesCreados = myJson.roles;
                                    });
                                })
                              break;
                           
                              case "borrarUsuario":
                                swal({
                                    title: "¿Seguro que quieres borrar al usuario " + data[0] + " ," + data[1] + " " + data[2] + "?",
                                    text: "Una vez borrado, no se podrá recuperar.",
                                    icon: "warning",
                                    buttons: true,
                                    dangerMode: true,
                                  })
                                  .then((willDelete) => {
                                    if (willDelete) {
                                        fetch('http://localhost/apiAdopta.io/borrarUsuario.php?idUsuario=' + data[0])
                                        .then(function(response) {
                                            return response.text();
                                        }).then(function(myJson) {
                                            if (myJson == "OK") {
                                                swal("El usuario " + data[1] + " " + data[2] + " ha sido borrado correctamente.", {
                                                    icon: "success",
                                                });
                                                tabla.DataTable().row(this).remove().draw();
                                            }
                                            else {
                                                swal("El usuario " + data[1] + " " + data[2] + " no ha sido borrado.", {
                                                    icon: "error",
                                                });
                                            }
                                        });
                                    } else {
                                      swal("Has cancelado el borrado.");
                                    }
                                  });
                                break;
                           
                              default:
                            }
                          });
                    });
    }).catch(function(error) {
        console.log(error);
    });
}

function tablaArticulos() {
  fetch('http://localhost/apiAdopta.io/getArticulos.php')
  .then(function(response) {
      return response.json();
  }).then(function(myJson) {
      for (var i = 0; i < myJson.articulos.length; i++) {
      articulos.push([myJson.articulos[i].id, myJson.articulos[i].nombre, myJson.articulos[i].descripcion, myJson.articulos[i].precio, myJson.articulos[i].fechaRegistro, myJson.articulos[i].idVendedor]);

      }
      $('#table-articulos').DataTable( {
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
                  } );               
  }).catch(function(error) {
      console.log(error);
  });
}

function tablaIncidencias() {
  fetch('http://localhost/apiAdopta.io/verIncidencias.php')
  .then(function(response) {
      return response.json();
  }
  ).then(function(myJson) {
      for (var i = 0; i < myJson.incidencias.length; i++) {
      incidencias.push([myJson.incidencias[i].id, myJson.incidencias[i].descripcion, myJson.incidencias[i].estado, myJson.incidencias[i].motivo, myJson.incidencias[i].idEncargado, myJson.incidencias[i].idUsuario, myJson.incidencias[i].idArticulo, myJson.incidencias[i].idUsuario]);
      }
      $('#table-incidencias').DataTable( {
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
                  } );               
  }).catch(function(error) {
      console.log(error);
  });
}

function tablaMascotas() {
  fetch('http://localhost/apiAdopta.io/getMascotas.php')
  .then(function(response) {
      return response.json();
  }).then(function(myJson) {
      for (var i = 0; i < myJson.mascotas.length; i++) {
      mascotas.push([myJson.mascotas[i].id, myJson.mascotas[i].nombre, myJson.mascotas[i].tipo, myJson.mascotas[i].raza, myJson.mascotas[i].perdida, myJson.mascotas[i].idUsuario]);
      }
      $('#table-mascotas').DataTable( {
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
                  } );
  }).catch(function(error) {
      console.log(error);
  });
}


$(document).ready(function() {
    tablaUsuarios();
    tablaArticulos();
    tablaIncidencias();
    tablaMascotas();
});