import 'package:flutter/material.dart';
import 'HomeDesechos.dart'; // Importa la clase HomeDesechos
import 'NoticiasApp.dart'; // Importa la clase NoticiasApp
import 'HistorialReporteApp.dart'; // Importa la clase HistorialReporteApp
import 'LoginScreen.dart'; // Importa la clase LoginScreen

class PerfilUsuario extends StatefulWidget {
  @override
  _PerfilUsuarioState createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  int _selectedIndex = 3; // Perfil está seleccionado por defecto

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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HistorialReporteApp()), // Redirige a HistorialReporteApp
        );
        break;
      case 3:
      // Ya estamos en PerfilUsuario, no hacemos nada
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Asegura que las etiquetas siempre se muestren
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
        selectedItemColor: Colors.green, // Color del ícono seleccionado
        unselectedItemColor: Colors.grey[600], // Color de íconos no seleccionados
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold), // Estilo de etiqueta seleccionada
        unselectedLabelStyle: TextStyle(fontSize: 14), // Tamaño de las etiquetas no seleccionadas
        iconSize: 30, // Tamaño de los íconos
        onTap: _onItemTapped, // Método que maneja la navegación
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Icono de usuario
              SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/icon_usuario.png',
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(height: 10),

              // Nombre del usuario
              Text(
                'José',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // Email del usuario
              Text(
                'jose55_02@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),

              SizedBox(height: 30),

              // Tarjeta con detalles del perfil
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nombres', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('Jose'),

                      SizedBox(height: 16),

                      Text('Apellidos', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('Perez'),

                      SizedBox(height: 16),

                      Text('Celular', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('999934566'),

                      SizedBox(height: 16),

                      Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('jose55_02@gmail.com'),

                      SizedBox(height: 20),

                      // Botón de Actualizar Perfil
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción de actualizar perfil
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            textStyle: TextStyle(fontSize: 18, color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text('Actualiza perfil'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Botón de Cerrar Sesión
              ElevatedButton(
                onPressed: () {
                  // Redirigir a la pantalla de LoginScreen al cerrar sesión
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()), // Redirige a LoginScreen
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}
