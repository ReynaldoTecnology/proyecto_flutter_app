import 'package:flutter/material.dart';
import 'LoginPage.dart'; // Asegúrate de importar la clase LoginPage
import 'GoogleLoginPage.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // Asegura que los botones ocupen todo el ancho
          children: [
            // Imagen de reciclaje centrada
            Center(
              child: Image.asset(
                'assets/recycle_icon.png', // Reemplaza con la ruta de la imagen de reciclaje
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(height: 40),

            // Botón de Iniciar Sesión
            ElevatedButton(
              onPressed: () {
                // Redirige a LoginPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Color de fondo
                foregroundColor: Colors.white, // Color del texto
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Iniciar Sesión'),
            ),
            SizedBox(height: 20),

            // Botón de Iniciar con Google
            ElevatedButton.icon(
              onPressed: () {
                // Simula redirección a Google SignIn (esto sería reemplazado con google_sign_in)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoogleLoginPage()), // Reemplaza con la pantalla de Google SignIn
                );
              },
              icon: Image.asset(
                'assets/icon_google.png', // Reemplaza con la ruta del logo de Google
                height: 24,
                width: 24,
              ),
              label: Text('Iniciar con Google'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Fondo blanco para Google
                foregroundColor: Colors.black, // Texto negro
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.grey), // Borde alrededor del botón
                ),
              ),
            ),
            SizedBox(height: 20),

            // Texto de ayuda centrado
            Center(
              child: Text(
                '¿Necesitas ayuda?',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
