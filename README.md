# Proyecto: Administración de Servidor Linux y Docker (Grupo 7)

Este proyecto cubre la configuración integral de un servidor Linux, implementando la administración de usuarios, 
la automatización de tareas, el control de versiones con Git y la containerización de un servicio web utilizando Docker.

## Descripción del Proyecto

El objetivo es simular un entorno de servidor real, comenzando desde la configuración básica del sistema, creando una estructura 
de directorios organizada con permisos específicos, y automatizando el monitoreo del sistema. Finalmente, se despliega un servidor 
web Nginx de dos maneras: utilizando la imagen oficial y construyendo una imagen personalizada a través de un `Dockerfile`.


 Componentes del Proyecto

### 1. Preparación del Entorno Servidor
Se configuró el nombre del host (`servidor-grupo7`) y se implementó una estructura de usuarios y grupos para gestionar permisos:

* **Usuarios:** `adminsys` (con privilegios `sudo`), `tecnico`, `visitante`.
* **Grupos:** `soporte`, `web`.
* Se asignaron los usuarios a sus grupos correspondientes.

### 2. Estructura de Directorios en `/proyecto`
Se creó una estructura de directorios centralizada para organizar los archivos del proyecto, asignando la propiedad de grupo 
y permisos de herencia (SGID):

* `/proyecto/datos`: (Grupo: `soporte`) Para archivos de configuración.
* `/proyecto/web`: (Grupo: `web`) Directorio destinado a los archivos del sitio web.
* `/proyecto/scripts`: Contiene scripts de automatización.
* `/proyecto/capturas`: Para almacenar evidencias del proyecto.

### 3. Automatización y Monitoreo (Cron)
Se creó un script en `/proyecto/scripts/reporte_sistema.sh` para monitorear:
* Fecha y hora.
* Usuarios conectados.
* Espacio en disco.
* Memoria RAM disponible.
* Contenedores Docker activos.

Este script se configuró con `cron` para ejecutarse cada 30 minutos y registrar su salida en `/var/log/proyecto/reporte_sistema.log`.

### 4. Control de Versiones (Git y GitHub)
Se inicializó un repositorio Git en la raíz del proyecto (`/proyecto`) y se conectó a este repositorio remoto en GitHub
para mantener un control de versiones de la configuración y los scripts.

### 5. Docker y Containerización
Se instaló Docker y se configuró para que los usuarios `adminsys` y `tecnico` puedan ejecutar comandos sin `sudo`.

**Contenedor Nginx Básico (Oficial):**
  
Se ejecutó un contenedor Nginx (puerto `8080`) montando el directorio `/proyecto/web` como un volumen. Esto permite que los
cambios en los archivos del host se reflejen instantáneamente en el contenedor.

 **Dockerfile Personalizado:**
  
Se creó un `Dockerfile` en la raíz del proyecto. Este archivo de configuración construye una imagen personalizada (`servidor-grupo7`)
 basada en `nginx:latest`, copiando los archivos web del proyecto (como `index.html`, `fondo1.jpg`, `fondo2.jpg`) al directorio correspondiente de Nginx.

 **Imagen Personalizada:**
Se construyó la imagen y se ejecutó en un contenedor (puerto `8081`) para verificar su funcionamiento.
