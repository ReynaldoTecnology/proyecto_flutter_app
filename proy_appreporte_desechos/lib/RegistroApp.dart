import 'package:flutter/material.dart';
import 'HomeDesechos.dart'; // Asegúrate de importar la clase HomeDesechos

class RegistroApp extends StatefulWidget {
  @override
  _RegistroAppState createState() => _RegistroAppState();
}

class _RegistroAppState extends State<RegistroApp> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Form(
            key: _formKey, // Clave para el formulario
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Registro',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField('Nombre', _nombreController, 'Por favor, ingrese su nombre'),
                SizedBox(height: 10),
                _buildTextField('Apellido', _apellidoController, 'Por favor, ingrese su apellido'),
                SizedBox(height: 10),
                _buildTextField('Correo', _correoController, 'Por favor, ingrese un correo válido', isEmail: true),
                SizedBox(height: 10),
                _buildTextField('Contraseña', _contrasenaController, 'Por favor, ingrese una contraseña', isPassword: true),
                SizedBox(height: 10),
                _buildTextField('Teléfono', _telefonoController, 'Por favor, ingrese un número válido', isPhone: true),
                SizedBox(height: 30),
                _buildRegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller, String validationMessage,
      {bool isPassword = false, bool isEmail = false, bool isPhone = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : isPhone ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
      // Validación
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        if (isEmail && !_isValidEmail(value)) {
          return 'Por favor, ingrese un correo válido';
        }
        if (isPhone && !_isValidPhone(value)) {
          return 'Por favor, ingrese un número válido';
        }
        return null;
      },
    );
  }

  bool _isValidEmail(String value) {
    // Expresión regular simple para validar correos
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(value);
  }

  bool _isValidPhone(String value) {
    // Validación de número de teléfono (ejemplo simple)
    final phoneRegex = RegExp(r'^\d{9,10}$'); // Acepta números de 9 o 10 dígitos
    return phoneRegex.hasMatch(value);
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Si todas las validaciones pasan
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registro exitoso')),
          );
          // Redirigir a la pantalla HomeDesechos después del registro
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeDesechos()),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Color del botón
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
      ),
      child: Text(
        'Registrar',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _correoController.dispose();
    _contrasenaController.dispose();
    _telefonoController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: RegistroApp(),
  ));
}
