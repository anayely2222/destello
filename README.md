# 💎 Destello Oro

Aplicación móvil multiplataforma desarrollada con **Flutter**, orientada a la gestión y comercialización de productos de joyería.

El proyecto integra una aplicación móvil con un **backend desarrollado en Node.js** y una **base de datos MySQL**, permitiendo almacenar y consultar información mediante servicios API.

## 📱 Funcionalidades

La aplicación cuenta con:

- Pantalla de inicio.
- Catálogo de productos.
- Búsqueda de productos.
- Visualización del detalle de productos.
- Registro de usuarios.
- Inicio de sesión.
- Manejo de roles de cliente y administrador.
- Gestión de productos.
- Agregar productos.
- Eliminar productos.
- Sistema de favoritos.
- Gestión de pedidos.
- Conexión con base de datos MySQL.
- Comunicación entre Flutter y backend mediante API.

## 🛠️ Tecnologías utilizadas

- Flutter
- Dart
- Node.js
- Express.js
- MySQL
- API REST
- MySQL Workbench
- Visual Studio Code
- Android Studio

## 🏗️ Arquitectura

El proyecto utiliza una arquitectura cliente-servidor:

```text
┌─────────────────────┐
│   Aplicación móvil  │
│   Flutter / Dart    │
└──────────┬──────────┘
           │
           │ HTTP / API REST
           ▼
┌─────────────────────┐
│       Backend       │
│   Node.js / Express │
└──────────┬──────────┘
           │
           │ Consultas SQL
           ▼
┌─────────────────────┐
│    Base de datos    │
│       MySQL         │
│    destello_oro     │
└─────────────────────┘
```

## 🗄️ Base de datos

La aplicación utiliza la base de datos:

```text
destello_oro
```

Entre las tablas utilizadas en el proyecto se encuentran:

- usuarios
- productos
- favoritos
- pedidos
- detalle_pedido

La base de datos almacena la información utilizada por la aplicación y se comunica con Flutter mediante el backend.

## 🌐 Backend

El backend permite la comunicación entre la aplicación móvil y MySQL.

La aplicación Flutter realiza solicitudes HTTP al servidor para consultar, registrar, modificar o eliminar información.

Durante las pruebas con el emulador Android se utiliza:

```text
http://10.0.2.2:3000
```

`10.0.2.2` permite que el emulador Android acceda al servidor que se ejecuta en la computadora.

## ▶️ Ejecución del proyecto

Primero se debe iniciar el backend.

Después, desde la carpeta del proyecto Flutter, ejecutar:

```bash
flutter pub get
```

Comprobar los dispositivos disponibles:

```bash
flutter devices
```

Finalmente ejecutar:

```bash
flutter run
```

También se puede seleccionar directamente un emulador:

```bash
flutter run -d emulator-5556
```

## 🧪 Pruebas

El proyecto puede probarse mediante un emulador Android.

Las pruebas permiten verificar la comunicación:

```text
Aplicación Flutter
        ↓
Backend Node.js
        ↓
Base de datos MySQL
```

Se verifica el registro e inicio de sesión de usuarios, consulta del catálogo y las operaciones disponibles para la gestión de productos.

## 📂 Estructura general

```text
destello_oro/
│
├── android/
├── lib/
│   └── main.dart
├── test/
├── pubspec.yaml
└── README.md
```

El backend y la base de datos complementan el funcionamiento de la aplicación.

## 🎓 Proyecto académico

Proyecto desarrollado para la asignatura **Aplicaciones Móviles**, como parte de la práctica de desarrollo de una aplicación móvil multiplataforma.

**Universidad Estatal Amazónica (UEA)**

## 👨‍💻 Proyecto

**Nombre:** Destello Oro  
**Tipo:** Aplicación móvil multiplataforma  
**Frontend:** Flutter / Dart  
**Backend:** Node.js / Express  
**Base de datos:** MySQL