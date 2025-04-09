Tienda de Juegos - CRUD con Node.js y MySQL 🎮
Un sistema de gestión de tienda de videojuegos con API RESTful desarrollada en Node.js, Express y MySQL, que permite administrar usuarios, juegos y órdenes de compra.

🔗 Demo: Enlace al despliegue (proximamente)

📌 Descripción
Este proyecto es un CRUD completo que incluye:
✅ Gestión de Usuarios (registro, autenticación básica, edición y eliminación)
✅ Catálogo de Juegos (añadir, modificar precios, eliminar)
✅ Órdenes de Compra (creación, seguimiento de estado, historial)
✅ API RESTful con Express y MySQL
✅ Seguridad básica (consultas parametrizadas, validación de datos)

🛠️ Tecnologías Usadas
Categoría	Tecnologías
Backend	Node.js, Express, MySQL2 (con conexiones en pool)
Middleware	body-parser, CORS
Seguridad	Consultas SQL parametrizadas
Despliegue	Configuración para producción (variables de entorno, manejo de puertos)
🚀 Empezando
📋 Prerrequisitos
Node.js v16+

MySQL 8.0+

Postman o Insomnia (para probar endpoints)

🔧 Instalación
Clona el repositorio

bash
Copy
git clone https://github.com/tu-usuario/tienda-juegos-crud.git
cd tienda-juegos-crud
Instala dependencias

bash
Copy
npm install
Configura la base de datos

Crea una base de datos MySQL llamada tienda_juegos.

Importa el esquema desde database.sql (si lo tienes).

Configura las variables de entorno
Crea un archivo .env en la raíz:

env
Copy
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=tu_contraseña
DB_NAME=tienda_juegos
PORT=3000
Inicia el servidor

bash
Copy
npm start
El servidor estará disponible en:
🔗 http://localhost:3000

⚙️ Endpoints de la API
👤 Usuarios
Método	Endpoint	Descripción
GET	/api/usuarios	Obtener todos los usuarios
GET	/api/usuarios/:id	Obtener un usuario por ID
POST	/api/usuarios	Crear un nuevo usuario
PUT	/api/usuarios/:id	Actualizar un usuario
DELETE	/api/usuarios/:id	Eliminar un usuario
🎮 Juegos
Método	Endpoint	Descripción
GET	/api/juegos	Listar todos los juegos
GET	/api/juegos/:id	Obtener un juego por ID
POST	/api/juegos	Añadir un nuevo juego
PUT	/api/juegos/:id	Actualizar un juego
DELETE	/api/juegos/:id	Eliminar un juego
📦 Órdenes
Método	Endpoint	Descripción
GET	/api/ordenes	Listar todas las órdenes
GET	/api/ordenes/:id	Obtener una orden por ID
POST	/api/ordenes	Crear una nueva orden
PUT	/api/ordenes/:id	Actualizar estado de una orden
DELETE	/api/ordenes/:id	Cancelar/Eliminar una orden
📦 Despliegue
Para desplegar en producción (Heroku, Railway, Render):

Configura las variables de entorno en tu proveedor de hosting.

Asegúrate de que la base de datos esté accesible.

Usa npm start o configura un proceso PM2.

🤝 Contribuciones
¡Las contribuciones son bienvenidas!
🔹 Reporta bugs → Abre un Issue
🔹 Sugiere mejoras → Envía un Pull Request

📄 Licencia
MIT License © 2024 [david machado]

🎁 Agradecimientos
Equipo de Node.js por un ecosistema increíble.

MySQL por ser una base de datos confiable.

A ti por probar este proyecto. ¡Gracias! 🚀

⌨️ Desarrollado con ❤️ por [por david machado] 😊
