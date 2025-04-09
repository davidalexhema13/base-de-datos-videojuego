const express = require('express');
const mysql = require('mysql2/promise');
const bodyParser = require('body-parser');
const cors = require('cors');
const path = require('path');

const app = express();
app.use(bodyParser.json());
app.use(cors());
app.use(express.static(path.join(__dirname, 'public')));

// Ruta para cargar index.html al acceder a /
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Configuración de la base de datos
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'tienda_juegos',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Función helper para ejecutar consultas
async function query(sql, params) {
    const [rows] = await pool.execute(sql, params);
    return rows;
}

// ------------------ RUTAS ------------------

// --- USUARIOS ---
app.get('/api/usuarios', async (req, res) => {
    try {
        const usuarios = await query('SELECT id, nombre, correo FROM usuarios');
        res.json(usuarios);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.get('/api/usuarios/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const usuarios = await query('SELECT id, nombre, correo FROM usuarios WHERE id = ?', [id]);
        if (usuarios.length === 0) {
            return res.status(404).json({ error: 'Usuario no encontrado' });
        }
        res.json(usuarios[0]);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.post('/api/usuarios', async (req, res) => {
    try {
        const { nombre, correo, contraseña } = req.body;
        if (!nombre || !correo || !contraseña) {
            return res.status(400).json({ error: 'Todos los campos son requeridos' });
        }
        const result = await query('INSERT INTO usuarios (nombre, correo, contraseña) VALUES (?, ?, ?)', [nombre, correo, contraseña]);
        res.status(201).json({ id: result.insertId });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.put('/api/usuarios/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const { nombre, correo } = req.body;
        if (!nombre || !correo) {
            return res.status(400).json({ error: 'Nombre y correo son requeridos' });
        }
        const result = await query('UPDATE usuarios SET nombre = ?, correo = ? WHERE id = ?', [nombre, correo, id]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Usuario no encontrado' });
        }
        res.json({ message: 'Usuario actualizado correctamente' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.delete('/api/usuarios/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const result = await query('DELETE FROM usuarios WHERE id = ?', [id]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Usuario no encontrado' });
        }
        res.json({ message: 'Usuario eliminado correctamente' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// --- JUEGOS ---
app.get('/api/juegos', async (req, res) => {
    try {
        const juegos = await query('SELECT ID as id, titulo, descripcion, precio, stock FROM juegos');
        res.json(juegos);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.get('/api/juegos/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const juegos = await query('SELECT ID as id, titulo, descripcion, precio, stock FROM juegos WHERE ID = ?', [id]);
        if (juegos.length === 0) {
            return res.status(404).json({ error: 'Juego no encontrado' });
        }
        res.json(juegos[0]);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.post('/api/juegos', async (req, res) => {
    try {
        const { titulo, precio } = req.body;
        if (!titulo || precio === undefined) {
            return res.status(400).json({ error: 'Todos los campos son requeridos' });
        }
        const result = await query('INSERT INTO juegos (titulo, precio) VALUES (?, ?)', [titulo, precio]);
        res.status(201).json({ id: result.insertId });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.put('/api/juegos/:id', async (req, res) => {
    const { id } = req.params;
    let { titulo, precio } = req.body;
    titulo = titulo ?? null;
    precio = precio ?? null;
    try {
        await query('UPDATE juegos SET titulo = ?, precio = ? WHERE ID = ?', [titulo, precio, id]);
        res.json({ message: 'Juego actualizado correctamente' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.delete('/api/juegos/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const result = await query('DELETE FROM juegos WHERE id = ?', [id]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Juego no encontrado' });
        }
        res.json({ message: 'Juego eliminado correctamente' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// --- ÓRDENES ---
app.get('/api/ordenes', async (req, res) => {
    try {
        const ordenes = await query(`
            SELECT 
                o.id, 
                o.usuario, 
                o.total, 
                o.estado, 
                o.fecha,
                u.nombre AS usuario_nombre, 
                u.correo AS usuario_correo
            FROM ordenes o
            LEFT JOIN usuarios u ON o.usuario = u.id
        `);
        res.json(ordenes);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.get('/api/ordenes/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const ordenes = await query('SELECT id, usuario, total, estado, fecha FROM ordenes WHERE id = ?', [id]);
        if (ordenes.length === 0) {
            return res.status(404).json({ error: 'Orden no encontrada' });
        }
        res.json(ordenes[0]);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.post('/api/ordenes', async (req, res) => {
    try {
        const { usuario, total, estado, fecha } = req.body;
        if (!usuario || total === undefined || !estado || !fecha) {
            return res.status(400).json({ error: 'Todos los campos son requeridos' });
        }
        const result = await query('INSERT INTO ordenes (usuario, total, estado, fecha) VALUES (?, ?, ?, ?)', [usuario, total, estado, fecha]);
        res.status(201).json({ id: result.insertId });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.put('/api/ordenes/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const { estado } = req.body;
        if (!estado) {
            return res.status(400).json({ error: 'El estado es requerido' });
        }
        const result = await query('UPDATE ordenes SET estado = ? WHERE id = ?', [estado, id]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Orden no encontrada' });
        }
        res.json({ message: 'Estado de la orden actualizado correctamente' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.delete('/api/ordenes/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const result = await query('DELETE FROM ordenes WHERE id = ?', [id]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Orden no encontrada' });
        }
        res.json({ message: 'Orden eliminada correctamente' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// ------------------ FIN RUTAS ------------------

// Iniciar servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
            