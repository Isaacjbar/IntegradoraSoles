function copiarEnlace(id) {
    const enlace = window.location.origin + '/historia?id_his=' + id;
    Swal.fire({
        title: 'Copiar enlace',
        html: '<input type="text" id="enlaceInput" class="swal2-input" value="' + enlace + '" readonly style="width: 80%;">',
        showCancelButton: true,
        confirmButtonText: 'Copiar',
        cancelButtonText: 'Cancelar',
        confirmButtonColor: "#0B6490",
        cancelButtonColor: "#DC3545",
        didOpen: () => {
            const input = Swal.getPopup().querySelector('#enlaceInput');
            input.focus();
            input.select();
        }
    }).then((result) => {
        if (result.isConfirmed) {
            const input = Swal.getPopup().querySelector('#enlaceInput');
            navigator.clipboard.writeText(input.value).then(() => {
                Swal.fire({
                    title: "Copiado!",
                    text: "El enlace ha sido copiado al portapapeles.",
                    imageUrl: "img/copiar-link.png",
                    imageWidth: "150px",
                    confirmButtonText: "Ok",
                    timer: 5000,
                    confirmButtonColor: "#0B6490"
                });
            }).catch(err => {
                console.error('Error al copiar el texto: ', err);
            });
        }
    });
}

document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.card-normal').forEach(card => {
        card.addEventListener('click', (event) => {
            if (!event.target.classList.contains('btn-editar') && !event.target.classList.contains('btn-copiar') && !event.target.classList.contains('btn-publicar')) {
                window.location.href = 'historia?id_his=' + card.dataset.id;
            }
        });
    });
});