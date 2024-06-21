// Definimos una clase Historia para crear objetos de tipo Historia
class Historia {
    constructor(titulo, descripcion, ultimaFechaActualizacion, autor) {
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.ultimaFechaActualizacion = ultimaFechaActualizacion;
        this.autor = autor;
    }
}

// Función para crear una nueva Historia y añadirla al documento
function crearHistoria() {
    // Obtener valores de los campos del formulario
    const titulo = document.getElementById('titulo').value;
    const descripcion = document.getElementById('descripcion').value;
    const ultimaFechaActualizacion = document.getElementById('ultimaFechaActualizacion').value;
    const autor = document.getElementById('autor').value;

    // Crear una nueva instancia de Historia
    const nuevaHistoria = new Historia(titulo, descripcion, ultimaFechaActualizacion, autor);

    // Mostrar la historia creada en el documento
    const historiasDiv = document.getElementById('historias');
    const historiaElement = document.createElement('div');
    historiaElement.classList.add('historia');

    historiaElement.innerHTML = `
        <h3>${nuevaHistoria.titulo}</h3>
        <p><strong>Descripción:</strong> ${nuevaHistoria.descripcion}</p>
        <p><strong>Última Fecha de Actualización:</strong> ${nuevaHistoria.ultimaFechaActualizacion}</p>
        <p><strong>Autor:</strong> ${nuevaHistoria.autor}</p>
    `;

    historiasDiv.appendChild(historiaElement);

    // Limpiar el formulario
    document.getElementById('historiaForm').reset();
}
