document.addEventListener('DOMContentLoaded', function() {
    console.log('Document is ready');

    document.querySelectorAll('.card-normal').forEach(card => {
        card.addEventListener('click', function(event) {
            console.log('Card clicked:', card);
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
                    // Mostrar las historias encontradas
                    const contenedorPrincipalCard = document.getElementById('contenedorPrincipalCard');
                    contenedorPrincipalCard.innerHTML = ''; // Limpiar el contenedor
                    data.forEach(historia => {
                        const estadoBtn = historia.estado === 'archivada' ?
                            `<button class="btn btn-sm btn-outline-secondary btn-publicar" data-id="${historia.id}" data-accion="publicar" title="Publicar historia">Publicar</button>` :
                            `<button class="btn btn-sm btn-outline-secondary btn-archivar" data-id="${historia.id}" data-accion="archivar" title="Archivar historia">Archivar</button>`;

                        contenedorPrincipalCard.innerHTML += `
                        <div class="col">
                            <div class="card shadow-sm card-normal" data-id="${historia.id}">
                                <div class="embed-responsive mb-3 mx-auto">
                                    <img src="${historia.multimedia ? historia.multimedia : 'img/notFound.png'}" class="embed-responsive-item img_d_card" alt="previsualizaciónHistoria" onerror="this.src='img/notFound.png';">
                                </div>
                                <div class="card-body">
                                    <h5 class="card_title">${historia.titulo}</h5>
                                    <p class="card-text">${historia.descripcion}</p>
                                    <div class="d-flex flex-column items-card-container">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-sm btn-outline-secondary btn-editar" onclick="window.location.href='gestionHistoria.jsp?id_his=${historia.id}'">Editar</button>
                                            <button type="button" class="btn btn-sm btn-outline-secondary btn-copiar" onclick="copiarEnlace('${historia.id}')">Copiar enlace</button>
                                            ${estadoBtn}
                                        </div>
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
