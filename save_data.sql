-- A. INSERCIÓN DE DEPARTAMENTOS
INSERT INTO departamentos (descripcion) VALUES
('Recursos Humanos'),       -- ID 1
('Desarrollo de Software'), -- ID 2
('Ventas y Marketing'),     -- ID 3
('Finanzas y Contabilidad'),-- ID 4
('Soporte Técnico');        -- ID 5


-- B. INSERCIÓN DE USUARIOS CON SU DEPARTAMENTO ASIGNADO
-- La asignación de id_departamento debe coincidir con los IDs anteriores (1 a 5).
INSERT INTO usuarios (nombre, correo, telefono, fecha_nacimiento, id_departamento) VALUES
-- ID 1: Desarrollo
('Juan Pérez', 'juan.perez1@example.com', '1234567890', '1985-01-15', 2),
-- ID 2: Desarrollo
('Ana Gómez', 'ana.gomez2@example.com', '1234567891', '1990-03-22', 2),
-- ID 3: Ventas
('Luis Martínez', 'luis.martinez3@example.com', '1234567892', '1988-07-10', 3),
-- ID 4: Ventas
('María López', 'maria.lopez4@example.com', '1234567893', '1992-11-05', 3),
-- ID 5: Finanzas
('Carlos Ruiz', 'carlos.ruiz5@example.com', '1234567894', '1980-06-25', 4),
-- ID 6: RH
('Sofía Castro', 'sofia.castro6@example.com', '1234567895', '1995-02-18', 1),
-- ID 7: Desarrollo
('David Ramírez', 'david.ramirez7@example.com', '1234567896', '1983-09-09', 2),
-- ID 8: Ventas
('Elena Ortega', 'elena.ortega8@example.com', '1234567897', '1991-05-03', 3),
-- ID 9: Soporte
('Miguel Torres', 'miguel.torres9@example.com', '1234567898', '1993-12-14', 5),
-- ID 10: Finanzas
('Laura Sánchez', 'laura.sanchez10@example.com', '1234567899', '1987-08-01', 4),
-- ID 11: RH
('Pedro Morales', 'pedro.morales11@example.com', '1234567800', '1986-04-17', 1),
-- ID 12: Desarrollo
('Clara Hernández', 'clara.hernandez12@example.com', '1234567801', '1994-06-30', 2),
-- ID 13: Ventas
('Jorge Rojas', 'jorge.rojas13@example.com', '1234567802', '1981-03-25', 3),
-- ID 14: Soporte
('Valeria Peña', 'valeria.pena14@example.com', '1234567803', '1992-01-09', 5),
-- ID 15: Finanzas
('Andrés Romero', 'andres.romero15@example.com', '1234567804', '1989-10-12', 4),
-- ID 16: Soporte
('Camila Paredes', 'camila.paredes16@example.com', '1234567805', '1997-11-19', 5),
-- ID 17: Desarrollo
('Ricardo Vargas', 'ricardo.vargas17@example.com', '1234567806', '1984-07-23', 2),
-- ID 18: Ventas
('Daniela Flores', 'daniela.flores18@example.com', '1234567807', '1996-03-01', 3),
-- ID 19: Soporte
('Héctor Serrano', 'hector.serrano19@example.com', '1234567808', '1982-02-11', 5),
-- ID 20: RH
('Patricia Vega', 'patricia.vega20@example.com', '1234567809', '1990-09-05', 1);


-- C. INSERCIÓN DE CREDENCIALES (relacionadas por id_usuario 1 al 20)
INSERT INTO credenciales (id_usuario, username, password_hash) VALUES 
(1, 'juan.perez1', 'hash_juan_perez'), 
(2, 'ana.gomez2', 'hash_ana_gomez'), 
(3, 'luis.martinez3', 'hash_luis_martinez'), 
(4, 'maria.lopez4', 'hash_maria.lopez'), 
(5, 'carlos.ruiz5', 'hash_carlos.ruiz'), 
(6, 'sofia.castro6', 'hash_sofia.castro'), 
(7, 'david.ramirez7', 'hash_david.ramirez'), 
(8, 'elena.ortega8', 'hash_elena.ortega'), 
(9, 'miguel.torres9', 'hash_miguel.torres'), 
(10, 'laura.sanchez10', 'hash_laura.sanchez'), 
(11, 'pedro.morales11', 'hash_pedro.morales'), 
(12, 'clara.hernandez12', 'hash_clara.hernandez'), 
(13, 'jorge.rojas13', 'hash_jorge.rojas'), 
(14, 'valeria.pena14', 'hash_valeria.pena'), 
(15, 'andres.romero15', 'hash_andres.romero'), 
(16, 'camila.paredes16', 'hash_camila.paredes'), 
(17, 'ricardo.vargas17', 'hash_ricardo.vargas'), 
(18, 'daniela.flores18', 'hash_daniela.flores'), 
(19, 'hector.serrano19', 'hash_hector.serrano'), 
(20, 'patricia.vega20', 'hash_patricia.vega');