CREATE DATABASE IF NOT EXISTS historiaInteractiva;
USE historiaInteractiva;

CREATE TABLE IF NOT EXISTS usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    estado BOOLEAN NOT NULL default true,
    codigo VARCHAR(100),
    categoria varchar(100),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS historia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT NOT NULL,
	multimedia VARCHAR(1000),
    descripcion VARCHAR(1000),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) default 'archivada',
    FOREIGN KEY (autor_id) REFERENCES usuario(id)
);

CREATE TABLE IF NOT EXISTS escena (
    id INT AUTO_INCREMENT PRIMARY KEY,
    historia_id INT NOT NULL,
    titulo VARCHAR(60) NOT NULL,
    video VARCHAR(1000),
    audio VARCHAR(1000),
    imagen VARCHAR(1000),
    descripcion VARCHAR(1000),
    es_final BOOLEAN DEFAULT FALSE,
    texto_final VARCHAR(1000),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (historia_id) REFERENCES historia(id)
);

CREATE TABLE IF NOT EXISTS decision (
    id INT AUTO_INCREMENT PRIMARY KEY,
    escena_id INT NOT NULL,
    descripcion VARCHAR(1000),
    escena_destino_id INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (escena_id) REFERENCES escena(id),
    FOREIGN KEY (escena_destino_id) REFERENCES escena(id)
);
-- INSERSIONES --
USE historiaInteractiva;

-- Insertar datos en la tabla usuario
INSERT INTO usuario (nombre, apellido, correo_electronico, contrasena, estado, codigo, categoria) VALUES
('Isaac', 'Jimenez', '20233tn182@utez.edu.mx', SHA2('pedropedro', 256), 1, 'codigo1','administrador'),
('María', 'Gómez', 'maria.gomez@example.com', SHA2('password2', 256), 1, 'codigo2','editor');

-- Historias (Ya con datos de portada)
INSERT INTO historia (titulo, autor_id, multimedia, descripcion) 
VALUES ('Los Casi Algo', 1, 'https://images.ctfassets.net/o65uf8qogksw/5EmziMufd0XHWqlGhKsB8o/e78246920eb651e3e2dda74b0dd56feb/por-que-duelen-tanto-los-casi-algo-int-articulo-1.jpg', 'No eres tu, soy yo'),
('El Bosque Embrujado', 1, 'https://png.pngtree.com/background/20231101/original/pngtree-spooky-landscape-of-a-haunted-forest-3d-illustration-for-halloween-picture-image_5833695.jpg', 'Una historia de terror en un bosque oscuro.'),
('El Misterio del Detective', 1,'https://c0.klipartz.com/pngpicture/375/580/gratis-png-emoji-emoticono-de-tristeza-emoticon-adios.png','Un asesinato por resolver.'),
('El Naufragio', 1, 'https://st2.depositphotos.com/3418487/7119/i/450/depositphotos_71199187-stock-photo-shipwrecks.jpg','Una tragedia en alta mar.');

-- Escena 1
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'La Relación Se Rompe', 'Recibes un mensaje de texto de esa persona especial. Te dice que necesitan hablar. Sabes que algo no está bien.', FALSE, CURRENT_TIMESTAMP);

UPDATE escena SET video = "https://www.youtube.com/embed/bo9Z_pgByQY?si=j4iJqNIP-nvtmqR0" WHERE id = 1;

-- Escena 2
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'La Conversación en Persona', 'Se encuentran en el parque donde solían pasear. Te dice que ya no siente lo mismo y que quiere terminar con esta relación indefinida.', FALSE, CURRENT_TIMESTAMP);

UPDATE escena SET imagen = "https://c0.klipartz.com/pngpicture/375/580/gratis-png-emoji-emoticono-de-tristeza-emoticon-adios.png" WHERE id = 2;
-- Escena 3
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'La Respuesta por Mensaje', 'Decides responder el mensaje. Te dice que ya no siente lo mismo y que quiere terminar con esta relación indefinida.', FALSE, CURRENT_TIMESTAMP);

-- Escena 4
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'La Resignación', 'Aceptas la decisión y te marchas. Pasas días en soledad, reflexionando sobre lo que salió mal.', FALSE, CURRENT_TIMESTAMP);

-- Escena 5
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'El Intento de Convencerle', 'Tratas de convencer a esa persona de que lo intenten una vez más. Sin embargo, está decidida y no cambia de opinión.', FALSE, CURRENT_TIMESTAMP);

-- Escena 6
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'El Apoyo de los Amigos', 'Buscas el apoyo de tus amigos. Ellos te llevan a salir y tratar de distraerte.', FALSE, CURRENT_TIMESTAMP);

-- Escena 7
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'El Refugio en el Trabajo', 'Te sumerges en tu trabajo, tratando de olvidar a esa persona.', FALSE, CURRENT_TIMESTAMP);

