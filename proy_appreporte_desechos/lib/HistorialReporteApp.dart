import 'package:flutter/material.dart';
import 'HomeDesechos.dart'; // Importa la clase HomeDesechos
import 'NoticiasApp.dart'; // Importa la clase NoticiasApp
import 'PerfilUsuario.dart'; // Importa la clase PerfilUsuario
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistorialReporteApp extends StatefulWidget {
  @override
  _HistorialReporteAppState createState() => _HistorialReporteAppState();
}

class _HistorialReporteAppState extends State<HistorialReporteApp> {
  int _selectedIndex = 2; // Historial está seleccionado por defecto
  List<dynamic> reportes = [];

  final String _url = "http://localhost/proy_appmovil_reporte_desechos/controller/ReporteController.php";

  // Función para obtener los reportes de la base de datos
  Future<void> fetchReportes() async {
    try {
      final url = Uri.parse("$_url/?op=2"); // Cambia op=2 para listar reportes
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        print(resp.body);  // Debug: ver los datos devueltos por la API
        setState(() {
          reportes = json.decode(resp.body);
        });
      } else {
        print("Error al obtener reportes. Estado: ${resp.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchReportes(); // Llamamos a la función cuando se carga la pantalla
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegación según el índice seleccionado
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeDesechos()), // Redirige a HomeDesechos
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NoticiasApp()), // Redirige a NoticiasApp
        );
        break;
      case 2:
      // Ya estamos en HistorialReporteApp, no hacemos nada
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PerfilUsuario()), // Redirige a PerfilUsuario
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Noticias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green, // Color seleccionado
        unselectedItemColor: Colors.grey, // Color no seleccionado
        onTap: _onItemTapped, // Método que maneja la navegación
      ),
      body: reportes.isEmpty
          ? Center(child: CircularProgressIndicator()) // Muestra un indicador de carga
          : ListView.builder(
        itemCount: reportes.length,
        itemBuilder: (context, index) {
          final reporte = reportes[index];

          // Verifica que los campos no sean nulos, y si lo son, asigna un valor predeterminado
          final String imagenUrl = (reporte['imagen'] as String?) ?? 'https://url/default_image.png';
          final String nombre = reporte['nombre'] ?? 'Nombre no disponible';
          final String apellido = reporte['apellido'] ?? '';
          final String direccion = (reporte['direccion'] as String?) ?? 'Dirección no disponible';
          final String descripcion = (reporte['descripcion'] as String?) ?? 'Descripción no disponible';

          return _buildReportItem(
            context,
            '$nombre $apellido',
            direccion,
            descripcion,
            imagenUrl, // Verifica que la imagen tenga un valor por defecto
          );
        },
      ),
      backgroundColor: Colors.blueAccent,
    );
  }

  // Widget para construir cada reporte en la lista como un botón
  Widget _buildReportItem(BuildContext context, String title, String direccion, String descripcion, String imagen) {
    return InkWell(
      onTap: () {
        // Acción al hacer clic en el reporte
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleReporteScreen(
              title: title,
              direccion: direccion,
              descripcion: descripcion,
              imagen: imagen,  // Pasamos la imagen
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(imagen), // Carga la imagen desde la URL de la base de datos
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded( // Usamos Expanded para que el contenido se ajuste
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  direccion,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  descripcion,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Pantalla de detalles del reporte
class DetalleReporteScreen extends StatelessWidget {
  final String title;
  final String direccion;
  final String descripcion;
  final String imagen; // Agregamos el campo de imagen

  DetalleReporteScreen({required this.title, required this.direccion, required this.descripcion, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            // Imagen del reporte desde la URL
            Text(
              'Imagen',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Image.network(
              imagen, // Carga la imagen desde la URL que proviene de la base de datos
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/image_desechos.png', height: 200, width: double.infinity); // Imagen predeterminada
              },
            ),
            SizedBox(height: 20),

            // Dirección del reporte
            Text(
              'Dirección',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              direccion, // Muestra la dirección del reporte desde la base de datos
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // Descripción del reporte
            Text(
              'Descripción',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              descripcion,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 40),

            // Botón de salir
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Cierra la pantalla al hacer clic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Salir'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
