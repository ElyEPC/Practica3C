-- *** 1. CREAR TABLA DEPARTAMENTOS ***
CREATE TABLE departamentos (
    id_departamento SERIAL PRIMARY KEY,
    descripcion VARCHAR(100) UNIQUE NOT NULL
);

-- *** 2. CREAR TABLA USUARIOS (CON RELACIÓN 1:N AL DEPARTAMENTO) ***
CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(255) UNIQUE,
    telefono VARCHAR(15),
    fecha_nacimiento DATE,
    -- Columna para la relación 1:N
    id_departamento INTEGER NOT NULL,
    -- Definición de la clave foránea
    FOREIGN KEY (id_departamento) REFERENCES departamentos (id_departamento)
);

-- *** 3. CREAR TABLA CREDENCIALES ***
CREATE TABLE credenciales (
    id_credencial SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);