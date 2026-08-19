
USE clinica;

INSERT INTO medico (documento, nombre, apellidos, especialidad, tipo) VALUES
('1091234561', 'Carlos Andrés',   'Gómez Pérez',     'Medicina General', 'titular'),
('1091234562', 'Laura Patricia',  'Rodríguez Díaz',  'Pediatría',        'titular'),
('1091234563', 'Jorge Iván',      'Martínez López',  'Cardiología',      'titular'),
('1091234564', 'Ana María',       'Torres Rueda',    'Medicina General', 'interino'),
('1091234565', 'Sergio Andrés',   'Vargas Niño',     'Pediatría',        'sustituto'),
('1091234566', 'Diana Carolina',  'Suárez Ortiz',    'Cardiología',      'sustituto');


INSERT INTO horario_medico (medico_documento, dia_semana, hora_inicio, hora_fin) VALUES
('1091234561', 'lunes',     '08:00:00', '12:00:00'),
('1091234561', 'miercoles', '08:00:00', '12:00:00'),
('1091234561', 'viernes',   '08:00:00', '12:00:00'),
('1091234562', 'martes',    '09:00:00', '13:00:00'),
('1091234562', 'jueves',    '09:00:00', '13:00:00'),
('1091234563', 'lunes',     '14:00:00', '18:00:00'),
('1091234563', 'miercoles', '14:00:00', '18:00:00'),
('1091234564', 'martes',    '08:00:00', '12:00:00'),
('1091234564', 'jueves',    '08:00:00', '12:00:00'),
('1091234564', 'viernes',   '08:00:00', '12:00:00'),
('1091234565', 'lunes',     '08:00:00', '12:00:00'),
('1091234566', 'miercoles', '14:00:00', '18:00:00');


INSERT INTO sustitucion (medico_sustituto_documento, medico_sustituido_documento, fecha_inicio, fecha_fin) VALUES
('1091234565', '1091234562', '2026-08-10', '2026-08-24'),  
('1091234566', '1091234563', '2026-07-01', '2026-07-15'), 
('1091234565', '1091234561', '2026-09-01', '2026-09-05');  


INSERT INTO empleado (documento, nombre, apellidos, cargo, turno) VALUES
('1098765431', 'Marta Isabel',   'Cárdenas Gil',    'ATS',                  'mañana'),
('1098765432', 'Pedro Pablo',    'Hernández Ruiz',  'auxiliar_enfermeria',  'tarde'),
('1098765433', 'Luisa Fernanda', 'Ramírez Cortés',  'celador',              'noche'),
('1098765434', 'Andrés Felipe',  'Cala Duarte',     'administrativo',      'mañana');


INSERT INTO paciente (documento, nombre, apellidos, fecha_nacimiento, telefono, medico_asignado_documento) VALUES
('1005111222', 'Camila Andrea',   'Rojas Bautista',    '1995-03-12', '3101234567', '1091234561'),
('1005111223', 'Juan David',      'Pinzón Amaya',      '1988-07-22', '3109876543', '1091234561'),
('1005111224', 'Sofía Valentina', 'Duarte León',       '2001-11-05', '3112223344', '1091234562'),
('1005111225', 'Miguel Ángel',    'Serrano Peña',      '1975-01-30', '3123456789', '1091234561'),
('1005111226', 'Valentina',       'Ríos Moreno',       '1990-09-18', '3134445566', '1091234563'),
('1005111227', 'Santiago',        'Buitrago Camacho',  '2010-05-02', '3145556677', '1091234561'),
('1005111228', 'Isabella',        'Prada Sánchez',     '1999-12-25', '3156667788', '1091234564'),
('1005111229', 'Mateo',           'Villamizar Ortega', '1983-04-14', '3167778899', '1091234561');


INSERT INTO vacacion_medico (medico_documento, fecha_inicio, fecha_fin, estado) VALUES
('1091234562', '2026-06-01', '2026-06-15', 'disfrutada'),
('1091234563', '2026-07-01', '2026-07-05', 'disfrutada'),
('1091234561', '2026-09-10', '2026-09-19', 'planificada');


INSERT INTO vacacion_empleado (empleado_documento, fecha_inicio, fecha_fin, estado) VALUES
('1098765431', '2026-05-01', '2026-05-14', 'disfrutada'),  
('1098765432', '2026-06-01', '2026-06-05', 'disfrutada'),  
('1098765433', '2026-08-01', '2026-08-06', 'disfrutada'); 

