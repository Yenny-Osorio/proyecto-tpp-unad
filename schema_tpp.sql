-- Creación de la Base de Datos
CREATE DATABASE db_tpp_policia;

\c db_tpp_policia;

-- Tabla 1: Usuarios (Policías y Personal CTP)
CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    placa VARCHAR(20) UNIQUE NOT NULL,
    grado VARCHAR(50) NOT NULL,
    nombres_apellidos VARCHAR(150) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    rol VARCHAR(30) CHECK (rol IN ('PATRULLERO', 'RECEPTOR_CTP', 'MEDICO', 'ENTE_CONTROL')),
    email VARCHAR(100),
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla 2: Actas de Traslado por Protección (Página 1 Formato 1CS-FR-0029)
CREATE TABLE actas_tpp (
    id_acta SERIAL PRIMARY KEY,
    codigo_acta VARCHAR(30) UNIQUE NOT NULL,
    fecha_hora_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estacion VARCHAR(100) NOT NULL,
    cuadrante VARCHAR(50) NOT NULL,
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8),
    tipo_documento VARCHAR(20) NOT NULL,
    numero_documento VARCHAR(30) NOT NULL,
    nombres_ciudadano VARCHAR(150) NOT NULL,
    estado_civil VARCHAR(30),
    escolaridad VARCHAR(50),
    direccion_residencia VARCHAR(200),
    fecha_nacimiento DATE,
    ocupacion VARCHAR(100),
    sexo VARCHAR(20),
    telefono_celular VARCHAR(20),
    identidad_genero VARCHAR(50),
    causal_ley_1801 TEXT NOT NULL,
    observaciones_patrulla TEXT,
    firma_patrullero TEXT,
    firma_ciudadano TEXT,
    ciudadano_renuente BOOLEAN DEFAULT FALSE,
    id_patrullero INT REFERENCES usuarios(id_usuario),
    estado_acta VARCHAR(30) DEFAULT 'EN_TRANSITO'
);

-- Tabla 3: Allegado o Familiar Informado
CREATE TABLE allegados_tpp (
    id_allegado SERIAL PRIMARY KEY,
    id_acta INT REFERENCES actas_tpp(id_acta) ON DELETE CASCADE,
    nombres_apellidos VARCHAR(150) NOT NULL,
    identificacion VARCHAR(30),
    telefono VARCHAR(20) NOT NULL,
    hora_llamada TIME NOT NULL,
    vinculo_relacion VARCHAR(50) NOT NULL
);

-- Tabla 4: Ingreso y Control CTP (Página 2 Formato 1CS-FR-0029)
CREATE TABLE ingresos_ctp (
    id_ingreso SERIAL PRIMARY KEY,
    id_acta INT REFERENCES actas_tpp(id_acta) ON DELETE CASCADE,
    fecha_hora_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado_embriaguez BOOLEAN DEFAULT FALSE,
    menor_edad BOOLEAN DEFAULT FALSE,
    lesiones_fisicas BOOLEAN DEFAULT FALSE,
    discapacidad_fisica BOOLEAN DEFAULT FALSE,
    habitante_calle BOOLEAN DEFAULT FALSE,
    limite_horas INT DEFAULT 12,
    fecha_hora_limite TIMESTAMP NOT NULL,
    estado_temporizador VARCHAR(20) DEFAULT 'NORMAL',
    fecha_hora_egreso TIMESTAMP,
    motivo_egreso TEXT,
    id_receptor_ctp INT REFERENCES usuarios(id_usuario)
);

-- Tabla 5: Historial de Novedades y Auditoría
CREATE TABLE novedades_tpp (
    id_novedad SERIAL PRIMARY KEY,
    id_acta INT REFERENCES actas_tpp(id_acta) ON DELETE CASCADE,
    fecha_hora_novedad TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tipo_novedad VARCHAR(50) NOT NULL,
    detalle_novedad TEXT NOT NULL,
    registrado_por INT REFERENCES usuarios(id_usuario)
);