-- Escena 8
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'La Insistencia', 'Insistes en intentar salvar la relación, pero la otra persona se molesta y te dice que debes aceptar su decisión.', FALSE, CURRENT_TIMESTAMP);

-- Escena 9
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Conociendo Gente Nueva', 'Conoces a alguien nuevo en una fiesta, pero te das cuenta de que aún no estás listo para otra relación.', FALSE, CURRENT_TIMESTAMP);

-- Escena 10
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Seguir Lamentándote', 'Te sumerges en la tristeza y no haces nada por superar la situación.', FALSE, CURRENT_TIMESTAMP);

-- Escena 11
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Encontrar Satisfacción en el Trabajo', 'Encuentras satisfacción en tu trabajo y empiezas a sentirte mejor contigo mismo.', FALSE, CURRENT_TIMESTAMP);

-- Escena 12
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Sentirse Vacío', 'A pesar de tu dedicación al trabajo, sientes un vacío que no puedes llenar.', FALSE, CURRENT_TIMESTAMP);

-- Escena 13
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Acosar a la Persona', 'Decides no aceptar la situación y empiezas a acosar a la otra persona. Esto solo agrava la situación y terminas perdiendo el contacto definitivamente.', TRUE, CURRENT_TIMESTAMP);

-- Escena 14
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Tomarse Tiempo para Sí Mismo', 'Decides tomarte un tiempo para ti mismo, reflexionas y trabajas en tu crecimiento personal.', FALSE, CURRENT_TIMESTAMP);

-- Escena 15
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Forzar una Nueva Relación', 'Intentas forzar una nueva relación sin estar listo, lo que lleva a más desilusiones y a un nuevo rompimiento.', TRUE, CURRENT_TIMESTAMP);

-- Escena 16
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Buscar Ayuda Profesional', 'Decides buscar ayuda profesional y empiezas a asistir a terapia, lo que te ayuda a superar la situación y crecer emocionalmente.', FALSE, CURRENT_TIMESTAMP);

-- Escena 17
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Quedarse Estancado', 'Te quedas estancado en tu tristeza, incapaz de seguir adelante.', TRUE, CURRENT_TIMESTAMP);

-- Escena 18
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Seguir Enfocado en el Trabajo', 'Continúas enfocándote en el trabajo y alcanzas grandes logros profesionales.', FALSE, CURRENT_TIMESTAMP);

-- Escena 19
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Equilibrar Vida Personal y Laboral', 'Encuentras un equilibrio entre tu vida personal y laboral, y comienzas a disfrutar de ambas.', FALSE, CURRENT_TIMESTAMP);

-- Escena 20
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Buscar Nuevas Actividades', 'Decides buscar nuevas actividades y hobbies, lo que te ayuda a sentirte mejor.', FALSE, CURRENT_TIMESTAMP);

-- Escena 21
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Seguir Sintiendo Vacío', 'Sigues sintiéndote vacío y nada parece llenarte.', TRUE, CURRENT_TIMESTAMP);

-- Escena 22
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Explorar Nuevas Aficiones', 'Encuentras nuevas aficiones que te apasionan y empiezas a sentirte mejor.', FALSE, CURRENT_TIMESTAMP);

-- Escena 23
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Viajar Solo', 'Decides viajar solo, lo que te ayuda a descubrirte a ti mismo y superar la tristeza.', FALSE, CURRENT_TIMESTAMP);

-- Escena 24
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Seguir con la Terapia', 'Continúas con la terapia y sigues creciendo emocionalmente.', FALSE, CURRENT_TIMESTAMP);

-- Escena 25
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Aplicar lo Aprendido en Nuevas Relaciones', 'Empiezas a aplicar lo que has aprendido en terapia en nuevas relaciones y te sientes mejor preparado.', FALSE, CURRENT_TIMESTAMP);

-- Escena 26
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Dejar que el Trabajo Consuma tu Vida', 'Dejas que el trabajo consuma tu vida y pierdes el equilibrio entre tu vida personal y laboral.', TRUE, CURRENT_TIMESTAMP);

-- Escena 27
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Empezar una Nueva Relación', 'Conoces a alguien nuevo y decides iniciar una relación basada en lo que has aprendido y crecido.', TRUE, CURRENT_TIMESTAMP);

-- Escena 28
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Disfrutar de la Soltería', 'Decides disfrutar de la soltería, encontrando paz y felicidad en ti mismo.', TRUE, CURRENT_TIMESTAMP);

-- Escena 29
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Seguir Explorando', 'Sigues explorando nuevas actividades y encuentras muchas cosas que te apasionan.', FALSE, CURRENT_TIMESTAMP);

-- Escena 30
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Compartir con Otros', 'Compartes tus nuevas actividades y aficiones con otras personas y encuentras una comunidad que te apoya.', FALSE, CURRENT_TIMESTAMP);

