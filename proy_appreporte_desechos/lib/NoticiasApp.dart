import 'package:flutter/material.dart';
import 'HomeDesechos.dart'; // Importa la clase HomeDesechos
import 'HistorialReporteApp.dart'; // Importa la clase HistorialReporteApp
import 'PerfilUsuario.dart'; // Importa la clase PerfilUsuario

class NoticiasApp extends StatefulWidget {
  @override
  _NoticiasAppState createState() => _NoticiasAppState();
}

class _NoticiasAppState extends State<NoticiasApp> {
  int _selectedIndex = 1; // Noticias está seleccionado por defecto

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
      // Ya estamos en NoticiasApp, no hacemos nada
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HistorialReporteApp()), // Redirige a HistorialReporteApp
        );
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
        type: BottomNavigationBarType.fixed, // Asegura que todos los íconos tengan etiquetas visibles
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
        selectedItemColor: Colors.green, // Color del botón seleccionado
        unselectedItemColor: Colors.grey, // Iconos no seleccionados más oscuros
        onTap: _onItemTapped, // Método que maneja la navegación
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildNewsCard(),
              SizedBox(height: 20),
              _buildNewsCard(),
              SizedBox(height: 20),
              _buildNewsCard(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }

  // Widget para construir la tarjeta de noticias
  Widget _buildNewsCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen de la noticia
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              'assets/image_voluntariado.png',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RED AGUA JOVEN LIMA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87, // Letras más oscuras
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'El programa tiene el objetivo de fomentar el cuidado y conservación del recurso hídrico...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54, // Texto de descripción más oscuro
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.thumb_up, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Me gusta', style: TextStyle(color: Colors.grey)),
                    Spacer(),
                    Text('2h ago', style: TextStyle(color: Colors.grey)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
