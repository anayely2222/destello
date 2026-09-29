require('dotenv').config();

const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(express.json());

// CONEXIÓN A MYSQL
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT
});

db.connect((error) => {
  if (error) {
    console.error('❌ Error al conectar con MySQL:', error.message);
    return;
  }

  console.log('✅ Conectado a MySQL - Destello de Oro');
});

// PRUEBA DEL SERVIDOR
app.get('/', (req, res) => {
  res.json({
    mensaje: 'API Destello de Oro funcionando'
  });
});

// OBTENER PRODUCTOS
app.get('/productos', (req, res) => {
  db.query('SELECT * FROM productos', (error, resultados) => {
    if (error) {
      console.error(error);

      return res.status(500).json({
        mensaje: 'Error al obtener productos'
      });
    }

    res.json(resultados);
  });
});

// LOGIN
app.post('/login', (req, res) => {
  const { correo, clave } = req.body;

  if (!correo || !clave) {
    return res.status(400).json({
      mensaje: 'Ingrese correo y contraseña'
    });
  }

  const sql = 'SELECT * FROM usuarios WHERE correo = ? LIMIT 1';

  db.query(sql, [correo], (error, resultados) => {
    if (error) {
      console.error(error);

      return res.status(500).json({
        mensaje: 'Error del servidor'
      });
    }

    if (resultados.length === 0) {
      return res.status(401).json({
        mensaje: 'Usuario no encontrado'
      });
    }

    const usuario = resultados[0];

    if (clave !== usuario.clave) {
      return res.status(401).json({
        mensaje: 'Contraseña incorrecta'
      });
    }

    res.json({
      mensaje: 'Inicio de sesión correcto',
      usuario: {
        id: usuario.id,
        nombre: usuario.nombre,
        correo: usuario.correo,
        rol: usuario.rol
      }
    });
  });
});

// REGISTRAR USUARIO
app.post('/registro', (req, res) => {
  const { nombre, correo, clave } = req.body;

  if (!nombre || !correo || !clave) {
    return res.status(400).json({
      mensaje: 'Complete todos los campos'
    });
  }

  const verificar =
    'SELECT id FROM usuarios WHERE correo = ? LIMIT 1';

  db.query(verificar, [correo], (error, resultados) => {
    if (error) {
      console.error(error);

      return res.status(500).json({
        mensaje: 'Error del servidor'
      });
    }

    if (resultados.length > 0) {
      return res.status(409).json({
        mensaje: 'Este correo ya está registrado'
      });
    }

    const sql =
      'INSERT INTO usuarios (nombre, correo, clave, rol) VALUES (?, ?, ?, ?)';

    db.query(
      sql,
      [nombre, correo, clave, 'cliente'],
      (error, resultado) => {
        if (error) {
          console.error(error);

          return res.status(500).json({
            mensaje: 'Error al registrar usuario'
          });
        }

        res.status(201).json({
          mensaje: 'Usuario registrado correctamente',
          usuario: {
            id: resultado.insertId,
            nombre: nombre,
            correo: correo,
            rol: 'cliente'
          }
        });
      }
    );
  });
});

// INICIAR SERVIDOR
const PORT = process.env.PORT || 3000;

app.listen(PORT, '0.0.0.0', () => {
  console.log(
    `🚀 Servidor Destello de Oro activo en puerto ${PORT}`
  );
});