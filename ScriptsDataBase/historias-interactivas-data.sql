-- INSERSIONES --
USE historiaInteractiva;

-- Insertar datos en la tabla usuario
INSERT INTO usuario (nombre, apellido, correo_electronico, contrasena, estado, codigo) VALUES
('Isaac', 'Jimenez', '20233tn182@utez.edu.mx', SHA2('pedropedro', 256), 1, 'codigo1'),
('María', 'Gómez', 'maria.gomez@example.com', SHA2('password2', 256), 1, 'codigo2'),
('Carlos', 'López', 'carlos.lopez@example.com', SHA2('password3', 256), 1, 'codigo3'),
('Ana', 'Martínez', 'ana.martinez@example.com', SHA2('password4', 256), 1, 'codigo4'),
('Luis', 'García', 'luis.gusuarioarcia@example.com', SHA2('password5', 256), 1, 'codigo5'),
('Elena', 'Rodríguez', 'elena.rodriguez@example.com', SHA2('password6', 256), 1, 'codigo6'),
('Pedro', 'Fernández', 'pedro.fernandez@example.com', SHA2('password7', 256), 1, 'codigo7'),
('Sofía', 'Torres', 'sofia.torres@example.com', SHA2('password8', 256), 1, 'codigo8'),
('Jorge', 'Sánchez', 'jorge.sanchez@example.com', SHA2('password9', 256), 1, 'codigo9'),
('Marta', 'Ramírez', 'marta.ramirez@example.com', SHA2('password10', 256), 1, 'codigo10'),
('Alberto', 'Flores', 'alberto.flores@example.com', SHA2('password11', 256), 1, 'codigo11'),
('Lucía', 'Hernández', 'lucia.hernandez@example.com', SHA2('password12', 256), 1, 'codigo12'),
('David', 'Jiménez', 'david.jimenez@example.com', SHA2('password13', 256), 1, 'codigo13'),
('Paula', 'Díaz', 'paula.diaz@example.com', SHA2('password14', 256), 1, 'codigo14'),
('Manuel', 'Vargas', 'manuel.vargas@example.com', SHA2('password15', 256), 1, 'codigo15');

-- Prueba Historia
INSERT INTO historia (titulo, autor_id, fecha_creacion) VALUES ('Los Casi Algo', 1, CURRENT_TIMESTAMP);

-- Escena 1
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'La Relación Se Rompe', 'Recibes un mensaje de texto de esa persona especial. Te dice que necesitan hablar. Sabes que algo no está bien.', FALSE, CURRENT_TIMESTAMP);

-- Escena 2
INSERT INTO escena (historia_id, titulo, descripcion, es_final, fecha_creacion)
VALUES (1, 'La Conversación en Persona', 'Se encuentran en el parque donde solían pasear. Te dice que ya no siente lo mismo y que quiere terminar con esta relación indefinida.', FALSE, CURRENT_TIMESTAMP);

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

