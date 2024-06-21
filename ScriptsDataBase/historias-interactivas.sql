-- Crear la base de datos si no existe y usarla
CREATE DATABASE IF NOT EXISTS historiasinteractivas;
USE historiasinteractivas;

-- Creación de la tabla Usuarios
CREATE TABLE Usuarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    CorreoElectronico VARCHAR(100) UNIQUE NOT NULL,
    Contraseña VARCHAR(100),
    estado BOOLEAN NOT NULL,
    codigo VARCHAR(100),
    FechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Escenas (
    EscenaID VARCHAR(100) PRIMARY KEY,
    Contenido TEXT,
    WayOne TEXT,
    WayTwo TEXT
);

-- Inserción de dos usuarios en la tabla Usuarios
INSERT INTO Usuarios (Nombre, Apellido, FechaNacimiento, CorreoElectronico, Contraseña, estado, codigo)
VALUES ('Juan', 'Pérez', '1990-05-15', 'juan.perez@example.com', SHA2('password123', 256), TRUE, 'codigo1'),
       ('María', 'González', '1985-10-20', 'maria.gonzalez@example.com', SHA2('password456', 256), TRUE, 'codigo2');

INSERT INTO Usuarios (Nombre, Apellido, FechaNacimiento, CorreoElectronico, Contraseña, estado, codigo)
VALUES ('Isaac', 'Barcelata', '2000-02-08', 'isaacjbar@outlook.com', SHA2('pedropedro', 256), TRUE, 'codigo1');

