
    const userIcon = document.getElementById('user-icon');
    const userInfoContainer = document.getElementById('user-info-container');
    const closeInfoContainer = document.getElementById('close-info-container');

    // Mostrar/Ocultar menú dinámico
    userIcon.addEventListener('click', (event) => {
        event.stopPropagation(); // Prevenir que el evento se propague y cierre el menú inmediatamente
        const isVisible = userInfoContainer.style.display === 'flex';
        userInfoContainer.style.display = isVisible ? 'none' : 'flex';
    });

    closeInfoContainer.addEventListener('click', (event) => {
        event.stopPropagation(); // Prevenir que el evento se propague y vuelva a abrir el menú
        userInfoContainer.style.display = 'none';
    });

    // Ocultar menú si se hace clic fuera de él
    window.addEventListener('click', (event) => {
        if (!userInfoContainer.contains(event.target) && event.target !== userIcon) {
            userInfoContainer.style.display = 'none';
        }
    });