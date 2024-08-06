document.addEventListener('DOMContentLoaded', function() {
    console.log('Document is ready');

    document.querySelectorAll('.card-normal').forEach(card => {
        card.addEventListener('click', function(event) {
            console.log('Card clicked:', card);
            const target = event.target;
            // Asegurarnos de que el click no es en un botón o formulario
            if (!target.classList.contains('btn') && !target.closest('form')) {
                const id = card.dataset.id;
                console.log('Navigating to story with id:', id);
                window.open(window.location.origin + '/Login_war/historia?id_his=' + id + '&nu=' + encodeURIComponent(contrasenaCifrada), '_blank');
            } else {
                console.log('Click was on a button or form, not navigating');
            }
        });
    });

    document.querySelectorAll('.btn-publicar').forEach(button => {
        button.addEventListener('click', function(event) {
            event.preventDefault();
            console.log('Publish button clicked:', button);
            const id = this.dataset.id;
            const accion = this.dataset.accion;
            console.log('Publishing action:', accion, 'for story id:', id);

            const form = document.createElement('form');
            form.method = 'post';
            form.action = 'estadoPublicacion';

            const inputId = document.createElement('input');
            inputId.type = 'hidden';
            inputId.name = 'id';
            inputId.value = id;
            form.appendChild(inputId);

            const inputAccion = document.createElement('input');
            inputAccion.type = 'hidden';
            inputAccion.name = 'accion';
            inputAccion.value = accion;
            form.appendChild(inputAccion);

            document.body.appendChild(form);
            form.submit();

            console.log('Form submitted:', form);

            const nuevoEstado = accion === 'publicar' ? 'publicada' : 'archivada';
            const nuevaAccion = accion === 'publicar' ? 'archivar' : 'publicar';
            const nuevoTexto = accion === 'publicar' ? 'Archivar' : 'Publicar';

            button.dataset.accion = nuevaAccion;
            button.innerText = nuevoTexto;
            form.remove();
        });
    });

    // Manejar la búsqueda
    const searchForm = document.getElementById('searchForm');
    const searchInput = document.getElementById('searchInput');

    searchForm.addEventListener('submit', function(event) {
        event.preventDefault();
        console.log('Search form submitted');

        const titulo = searchInput.value.trim();
        console.log('Search input value:', titulo);

        if (titulo === '') {
            console.log('Search input is empty, reloading page');
            window.location.reload(); // Recargar la página si el campo de búsqueda está vacío
            return;
        }

        fetch(`buscarHistoriaServlet?titulo=${encodeURIComponent(titulo)}`)
            .then(response => response.json())
            .then(data => {
                console.log('Search results:', data);
                if (data.error) {
                    Swal.fire({
                        title: "Error",
                        text: data.error,
                        icon: "error",
                        confirmButtonText: "Ok",
                        confirmButtonColor: "#DC3545"
                    });
                } else if (data.mensaje) {
                    Swal.fire({
                        title: "No encontrado",
                        text: data.mensaje,
                        icon: "warning",
                        confirmButtonText: "Ok",
                        confirmButtonColor: "#0B6490"
                    });
                } else {
                    // Mostrar las historias encontradas
                    const contenedorPrincipalCard = document.getElementById('contenedorPrincipalCard');
                    contenedorPrincipalCard.innerHTML = ''; // Limpiar el contenedor
                    data.forEach(historia => {
                        contenedorPrincipalCard.innerHTML += `
                            <div class="col">
                                <div class="card shadow-sm card-normal" data-id="${historia.id}">
                                    <div class="embed-responsive mb-3 mx-auto">
                                        <img src="${historia.multimedia}" class="embed-responsive-item img_d_card" alt="previsualizaciónHistoria">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card_title">${historia.titulo}</h5>
                                        <p class="card-text">${historia.descripcion}</p>
                                        <div class="d-flex flex-column items-card-container">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-outline-secondary btn-editar" onclick="window.location.href='gestionHistoria.jsp?id_his=${historia.id}'">Editar</button>
                                                <button type="button" class="btn btn-sm btn-outline-secondary btn-copiar" onclick="copiarEnlace('${historia.id}')">Copiar enlace</button>
                                                <form method="post" action="estadoPublicacion" style="display: inline;">
                                                    <input type="hidden" name="id" value="${historia.id}">
                                                    <input type="hidden" name="accion" value="${historia.estado === 'publicada' ? 'archivar' : 'publicar'}">
                                                    <button id="btn-pub-despub" type="submit" class="btn btn-sm btn-outline-secondary ${historia.estado === 'publicada' ? 'btn-archivar' : 'btn-publicar'}" data-id="${historia.id}" data-accion="${historia.estado === 'publicada' ? 'archivar' : 'publicar'}">
                                                        ${historia.estado === 'publicada' ? 'Archivar' : 'Publicar'}
                                                    </button>
                                                </form>
                                            </div>
                                            <button id="editar-portada-btn" type="button" class="btn btn-sm btn-outline-secondary w-75 mt-1 mb-4 mx-auto" onclick="window.location.href='editarPortada.jsp?id_his=${historia.id}'">Editar Portada</button>
                                            <small class="text-body-secondary mt-2"><span class="ultima-mod">Últm. mod:</span> ${historia.fechaCreacion}</small>
                                            <div><strong>Estado: </strong><span class="${historia.estado === 'publicada' ? 'estado-publicada' : 'estado-archivada'}">${historia.estado}</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        `;
                    });
                }
            })
            .catch(error => {
                console.error('Error:', error);
                Swal.fire({
                    title: "Error",
                    text: "Hubo un problema al realizar la búsqueda",
                    icon: "error",
                    confirmButtonText: "Ok",
                    confirmButtonColor: "#DC3545"
                });
            });
    });
});

function copiarEnlace(id) {
    console.log('Copy link clicked for story id:', id);
    const enlace = window.location.origin + '/Login_war/historia?id_his=' + id;
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
                console.log('Link copied to clipboard');
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
