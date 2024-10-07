import 'package:flutter/material.dart';
import 'dart:async';
import 'LoginScreen.dart'; // Importa la clase LoginScreen que está en otro archivo

class InicioApp extends StatefulWidget {
  @override
  _InicioAppState createState() => _InicioAppState();
}

class _InicioAppState extends State<InicioApp> {
  @override
  void initState() {
    super.initState();
    // Navega al LoginScreen después de 3 segundos
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/recycle_icon.png', // Reemplaza con la ruta de la imagen de splash screen
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}