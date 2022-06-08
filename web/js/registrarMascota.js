// Valida el registro de la mascota
function validarRegistroMascota(){
    var nombre = document.getElementById("nombre").value;
    var tipo = document.getElementById("tipo").value;
    var comunidad = document.getElementById("comunidad").value;
    var raza = document.getElementById("raza").value;
    var motivo = document.getElementById("motivo").value;
    var perdida = document.getElementById("perdida").value;
    var noPerdida = document.getElementById("noperdida").value;
    var imagen = document.getElementById("imagen-subida").src;
    if(nombre == "" || tipo == "" || comunidad == "" || raza == "" || motivo == ""){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Todos los campos son obligatorios'
        });

        return false;
    }
    if(perdida == "" && noPerdida == ""){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Seleccione una opción'
        });
        return false;
    }
    if(comunidad == ""){
        
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Seleccione una comunidad'
        });

        return false;
    }
    if(/^[0-9]+$/.test(nombre) || /^[0-9]+$/.test(raza)){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'El nombre y la raza no pueden contener numeros'
        });

        return false;
    }
    if (imagen.includes("/assets/fotosPerfil/default.png")) {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Debes subir una imagen'
        });
        return false;
    }
    return true;
}
// Añade un evento al input file para que cuando cambie compruebe que le archivo es menor de 1MB, y el value del input hidden cambie al valor de la imagen en base64.
// Añade un eventlistener submit al formulario para registrar msacota y se valida
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("idFile").addEventListener("change", function (e) {
        var file = e.target.files[0];
        if(e.target.files[0].size > 104857){
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'La imagen no puede ser mayor a 1MB'
            });
            this.value = "";
            return false;
         } else {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById("imagen-subida").src = e.target.result;
                var base64 = document.getElementById("imagen-subida").src;
                var base64Recortada = base64.substring(base64.indexOf(",") + 1);
                document.getElementById("baseImagen").value = base64Recortada;
            }
            reader.readAsDataURL(file);
         }
    });
    document.getElementById("registrarMascota").addEventListener("submit", function (e) {
        if (!validarRegistroMascota()) {
            e.preventDefault();
        }
    });
});