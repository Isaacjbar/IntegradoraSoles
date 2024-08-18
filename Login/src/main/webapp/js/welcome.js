function initializeTooltips() {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
}

document.addEventListener('DOMContentLoaded', function() {
    console.log('Document is ready');
    initializeTooltips();

    document.querySelectorAll('.card-normal').forEach(card => {
        card.addEventListener('click', function(event) {
            console.log('Card clicked:', card);
            initializeTooltips();
            const target = event.target;

            // Evitar la redirección si el clic ocurre en un botón, un elemento dentro de un formulario, un enlace, o un SVG
            if (!target.classList.contains('btn') &&
                !target.closest('form') &&
                !target.closest('button') &&
                !target.closest('a') &&
                target.tagName !== 'BUTTON' &&
                target.tagName !== 'A' &&
                target.tagName !== 'SVG' &&
                target.tagName !== 'PATH') {

                const id = card.dataset.id;
                console.log('Navigating to story with id:', id);

                // Obtener la ruta base de la aplicación de manera dinámica
                const rutaBase = window.location.origin + window.location.pathname.split('/').slice(0, -1).join('/');

                // Construir la URL completa de manera dinámica
                const url = rutaBase + '/historia?id_his=' + id + '&nu=' + encodeURIComponent(contrasenaCifrada);

                // Abrir la URL en una nueva pestaña
                window.open(url, '_blank');
            } else {
                console.log('Click was on a button, form, link, or SVG, not navigating');
            }
        });
    });

    document.querySelectorAll('.btn-publicar, .btn-archivar').forEach(button => {
        button.addEventListener('click', function(event) {
            event.preventDefault();
            event.stopPropagation();
            console.log('Publish/Archive button clicked:', button);
            const id = this.dataset.id;
            const accion = this.dataset.accion;
            console.log('Action:', accion, 'for story id:', id);

            // Verificar si el ID es undefined o no válido
            if (!id || id === "undefined") {
                console.error('Error: El ID de la historia es undefined o no válido.');
                return; // Detener la ejecución si el ID no es válido
            }

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
                    // Mostrar las historias encontradas en el nuevo diseño
                    const contenedorPrincipalCard = document.getElementById('contenedorPrincipalCard');
                    contenedorPrincipalCard.innerHTML = ''; // Limpiar el contenedor

                    data.forEach(historia => {
                        const multimedia = historia.multimedia ? historia.multimedia : 'img/notFound.png';
                        const estado = historia.estado;
                        const estadoBtn = estado === 'archivada' ?
                            `<button id="btn-publicar-escena" class="btn-publicar" data-id="${historia.id}" data-accion="publicar" data-bs-toggle="tooltip" data-bs-placement="top" title="Publicar Historia">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-file-earmark-arrow-up" viewBox="0 0 16 16">
                                <path d="M8.5 11.5a.5.5 0 0 1-1 0V7.707L6.354 8.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 7.707z"></path>
                                <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"></path>
                            </svg>
                        </button>` :
                            `<button id="btn-archivar-escena" class="btn-archivar" data-id="${historia.id}" data-accion="archivar" data-bs-toggle="tooltip" data-bs-placement="top" title="Archivar Historia">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-down-square" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm8.5 2.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293z"></path>
                            </svg>
                        </button>`;

                        contenedorPrincipalCard.innerHTML += `
                    <div class="col">
                        <div class="card shadow-sm card-normal" data-id="${historia.id}">
                            <div class="embed-responsive mb-3 mx-auto">
                                <img src="${multimedia}" class="embed-responsive-item img_d_card" alt="previsualizaciónHistoria" onerror="this.src='img/notFound.png';">
                            </div>

                            <div class="card-body">
                                <h5 class="card_title">${historia.titulo}</h5>
                                <p class="card-text">${historia.descripcion}</p>
                                <div class="d-flex flex-column items-card-container">
                                    <div class="card-icons">
                                        <button id="btn-editar-portada" data-bs-toggle="tooltip" data-bs-placement="top" title="Editar portada" onclick="window.location.href='editarPortada.jsp?id_his=${historia.id}'">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-journal-richtext" viewBox="0 0 16 16">
                                                <path d="M7.5 3.75a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0m-.861 1.542 1.33.886 1.854-1.855a.25.25 0 0 1 .289-.047L11 4.75V7a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 7v-.5s1.54-1.274 1.639-1.208M5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5"></path>
                                                <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2"></path>
                                                <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z"></path>
                                            </svg>
                                        </button>
                                        <button id="btn-editar-escenas" data-bs-toggle="tooltip" data-bs-placement="top" title="Editar escenas" onclick="window.location.href='gestionHistoria.jsp?id_his=${historia.id}'">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
                                                <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001m-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708z"></path>
                                            </svg>
                                        </button>
                                        <button id="btn-copiar-enlace" data-bs-toggle="tooltip" data-bs-placement="top" title="Copiar enlace" onclick="copiarEnlace('${historia.id}')">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-copy" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd" d="M4 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 5a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-1h1v1a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h1v1z"></path>
                                            </svg>
                                        </button>
                                        ${estadoBtn}
                                    </div>

                                    <small class="text-body-secondary mt-2"><span class="ultima-mod">Últm. mod:</span> ${historia.fechaCreacion}</small>
                                    <div><strong>Estado: </strong><span class="${estado === 'publicada' ? 'estado-publicada' : 'estado-archivada'}">${estado}</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    `;
                    });
                }
                initializeTooltips();
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

// Función dedicada a generar enlaces
function copiarEnlace(id) {
    console.log('Copy link clicked for story id:', id);

    // Obtener la ruta base de la aplicación de manera dinámica
    const rutaBase = window.location.origin + window.location.pathname.split('/').slice(0, -1).join('/');

    // Concatenar la ruta base con el segmento estático y el id
    const enlace = rutaBase + '/historia?id_his=' + id;

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
            try {
                // Método antiguo usando document.execCommand
                input.select();
                document.execCommand('copy');
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
            } catch (err) {
                console.error('Error al copiar el texto: ', err);
            }
        }
    });
}
