🧩 CRUD de Usuarios con MongoDB, Python y Flask
Un proyecto web sencillo para gestionar usuarios mediante operaciones CRUD usando Python, Flask y MongoDB, ideal para quienes están empezando en el desarrollo backend con Python.

📄 Descripción
Este proyecto permite crear, leer, actualizar y eliminar usuarios desde una interfaz web básica. Utiliza Flask como microframework, MongoDB como base de datos NoSQL y Jinja2 para renderizar las vistas HTML.

Características principales:
Crear nuevos usuarios desde un formulario web

Mostrar todos los usuarios en una tabla

Editar y actualizar usuarios

Eliminar usuarios fácilmente

Interfaz amigable y minimalista



🎥 Visuales
Formulario para agregar usuario

Tabla de usuarios

🚀 Empezando
Estas instrucciones te permitirán ejecutar el proyecto en tu máquina local con fines de desarrollo o prueba.

📋 Prerrequisitos
Sistema Operativo: Windows 10 / Ubuntu 20.04

Python: 3.8 o superior

MongoDB: Local o Atlas

Pip: Gestor de paquetes

Navegador moderno (Chrome, Firefox, etc.)

🔧 Instalación
bash
Copiar
Editar
# Paso 1: Clona el repositorio
git clone https://github.com/tuusuario/crud-flask-mongo.git
cd crud-flask-mongo

# Paso 2: Crea y activa un entorno virtual
python -m venv env
source env/bin/activate  # En Windows usa: env\Scripts\activate

# Paso 3: Instala las dependencias
pip install -r requirements.txt

# Paso 4: Configura la URI de MongoDB (en .env o directo en app.py)
# Por ejemplo:
# mongodb://localhost:27017/crud_db

# Paso 5: Ejecuta la aplicación
python app.py
⚙️ Ejecutando las Pruebas
Actualmente se manejan pruebas manuales desde la interfaz web. Se planea integración con pytest para pruebas automatizadas.

🔩 Pruebas de Principio a Fin
Estas pruebas validan todo el flujo del CRUD:

Agregar un nuevo usuario

Mostrar todos los registros

Editar datos desde la tabla

Eliminar entradas

⌨️ Pruebas de Estilo de Código
Se puede usar flake8 para verificar el estilo de código:

bash
Copiar
Editar
pip install flake8
flake8 app.py
📦 Despliegue
Para producción se recomienda desplegar en:

Render

Heroku

Railway

VPS con Nginx + Gunicorn

🛠️ Construido Con
Python – Lenguaje de programación

Flask – Microframework web

MongoDB – Base de datos NoSQL

Jinja2 – Motor de plantillas

HTML/CSS – Interfaz

🖇️ Contribuyendo
Las contribuciones son bienvenidas. Consulta CONTRIBUTING.md para más detalles sobre el flujo de trabajo colaborativo.

📖 Wiki
Más detalles, configuraciones y guías estarán disponibles pronto en la sección Wiki del repositorio.

🛟 Soporte
¿Tienes preguntas o quieres reportar un bug?
Abre un issue en GitHub Issues

🗺️ Roadmap
 CRUD básico funcionando

 Validaciones de formulario

 Autenticación de usuarios

 Mejoras de diseño y estilo

 Deploy a producción

📌 Versionado
Se usa Git para el versionado. Puedes consultar las versiones en la pestaña de etiquetas del repositorio.

✒️ Autor
David Alexander Hernandez Machado

📄 Licencia
Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE.md para más detalles.

🎁 Expresiones de Gratitud
Compartí este proyecto con tus panas 🚀

Invitame un tintico ☕

Dejá una estrella ⭐ en GitHub



⌨️ con ❤️ por david😊
