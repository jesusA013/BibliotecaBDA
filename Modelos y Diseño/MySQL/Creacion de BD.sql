CREATE DATABASE IF NOT EXISTS bibliotecabda;

CREATE TABLE Estudiante (
    id_estudiante INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50) NULL,
    matricula VARCHAR(10) UNIQUE NOT NULL,
    numero_telefono VARCHAR(10),
    correo_electronico VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Perfil (
    id_perfil INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    contraseña VARCHAR(50) NOT NULL,
    id_estudiante INT UNIQUE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante) 
);

CREATE TABLE Libro (
    id_libro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    editorial VARCHAR(100),
    no_copias_disponibles INT NOT NULL
);

CREATE TABLE Copia (
    id_copia INT PRIMARY KEY AUTO_INCREMENT,
    estado ENUM('disponible', 'reservado', 'prestado') NOT NULL,
    id_libro INT NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);

CREATE TABLE Reserva (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_estudiante INT NOT NULL,
    fecha_hora_inicio DATETIME NOT NULL,
    fecha_hora_limite DATETIME NOT NULL,
    fecha_hora_recoleccion DATETIME NULL,
    fecha_hora_entrega DATETIME NULL,
    estado ENUM('activa', 'cancelada', 'en curso', 'completada') NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante)
);

CREATE TABLE Reserva_Copia (
    id_reserva_copia INT PRIMARY KEY AUTO_INCREMENT,
    id_reserva INT NOT NULL,
    id_copia INT NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
    FOREIGN KEY (id_copia) REFERENCES Copia(id_copia) 
);
