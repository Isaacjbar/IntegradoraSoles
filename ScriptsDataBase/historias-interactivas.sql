CREATE DATABASE IF NOT EXISTS historiaInteractiva;
USE historiaInteractiva;

CREATE TABLE IF NOT EXISTS usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    estado BOOLEAN NOT NULL,
    codigo VARCHAR(100),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS historia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (autor_id) REFERENCES usuario(id)
);

CREATE TABLE IF NOT EXISTS escena (
    id INT AUTO_INCREMENT PRIMARY KEY,
    historia_id INT NOT NULL,
    titulo VARCHAR(40) NOT NULL,
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

CREATE TABLE IF NOT EXISTS estado_publicacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    historia_id INT NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (historia_id) REFERENCES historia(id)
);
