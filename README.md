# Sistema Digital de Traslado por Protección (TPP) - Formato 1CS-FR-0029

## 📌 Descripción del Proyecto
Este repositorio contiene el prototipo funcional (Nivel de Madurez Tecnológica **TRL 5**) desarrollado para el curso de **Proyecto de Grado de la UNAD**. El sistema tiene como objetivo automatizar y digitalizar el procedimiento policial de Traslado por Protección (TPP) regulado por el artículo 155 de la Ley 1801 de 2016, sustituyendo el formato físico en papel (1CS-FR-0029) por una solución tecnológica integral basada en una aplicación móvil *Offline-First* para patrullas en calle y un panel web de control centralizado para los Centros de Traslado por Protección (CTP).

---

## 🏗️ Arquitectura Tecnológica
El sistema se compone de tres capas principales interconectadas mediante una API REST:
1. **Módulo Móvil (Patrulla de Vigilancia):** Desarrollado para la captura rápida de datos *in situ*, georreferenciación GPS automática, escaneo de cédulas y registro de firmas digitales.
2. **Backend & API REST:** Gestiona la lógica de negocio, validaciones de seguridad y sincronización de datos.
3. **Base de Datos (PostgreSQL):** Estructura relacional optimizada para garantizar la integridad referencial de las actas, historiales médicos, allegados informados y control de tiempos.
4. **Panel Web (Centro CTP):** Interfaz de monitoreo en tiempo real con temporizador automatizado de 12 horas y alertas preventivas.

---

## 🗄️ Modelo de Base de Datos (PostgreSQL)
El script de inicialización y creación de tablas relacionales (`usuarios`, `actas_tpp`, `allegados_tpp`, `ingresos_ctp`, `novedades_tpp`) se encuentra en la carpeta `/database/schema_tpp.sql`. Garantiza el cumplimiento de normativas de tratamiento de datos y trazabilidad institucional.

---

## ⚙️ Instrucciones de Instalación y Ejecución

### 1. Clonar el repositorio
```bash
git clone https://github.com/Yenny-Osorio/proyecto-tpp-unad.git
cd proyecto-tpp-unad
