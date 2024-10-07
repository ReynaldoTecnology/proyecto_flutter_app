import 'package:flutter/material.dart';
import 'NoticiasApp.dart'; // Importa la clase NoticiasApp
import 'HistorialReporteApp.dart'; // Importa la clase HistorialReporteApp
import 'PerfilUsuario.dart'; // Importa la clase PerfilUsuario
import 'ReporteApp.dart'; // Importa la clase ReporteApp

class HomeDesechos extends StatefulWidget {
  @override
  _HomeDesechosState createState() => _HomeDesechosState();
}

class _HomeDesechosState extends State<HomeDesechos> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegación según el índice seleccionado
    switch (index) {
      case 0:
      // Ya estamos en HomeDesechos, no hacemos nada
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoticiasApp()), // Redirige a NoticiasApp
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HistorialReporteApp()), // Redirige a HistorialReporteApp
        );
        break;
      case 3:
        Navigator.push(
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
        type: BottomNavigationBarType.fixed, // Siempre muestra las etiquetas
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
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Saludo
              SizedBox(height: 20),
              Text(
                'Hola, José!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              // Icono de usuario más grande
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/icon_usuario.png', // Ruta de la imagen del ícono de usuario
                  height: 80, // Tamaño más grande
                  width: 80, // Tamaño más grande
                ),
              ),

              SizedBox(height: 30),

              // Noticias
              Text(
                'Noticias',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/image_voluntariado.png'), // Reemplaza con la ruta correcta de la imagen
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Voluntariado Lima24',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40),

              // Botón de reportar
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Redirige a la clase ReporteApp
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReporteApp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Reporta'),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}
