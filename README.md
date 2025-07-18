# Sistema de Reclamos Netflix

Un sistema web completo para la gestión de reclamos de usuarios de Netflix, desarrollado en Java con JSP y MySQL.

## Descripción

Este proyecto implementa un sistema de gestión de reclamos que permite a los usuarios de Netflix crear, gestionar y dar seguimiento a sus reclamos, mientras que los administradores pueden responder y administrar todos los reclamos del sistema.

## Características Principales

### Para Usuarios (Clientes)
- **Registro e Inicio de Sesión**: Sistema de autenticación seguro
- **Crear Reclamos**: Formulario intuitivo para crear nuevos reclamos
- **Categorización**: Selección de categorías y tipos de reclamo
- **Seguimiento**: Visualización del estado de reclamos (Pendiente, En revisión, Resuelto)
- **Historial**: Ver todos los reclamos creados por el usuario
- **Detalles**: Acceso completo a la información de cada reclamo

### Para Administradores
- **Panel de Control**: Vista general de todos los reclamos del sistema
- **Gestión de Reclamos**: Responder y actualizar el estado de los reclamos
- **Reportes**: Estadísticas y métricas del sistema
- **Filtros**: Organización por estado y categoría

## Arquitectura del Proyecto

```
Netflix_reclamos/
├── src/
│   ├── java/
│   │   ├── Controlador/          # Servlets para manejo de requests
│   │   ├── DAO/                  # Data Access Objects
│   │   ├── Modelo/               # Entidades del sistema
│   │   └── Util/                 # Utilidades (Conexión BD)
│   └── conf/
├── web/
│   ├── admin/                    # Vistas del administrador
│   ├── cliente/                  # Vistas del cliente
│   ├── includes/                 # Componentes reutilizables
│   └── META-INF/
└── nbproject/                    # Configuración de NetBeans
```

## Tecnologías Utilizadas

- **Backend**: Java, JSP, Servlets
- **Base de Datos**: MySQL
- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 5
- **Servidor**: Apache Tomcat
- **IDE**: NetBeans (configuración incluida)
- **Iconos**: Font Awesome 6.4.0

## Modelo de Datos

### Entidades Principales

- **Usuario**: Gestión de usuarios con roles (cliente/admin)
- **Reclamo**: Información principal del reclamo
- **CategoriaReclamo**: Categorías para clasificar reclamos
- **TipoReclamo**: Tipos específicos dentro de cada categoría
- **DetalleReclamo**: Información adicional del reclamo

## Instalación y Configuración

### Prerrequisitos

- Java JDK 8 o superior
- Apache Tomcat 9.x
- MySQL 5.7 o superior
- NetBeans IDE (opcional)

### Pasos de Instalación

1. **Clonar el repositorio**
   ```bash
   git clone [URL_DEL_REPOSITORIO]
   cd Netflix_reclamos
   ```

2. **Configurar la Base de Datos**
   - Crear una base de datos MySQL llamada `netflix_reclamos`
   - Importar el esquema de la base de datos (archivo SQL incluido)
   - Configurar las credenciales en `src/java/Util/ConexionBD.java`

3. **Configurar el Servidor**
   - Desplegar el proyecto en Apache Tomcat
   - Configurar el contexto en `web/META-INF/context.xml`

4. **Ejecutar el Proyecto**
   - Compilar el proyecto
   - Iniciar el servidor Tomcat
   - Acceder a `http://localhost:8080/Netflix_reclamos`

### Configuración de la Base de Datos

Editar `src/java/Util/ConexionBD.java`:
```java
String url = "jdbc:mysql://localhost/netflix_reclamos";
String usr = "tu_usuario";
String psw = "tu_contraseña";
```

## Funcionalidades Detalladas

### Sistema de Autenticación
- Validación de credenciales
- Roles diferenciados (cliente/administrador)
- Sesiones seguras
- Logout automático

### Gestión de Reclamos
- **Creación**: Formulario con validaciones
- **Categorización**: Sistema jerárquico de categorías y tipos
- **Estados**: Pendiente → En revisión → Resuelto
- **Respuestas**: Sistema de comunicación cliente-admin

### Interfaz de Usuario
- **Diseño Responsivo**: Adaptable a diferentes dispositivos
- **Tema Netflix**: Colores y estilos inspirados en Netflix
- **UX Intuitiva**: Navegación clara y accesible
- **Validaciones**: Feedback inmediato al usuario

## Seguridad

- **Autenticación**: Sistema de login seguro
- **Autorización**: Control de acceso basado en roles
- **Validación**: Verificación de datos en frontend y backend
- **Sesiones**: Gestión segura de sesiones de usuario

## Reportes y Estadísticas

- Total de reclamos por estado
- Distribución por categorías
- Métricas de rendimiento
- Historial de actividades

## Diseño y UX

- **Paleta de Colores**: Rojo Netflix (#e50914), negro (#000), grises
- **Tipografía**: Fuentes modernas y legibles
- **Iconografía**: Font Awesome para iconos
- **Layout**: Diseño limpio y profesional

--- 
