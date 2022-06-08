// Realiza la validación del formulario del artículo
function validarRegistroArticulo() {
    var nombre = document.getElementById("nombre").value;
    var descripcion = document.getElementById("descripcion").value;
    var precio = document.getElementById("precio").value;
    var imagen = document.getElementById("imagen-subida").src;
    console.log(imagen);
    if (nombre == "" || descripcion == "" || precio == "") {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Todos los campos son obligatorios'
        });
        return false;
    }
    if (precio < 0) {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'El precio no puede ser negativo'
        });
        return false;
    }
       
    if (precio.match(/[a-zA-Z]/)) {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'El precio no puede contener letras'
        });
        return false;
    }

    if (nombre.length < 3) {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'El nombre debe tener al menos 3 letras'
        });
        return false;
    }
    if (/^[0-9]+$/.test(nombre)) {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'El nombre no puede contener números'
        });
        return false;
    }
    if (/^[0-9]+$/.test(descripcion)) {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'La descripcion no puede contener números'
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
// Añade un evento al input idFile para comprobar que no sea mayor de 1MB y para cambiar el valor del input hidden a la base64 de la imagen
// Añade otro evento a precio para que cambie las , por .
// Añade un evento al submit para que solo se ejecute si es que todo esta bien validado
document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("idFile").addEventListener("change", function (e) {
            var file = e.target.files[0];
            if(e.target.files[0].size > 104857){
                alert("El archivo es demasiado grande");
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
        document.getElementById("precio").addEventListener("keyup", function (e) {
            var precio = document.getElementById("precio").value;
            if (precio.indexOf(",") != -1) {
                precio = precio.replace(",", ".");
                document.getElementById("precio").value = precio;
            }
        });
        document.getElementById("registroArticulo").addEventListener("submit", function (e) {
            if (!validarRegistroArticulo()) {
                e.preventDefault();
            }
        });
    });