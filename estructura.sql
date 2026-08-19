USE clinica;

CREATE TABLE medico (
    documento     VARCHAR(15) PRIMARY KEY,
    nombre        VARCHAR(50) NOT NULL,
    apellidos     VARCHAR(80) NOT NULL,
    especialidad  VARCHAR(60) NOT NULL,
    tipo          ENUM('titular','interino','sustituto') NOT NULL
);


CREATE TABLE horario_medico (
    id                INT AUTO_INCREMENT PRIMARY KEY,
    medico_documento  VARCHAR(15) NOT NULL,
    dia_semana        ENUM('lunes','martes','miercoles','jueves','viernes','sabado','domingo') NOT NULL,
    hora_inicio       TIME NOT NULL,
    hora_fin          TIME NOT NULL,
    CONSTRAINT fk_horario_medico
        FOREIGN KEY (medico_documento) REFERENCES medico(documento)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_horario_valido CHECK (hora_fin > hora_inicio)
);

CREATE TABLE sustitucion (
    id                            INT AUTO_INCREMENT PRIMARY KEY,
    medico_sustituto_documento    VARCHAR(15) NOT NULL,
    medico_sustituido_documento   VARCHAR(15) NOT NULL,
    fecha_inicio                  DATE NOT NULL,
    fecha_fin                     DATE NOT NULL,
    CONSTRAINT fk_sustituto
        FOREIGN KEY (medico_sustituto_documento) REFERENCES medico(documento)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_sustituido
        FOREIGN KEY (medico_sustituido_documento) REFERENCES medico(documento)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_sustitucion_fechas CHECK (fecha_fin >= fecha_inicio)
);

CREATE TABLE empleado (
    documento   VARCHAR(15) PRIMARY KEY,
    nombre      VARCHAR(50) NOT NULL,
    apellidos   VARCHAR(80) NOT NULL,
    cargo       ENUM('ATS','auxiliar_enfermeria','celador','administrativo') NOT NULL,
    turno       ENUM('mañana','tarde','noche') NOT NULL
);

CREATE TABLE paciente (
    documento                  VARCHAR(15) PRIMARY KEY,
    nombre                     VARCHAR(50) NOT NULL,
    apellidos                  VARCHAR(80) NOT NULL,
    fecha_nacimiento           DATE NOT NULL,
    telefono                   VARCHAR(15),
    medico_asignado_documento  VARCHAR(15) NOT NULL,
    CONSTRAINT fk_paciente_medico
        FOREIGN KEY (medico_asignado_documento) REFERENCES medico(documento)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE vacacion_medico (
    id                INT AUTO_INCREMENT PRIMARY KEY,
    medico_documento  VARCHAR(15) NOT NULL,
    fecha_inicio      DATE NOT NULL,
    fecha_fin         DATE NOT NULL,
    estado            ENUM('planificada','disfrutada') NOT NULL,
    CONSTRAINT fk_vacacion_medico
        FOREIGN KEY (medico_documento) REFERENCES medico(documento)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_vacacion_medico_fechas CHECK (fecha_fin >= fecha_inicio)
);


CREATE TABLE vacacion_empleado (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    empleado_documento  VARCHAR(15) NOT NULL,
    fecha_inicio        DATE NOT NULL,
    fecha_fin           DATE NOT NULL,
    estado              ENUM('planificada','disfrutada') NOT NULL,
    CONSTRAINT fk_vacacion_empleado
        FOREIGN KEY (empleado_documento) REFERENCES empleado(documento)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_vacacion_empleado_fechas CHECK (fecha_fin >= fecha_inicio)
);