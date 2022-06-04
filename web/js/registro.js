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
        alert("Todos los campos son obligatorios");
        return false;
    } else if (pwd != repetirPwd) {
        alert("Las contraseñas no coinciden");
        return false;
    } else if (!pwd.match(regExpPwd)) {
        alert("La contraseña debe tener al menos 8 caracteres, una letra y un numero");
        return false;
    } else if (!email.match(regExpEmail)) {
        alert("El email no es correcto");
        return false;
    } else if (!dni.match(regExpDNI)) {
        alert("El DNI no es correcto");
        return false;
    }
    return true;
}

document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("registro").addEventListener("submit", function (e) {
        if (!validarRegistro()) {
            e.preventDefault();
        }
    });
});
