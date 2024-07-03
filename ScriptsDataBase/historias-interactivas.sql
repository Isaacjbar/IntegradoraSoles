-- Crear la base de datos si no existe y usarla
CREATE DATABASE IF NOT EXISTS historiasinteractivas;
USE historiasinteractivas;

-- Creación de la tabla Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
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

-- Creación de la tabla Historias
CREATE TABLE IF NOT EXISTS Historias (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    AutorID INT NOT NULL,
    FOREIGN KEY (AutorID) REFERENCES Usuarios(ID)
);

-- Creación de la tabla Escenas
CREATE TABLE IF NOT EXISTS Escenas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    HistoriaID INT NOT NULL,
    Titulo VARCHAR(20) NOT NULL,
    Video VARCHAR(1000),
    Audio BLOB,   
    Imagen BLOB,
    Descripcion VARCHAR(1000),
    EsFinal BOOLEAN DEFAULT FALSE,
    TextoFinal VARCHAR(1000),
    FOREIGN KEY (HistoriaID) REFERENCES Historias(ID)
);

-- Creación de la tabla Decisiones
CREATE TABLE IF NOT EXISTS Decisiones (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    EscenaID INT NOT NULL,
    Descripcion VARCHAR(1000),
    EscenaDestinoID INT,
    FOREIGN KEY (EscenaID) REFERENCES Escenas(ID),
    FOREIGN KEY (EscenaDestinoID) REFERENCES Escenas(ID)
);

-- Creación de la tabla EstadosPublicacion
CREATE TABLE IF NOT EXISTS EstadosPublicacion (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    HistoriaID INT NOT NULL,
    Estado VARCHAR(20) NOT NULL, -- 'Publicado', 'Oculto', etc.
    FechaCambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (HistoriaID) REFERENCES Historias(ID)
);
