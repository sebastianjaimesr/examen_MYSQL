USE clinica;


SELECT
    m.documento,
    CONCAT(m.nombre, ' ', m.apellidos) AS medico,
    COUNT(p.documento) AS numero_pacientes
FROM medico m
LEFT JOIN paciente p ON p.medico_asignado_documento = m.documento
GROUP BY m.documento, m.nombre, m.apellidos
ORDER BY numero_pacientes DESC;


SELECT
    COUNT(DISTINCT s.medico_sustituido_documento) AS medicos_en_sustitucion
FROM sustitucion s
WHERE CURDATE() BETWEEN s.fecha_inicio AND s.fecha_fin;


SELECT
    e.documento,
    CONCAT(e.nombre, ' ', e.apellidos) AS empleado,
    SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio) + 1) AS dias_disfrutados
FROM empleado e
JOIN vacacion_empleado v ON v.empleado_documento = e.documento
WHERE v.estado = 'disfrutada'
GROUP BY e.documento, e.nombre, e.apellidos
HAVING dias_disfrutados > 10;


SELECT DISTINCT
    m.documento,
    CONCAT(m.nombre, ' ', m.apellidos) AS medico_sustituto,
    s.fecha_inicio,
    s.fecha_fin
FROM medico m
JOIN sustitucion s ON s.medico_sustituto_documento = m.documento
WHERE CURDATE() BETWEEN s.fecha_inicio AND s.fecha_fin;


SELECT
    m.documento,
    CONCAT(m.nombre, ' ', m.apellidos) AS medico,
    SUM(TIME_TO_SEC(TIMEDIFF(h.hora_fin, h.hora_inicio))) / 3600 AS horas_semanales
FROM medico m
JOIN horario_medico h ON h.medico_documento = m.documento
GROUP BY m.documento, m.nombre, m.apellidos
ORDER BY horas_semanales DESC;