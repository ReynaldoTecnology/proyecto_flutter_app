import 'package:flutter/material.dart';
import 'GoogleLoginPage.dart'; // Asegúrate de importar la clase GoogleLoginPage
import 'HomeDesechos.dart'; // Asegúrate de importar la clase HomeDesechos
import 'RegistroApp.dart'; // Asegúrate de importar la clase RegistroApp

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Función para validar y enviar el formulario
  void _login() {
    if (_formKey.currentState!.validate()) {
      // Si el formulario es válido, redirigir a HomeDesechos
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeDesechos()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, // Clave para el formulario
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Imagen de perfil en la parte superior
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),

              // Campo de texto para usuario
              TextFormField(
                controller: usuarioController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Usuario',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su usuario';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Campo de texto para contraseña
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su contraseña';
                  } else if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Recordar contraseña y enlace para "¿Olvidaste tu contraseña?"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      Text("Recuérdame")
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("¿Olvidaste tu contraseña?"),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Texto para "o continua con"
              Row(
                children: <Widget>[
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('o continua con'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 20),

              // Botón para iniciar sesión con Google
              GestureDetector(
                onTap: () {
                  // Redirige a la clase GoogleLoginPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GoogleLoginPage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/icon_google.png', // Reemplaza con la ruta local de la imagen del logo de Google
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Botón para iniciar sesión
              ElevatedButton(
                onPressed: _login, // Llama a la función de login con validación
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Iniciar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20), // Añade un espacio entre el botón de iniciar sesión y el de crear cuenta

              // Botón para crear cuenta
              TextButton(
                onPressed: () {
                  // Redirige a la clase RegistroApp
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroApp()),
                  );
                },
                child: Text(
                  'Crear cuenta',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
