import 'package:flutter/material.dart';
import 'package:proy_appreporte_desechos/ReporteDesechosApp.dart';

class ReporteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.grey),
            label: 'Noticias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.green),
            label: 'Historial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Imagen superior
          Center(
            child: Image.asset(
              'assets/icon_planeta.png', // Reemplaza con tu imagen desde assets
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 40),

          // Botón Iniciar
          ElevatedButton(
            onPressed: () {
              // Acción del botón al presionar "Iniciar"

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReporteDesechosApp()),
              );

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              textStyle: TextStyle(fontSize: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text('Iniciar'),
          ),
        ],
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}
