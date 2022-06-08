// Valida el registro del usuario
function validarRegistro() {
    var nombre = document.getElementById("nombre").value;
    var pwd = document.getElementById("pwd").value;
    var repetirPwd = document.getElementById("repetir-pwd").value;
    var email = document.getElementById("email").value;
    var telefono = document.getElementById("tlf").value;
    var dni = document.getElementById("dni").value;
    var regExpPwd = /^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$/;
    var regExpEmail = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    var regExpDNI = /^\d{8}[a-zA-Z]$/;

    if (nombre == "" || pwd == "" || repetirPwd == "" || email == "" || telefono == "" || dni == "") {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Todos los campos son obligatorios'
        });
        return false;
    } else if (pwd != repetirPwd) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Las contraseñas no coinciden'
        });
        return false;
    } else if (!pwd.match(regExpPwd)) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'La contraseña debe tener entre 8 y 16 caracteres, al menos una mayúscula, al menos una minúscula y al menos un número'
        });
        return false;
    } else if (!email.match(regExpEmail)) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'El email no es válido'
        });
        return false;
    } else if (telefono.length != 9) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'El teléfono debe tener 9 dígitos'
        });
        return false;
    }

    if (!dni.match(regExpDNI)) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'El DNI no es válido'
        });
        return false;
    } else {
        var letraDNI = dni.substring(dni.length - 1);
        var letras = "TRWAGMYFPDXBNJZSQVHLCKE";
        var numero = dni.substring(0, dni.length - 1);
        var modulo = numero % 23;
        var letra = letras.substring(modulo, modulo + 1);
        if (letraDNI != letra) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'La letra del DNI no es correcta'
            });
            return false;
        }
    }
    $.ajax({
        url: "http://localhost/apiAdopta.io/buscarCorreo.php?correo=" + email,
        type: "GET",
        dataType: "json",
        success: function (data) {
            // Saca por un alert la respuesta
            if (data.respuesta[0].confirmacion == "existe") {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'El email ya existe'
                });
                return false;
            }
        }
    });
    return true;
}

// 
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("registro").addEventListener("submit", function (e) {
        if (!validarRegistro()) {
            e.preventDefault();
        }
    });
});
