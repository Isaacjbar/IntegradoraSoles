-- Crear la base de datos si no existe y usarla
CREATE DATABASE IF NOT EXISTS historiasinteractivas;
USE historiasinteractivas;

-- Creación de la tabla Usuarios
CREATE TABLE IF NOT exists Usuarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100) UNIQUE NOT NULL,
    Contraseña VARCHAR(100),
    estado BOOLEAN NOT NULL,
    codigo VARCHAR(100),
    -- Administrador = admin, Cliente = client
    FechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT exists Escenas (
    EscenaID VARCHAR(100) PRIMARY KEY,
    Contenido TEXT,
    WayOne TEXT,
    WayTwo TEXT
);

-- A la base completa hace falta por agregar y adaptar lo siguiente 
-- Creación de la tabla Escenas
CREATE TABLE IF NOT exists Escenas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    HistoriaID INT NOT NULL,
    NumeroEscena INT NOT NULL,
    Titulo VARCHAR(20) NOT NULL,
    Video BLOB,
    Audio BLOB,
    Imagen BLOB,
    EsFinal BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (HistoriaID) REFERENCES Historias(ID)
);

-- Creación de la tabla Decisiones
CREATE TABLE IF NOT exists Decisiones (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    EscenaID INT NOT NULL,
    Descripcion VARCHAR(1000),
    EscenaDestinoID INT,
    FOREIGN KEY (EscenaID) REFERENCES Escenas(ID),
    FOREIGN KEY (EscenaDestinoID) REFERENCES Escenas(ID)
);

-- Creación de la tabla EstadosPublicacion
CREATE TABLE IF NOT exists EstadosPublicacion (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    HistoriaID INT NOT NULL,
    Estado VARCHAR(20) NOT NULL, -- 'Publicado', 'Oculto', etc.
    FechaCambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (HistoriaID) REFERENCES Historias(ID)
);
