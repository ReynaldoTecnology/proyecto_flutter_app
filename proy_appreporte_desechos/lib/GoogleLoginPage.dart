import 'package:flutter/material.dart';

class GoogleLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign In'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Simulación de inicio de sesión con Google',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
