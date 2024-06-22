-- Inserción de dos usuarios en la tabla Usuarios
INSERT INTO Usuarios (Nombre, Apellido, CorreoElectronico, Contraseña, estado, codigo)
VALUES ('Erick', 'Salgado', 'erick.salgado@historiax.com', SHA2('password123', 256), TRUE, 'admin'),
       ('Daniel', 'Gomez', 'daniel.gomez@historiax.com', SHA2('password456', 256), TRUE, 'client'),
       ('Isaac', 'Barcelata', 'isaacjbar@outlook.com', SHA2('pedropedro', 256), TRUE, 'admin');
       -- ('Isaac', 'Barcelata', 'alicia.ramirez@histority.com', SHA2('1105Ali#', 256), TRUE, 'admin')