-- Escena 31
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Compartir Aficiones con Amigos', 'Empiezas a compartir tus nuevas aficiones con tus amigos y fortaleces tus relaciones.', FALSE, CURRENT_TIMESTAMP);

-- Escena 32
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Buscar Comunidad en Línea', 'Encuentras una comunidad en línea con intereses similares y te sientes apoyado y comprendido.', FALSE, CURRENT_TIMESTAMP);

-- Escena 33
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Conocer Gente en el Viaje', 'Conoces gente nueva en tu viaje y haces nuevas amistades que enriquecen tu vida.', FALSE, CURRENT_TIMESTAMP);

-- Escena 34
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Disfrutar del Viaje en Soledad', 'Disfrutas del viaje en soledad, encontrando paz y satisfacción en tu propia compañía.', FALSE, CURRENT_TIMESTAMP);

-- Escena 35
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'Ayudar a Otros', 'Empiezas a ayudar a otros con tus experiencias y encuentras una nueva pasión en el apoyo a los demás.', FALSE, CURRENT_TIMESTAMP);

-- Escena 1 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (1, 'Hablar en persona', 2, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (1, 'Responder por mensaje', 3, CURRENT_TIMESTAMP);

-- Escena 2 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (2, 'Aceptar y marcharse', 4, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (2, 'Tratar de convencerle', 5, CURRENT_TIMESTAMP);

-- Escena 3 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (3, 'Aceptar y marcharse', 4, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (3, 'Tratar de convencerle', 5, CURRENT_TIMESTAMP);

-- Escena 4 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (4, 'Buscar apoyo en amigos', 6, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (4, 'Refugiarse en el trabajo', 7, CURRENT_TIMESTAMP);

-- Escena 5 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (5, 'Aceptar y marcharse', 4, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (5, 'Insistir', 8, CURRENT_TIMESTAMP);

-- Escena 6 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (6, 'Conocer gente nueva', 9, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (6, 'Seguir lamentándote', 10, CURRENT_TIMESTAMP);

-- Escena 7 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (7, 'Encontrar satisfacción en el trabajo', 11, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (7, 'Sentirse vacío', 12, CURRENT_TIMESTAMP);

-- Escena 8 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (8, 'Aceptar y marcharse', 4, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (8, 'Acosarle', 13, CURRENT_TIMESTAMP);

-- Escena 9 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (9, 'Tomarse tiempo para sí mismo', 14, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (9, 'Forzar una nueva relación', 15, CURRENT_TIMESTAMP);

-- Escena 10 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (10, 'Buscar ayuda profesional', 16, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (10, 'Quedarse estancado', 17, CURRENT_TIMESTAMP);

-- Escena 11 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (11, 'Seguir enfocado en el trabajo', 18, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (11, 'Equilibrar vida personal y laboral', 19, CURRENT_TIMESTAMP);

-- Escena 12 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (12, 'Buscar nuevas actividades', 20, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (12, 'Seguir sintiéndote vacío', 21, CURRENT_TIMESTAMP);

-- Escena 14 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (14, 'Explorar nuevas aficiones', 22, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (14, 'Viajar solo', 23, CURRENT_TIMESTAMP);

-- Escena 16 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (16, 'Seguir con la terapia', 24, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (16, 'Aplicar lo aprendido en nuevas relaciones', 25, CURRENT_TIMESTAMP);

-- Escena 18 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (18, 'Buscar equilibrio', 19, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (18, 'Dejar que el trabajo consuma tu vida', 26, CURRENT_TIMESTAMP);

-- Escena 19 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (19, 'Empezar una nueva relación', 27, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (19, 'Disfrutar de la soltería', 28, CURRENT_TIMESTAMP);

-- Escena 20 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (20, 'Seguir explorando', 29, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (20, 'Compartir con otros', 30, CURRENT_TIMESTAMP);

-- Escena 22 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (22, 'Compartir aficiones con amigos', 31, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (22, 'Buscar comunidad en línea', 32, CURRENT_TIMESTAMP);

-- Escena 23 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (23, 'Conocer gente en el viaje', 33, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (23, 'Disfrutar del viaje en soledad', 34, CURRENT_TIMESTAMP);

-- Escena 24 Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (24, 'Aplicar lo aprendido', 25, CURRENT_TIMESTAMP);
INSERT INTO decision (escena_id, descripcion, escena_destino_id, fecha_creacion) VALUES (24, 'Ayudar a otros', 35, CURRENT_TIMESTAMP);

-- EL BOSQUE EMBRUJADO
-- Escenas
INSERT INTO escena (historia_id, titulo, video, audio, imagen, descripcion, es_final, texto_final) VALUES
((SELECT id FROM historia WHERE titulo='El Bosque Embrujado'), 'La entrada al bosque', '', '', 'img/forest_entry.jpg', 'Es una noche oscura y tormentosa...', 0, ''),
((SELECT id FROM historia WHERE titulo='El Bosque Embrujado'), 'El crujido de las hojas', '', '', 'img/forest_crackle.jpg', 'Escuchas el crujido de hojas detrás de ti...', 0, ''),
((SELECT id FROM historia WHERE titulo='El Bosque Embrujado'), 'La tranquilidad del hogar', '', '', 'img/home.jpg', 'Decides no arriesgarte y vuelves a casa.', 1, 'A veces, es mejor no ceder a la curiosidad.');
-- ... más escenas aquí ...

-- Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id) VALUES
((SELECT id FROM escena WHERE titulo='La entrada al bosque' AND historia_id=(SELECT id FROM historia WHERE titulo='El Bosque Embrujado')), 'Entrar al bosque', (SELECT id FROM escena WHERE titulo='El crujido de las hojas' AND historia_id=(SELECT id FROM historia WHERE titulo='El Bosque Embrujado'))),
((SELECT id FROM escena WHERE titulo='La entrada al bosque' AND historia_id=(SELECT id FROM historia WHERE titulo='El Bosque Embrujado')), 'Volver a casa', (SELECT id FROM escena WHERE titulo='La tranquilidad del hogar' AND historia_id=(SELECT id FROM historia WHERE titulo='El Bosque Embrujado')));
-- ... más decisiones aquí ...

-- MISTERIO DEL DETECTIVE
-- Escenas
INSERT INTO escena (historia_id, titulo, video, audio, imagen, descripcion, es_final, texto_final) VALUES
((SELECT id FROM historia WHERE titulo='El Misterio del Detective'), 'La llamada urgente', '', '', 'img/urgent_call.jpg', 'Recibes una llamada urgente sobre un asesinato...', 0, ''),
((SELECT id FROM historia WHERE titulo='El Misterio del Detective'), 'La escena del crimen', '', '', 'img/crime_scene.jpg', 'Llegas a la escena del crimen...', 0, ''),
((SELECT id FROM historia WHERE titulo='El Misterio del Detective'), 'La llamada de auxilio', '', '', 'img/help_call.jpg', 'Envías a tu asistente, pero recibe una llamada de auxilio.', 1, 'A veces, la acción directa es necesaria.');
-- ... más escenas aquí ...

-- Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id) VALUES
((SELECT id FROM escena WHERE titulo='La llamada urgente' AND historia_id=(SELECT id FROM historia WHERE titulo='El Misterio del Detective')), 'Ir a la escena del crimen', (SELECT id FROM escena WHERE titulo='La escena del crimen' AND historia_id=(SELECT id FROM historia WHERE titulo='El Misterio del Detective'))),
((SELECT id FROM escena WHERE titulo='La llamada urgente' AND historia_id=(SELECT id FROM historia WHERE titulo='El Misterio del Detective')), 'Enviar a tu asistente', (SELECT id FROM escena WHERE titulo='La llamada de auxilio' AND historia_id=(SELECT id FROM historia WHERE titulo='El Misterio del Detective')));
-- ... más decisiones aquí ...

-- NAUFRAGIO
-- Escenas
INSERT INTO escena (historia_id, titulo, video, audio, imagen, descripcion, es_final, texto_final) VALUES
((SELECT id FROM historia WHERE titulo='El Naufragio'), 'La tormenta', '', '', 'img/storm.jpg', 'Estás en un barco en medio de una tormenta feroz...', 0, ''),
((SELECT id FROM historia WHERE titulo='El Naufragio'), 'El naufragio', '', '', 'img/shipwreck.jpg', 'La tormenta se intensifica y el barco se hunde.', 0, ''),
((SELECT id FROM historia WHERE titulo='El Naufragio'), 'La isla misteriosa', '', '', 'img/mysterious_island.jpg', 'Encuentras refugio en una isla cercana, pero es un lugar misterioso.', 0, '');
-- ... más escenas aquí ...

-- Decisiones
INSERT INTO decision (escena_id, descripcion, escena_destino_id) VALUES
((SELECT id FROM escena WHERE titulo='La tormenta' AND historia_id=(SELECT id FROM historia WHERE titulo='El Naufragio')), 'Seguir el curso actual', (SELECT id FROM escena WHERE titulo='El naufragio' AND historia_id=(SELECT id FROM historia WHERE titulo='El Naufragio'))),
((SELECT id FROM escena WHERE titulo='La tormenta' AND historia_id=(SELECT id FROM historia WHERE titulo='El Naufragio')), 'Buscar refugio en una isla cercana', (SELECT id FROM escena WHERE titulo='La isla misteriosa' AND historia_id=(SELECT id FROM historia WHERE titulo='El Naufragio')));
-- ... más decisiones aquí ...


