document.addEventListener("DOMContentLoaded", function () {

// Añade un evento change a imagen-subida 
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
});