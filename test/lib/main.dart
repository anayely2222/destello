import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const DestelloOroApp());
}
class DestelloOroApp extends StatelessWidget {
  const DestelloOroApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Destello de Oro',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4AF37),
        ),
      ),
      home: const InicioPage(),
    );
  }
}
// PANTALLA DE INICIO
class InicioPage extends StatelessWidget {
  const InicioPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.diamond_outlined,
                size: 90,
                color: Color(0xFFD4AF37),
              ),
              const SizedBox(height: 20),
              const Text(
                'DESTELLO DE ORO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Color(0xFF2B2118),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Elegancia que brilla contigo',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 50),
              // BOTÓN CATÁLOGO
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CatalogoPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'VER CATÁLOGO',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // BOTÓN LOGIN
              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'INICIAR SESIÓN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// MODELO DE PRODUCTO
class Producto {
  final String nombre;
  final String descripcion;
  final double precio;
  final int stock;
  final IconData icono;
  const Producto({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.stock,
    required this.icono,
  });
}
// PRODUCTOS TEMPORALES
// Después los conectaremos con la base de datos
const List<Producto> productos = [
  Producto(
    nombre: 'Cadena Dorada',
    descripcion:
        'Cadena elegante con acabado dorado, ideal para ocasiones especiales.',
    precio: 25.00,
    stock: 10,
    icono: Icons.diamond_outlined,
  ),
  Producto(
    nombre: 'Pulsera Elegante',
    descripcion:
        'Pulsera de diseño moderno y elegante para complementar tu estilo.',
    precio: 18.00,
    stock: 8,
    icono: Icons.watch_outlined,
  ),
  Producto(
    nombre: 'Aretes Dorados',
    descripcion:
        'Aretes dorados ligeros y elegantes para uso diario o eventos.',
    precio: 12.00,
    stock: 15,
    icono: Icons.auto_awesome,
  ),
  Producto(
    nombre: 'Anillo Destello',
    descripcion:
        'Anillo elegante inspirado en el brillo y estilo de Destello de Oro.',
    precio: 20.00,
    stock: 6,
    icono: Icons.circle_outlined,
  ),
  Producto(
    nombre: 'Collar Elegancia',
    descripcion:
        'Collar delicado con diseño moderno para complementar cualquier look.',
    precio: 30.00,
    stock: 7,
    icono: Icons.diamond,
  ),
  Producto(
    nombre: 'Pulsera Dorada',
    descripcion:
        'Pulsera con acabado dorado y diseño exclusivo de Destello de Oro.',
    precio: 22.00,
    stock: 12,
    icono: Icons.stars,
  ),
];
// CATÁLOGO
class CatalogoPage extends StatefulWidget {
  const CatalogoPage({super.key});
  @override
  State<CatalogoPage> createState() => _CatalogoPageState();
}
class _CatalogoPageState extends State<CatalogoPage> {
  String busqueda = '';
  @override
  Widget build(BuildContext context) {
    final productosFiltrados = productos.where((producto) {
      return producto.nombre
          .toLowerCase()
          .contains(busqueda.toLowerCase());
    }).toList();
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD4AF37),
        foregroundColor: Colors.white,
        title: const Text(
          'Catálogo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Favoritos próximamente'),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Carrito próximamente'),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // ENCABEZADO
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nuestras joyas',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2B2118),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Encuentra el accesorio perfecto para ti',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          // BUSCADOR
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (valor) {
                setState(() {
                  busqueda = valor;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar joyas...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // CATÁLOGO
          Expanded(
  child: productosFiltrados.isEmpty
      ? const Center(
          child: Text(
            'No se encontraron productos',
            style: TextStyle(fontSize: 17),
          ),
        )
      : GridView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                    itemCount: productosFiltrados.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.68,
                    ),
                    itemBuilder: (context, index) {
                      final producto = productosFiltrados[index];
                      return Card(
                        elevation: 3,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF4E8BE),
                                    borderRadius:
                                        BorderRadius.circular(15),
                                  ),
                                  child: Icon(
                                    producto.icono,
                                    size: 65,
                                    color: const Color(0xFFD4AF37),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                producto.nombre,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                              '\$${producto.precio.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFD4AF37),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetalleProductoPage(
                                          producto: producto,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color(0xFFD4AF37),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                  ),
                                  child: const Text(
                                    'VER DETALLE',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
// DETALLE DEL PRODUCTO
class DetalleProductoPage extends StatefulWidget {
  final Producto producto;
  const DetalleProductoPage({
    super.key,
    required this.producto,
  });
  @override
  State<DetalleProductoPage> createState() =>
      _DetalleProductoPageState();
}
class _DetalleProductoPageState
    extends State<DetalleProductoPage> {
  bool favorito = false;
  int cantidad = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),
      appBar: AppBar(
        title: const Text('Detalle del producto'),
        backgroundColor: const Color(0xFFD4AF37),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                favorito = !favorito;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    favorito
                        ? 'Producto agregado a favoritos'
                        : 'Producto eliminado de favoritos',
                  ),
                ),
              );
            },
            icon: Icon(
              favorito
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF4E8BE),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                widget.producto.icono,
                size: 130,
                color: const Color(0xFFD4AF37),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              widget.producto.nombre,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B2118),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${widget.producto.precio.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD4AF37),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Descripción',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.producto.descripcion,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(
                  Icons.inventory_2_outlined,
                  color: Color(0xFFD4AF37),
                ),
                const SizedBox(width: 8),
                Text(
                  'Stock disponible: ${widget.producto.stock}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              'Cantidad',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: cantidad > 1
                      ? () {
                          setState(() {
                            cantidad--;
                          });
                        }
                      : null,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFD4AF37),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$cantidad',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: cantidad < widget.producto.stock
                      ? () {
                          setState(() {
                            cantidad++;
                          });
                        }
                      : null,
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '$cantidad ${widget.producto.nombre} agregado(s) al carrito',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
                label: const Text(
                  'AGREGAR AL CARRITO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// INICIO DE SESIÓN
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final correoController = TextEditingController();
  final passwordController = TextEditingController();
  bool ocultarPassword = true;
  @override
  void dispose() {
    correoController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  Future<void> iniciarSesion() async {
    final correo = correoController.text.trim();
    final clave = passwordController.text.trim();
    if (correo.isEmpty || clave.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor complete todos los campos')),
      );
      return;
    }
    try {
      final respuesta = await http.post(
        Uri.parse('http://10.0.2.2:3000/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'correo': correo, 'clave': clave}),
      ).timeout(const Duration(seconds: 10));
      final datos = jsonDecode(respuesta.body);
      if (!mounted) return;
      if (respuesta.statusCode >= 200 && respuesta.statusCode < 300) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(datos['mensaje'] ?? 'Inicio de sesión correcto')),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const CatalogoPage()),
          (route) => route.isFirst,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(datos['mensaje'] ?? 'Correo o contraseña incorrectos')),
        );
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
          'No se pudo conectar con el servidor. Verifica que Node.js esté ejecutándose.',
        )),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
        backgroundColor: const Color(0xFFD4AF37),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Icon(
              Icons.diamond_outlined,
              size: 80,
              color: Color(0xFFD4AF37),
            ),
            const SizedBox(height: 15),
            const Text(
              'DESTELLO DE ORO',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: correoController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: passwordController,
              obscureText: ocultarPassword,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      ocultarPassword = !ocultarPassword;
                    });
                  },
                  icon: Icon(
                    ocultarPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: iniciarSesion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'INICIAR SESIÓN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const RegistroPage(),
                  ),
                );
              },
              child: const Text(
                '¿No tienes cuenta? Regístrate',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// REGISTRO
class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});
  @override
  State<RegistroPage> createState() => _RegistroPageState();
}
class _RegistroPageState extends State<RegistroPage> {
  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> registrar() async {
    final nombre = nombreController.text.trim();
    final correo = correoController.text.trim();
    final clave = passwordController.text.trim();

    if (nombre.isEmpty || correo.isEmpty || clave.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Complete todos los campos')),
      );
      return;
    }

    try {
      final respuesta = await http.post(
        Uri.parse('http://10.0.2.2:3000/registro'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nombre': nombre,
          'correo': correo,
          'clave': clave,
        }),
      ).timeout(const Duration(seconds: 10));

      final datos = jsonDecode(respuesta.body);
      if (!mounted) return;

      if (respuesta.statusCode >= 200 && respuesta.statusCode < 300) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(datos['mensaje'] ?? 'Usuario registrado correctamente'),
          ),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(datos['mensaje'] ?? 'No se pudo registrar el usuario'),
          ),
        );
      }
    } catch (e) {
  debugPrint('ERROR REGISTRO: $e');

  if (!mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('ERROR: $e'),
      duration: const Duration(seconds: 10),
    ),
  );
}
  }
  @override
  void dispose() {
    nombreController.dispose();
    correoController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),
      appBar: AppBar(
        title: const Text('Crear cuenta'),
        backgroundColor: const Color(0xFFD4AF37),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(
              Icons.person_add_alt_1,
              size: 75,
              color: Color(0xFFD4AF37),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre completo',
                prefixIcon:
                    const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: correoController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                prefixIcon:
                    const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon:
                    const Icon(Icons.lock_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: registrar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'REGISTRARME',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
