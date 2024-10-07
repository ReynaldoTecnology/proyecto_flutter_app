import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart'; // Importa la librería para abrir WhatsApp
import 'HomeDesechos.dart'; // Asegúrate de importar la clase HomeDesechos

class ReporteDesechosApp extends StatefulWidget {
  @override
  _ReporteDesechosAppState createState() => _ReporteDesechosAppState();
}

class _ReporteDesechosAppState extends State<ReporteDesechosApp> {
  // Controladores para los campos
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario

  final String _url = "http://localhost/proy_appmovil_reporte_desechos/controller/ReporteController.php";

  // Función para enviar los datos a MySQL
  Future<void> addReporte() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final url = Uri.parse(
          '$_url/?op=1&nombre=${nombreController.text}&apellido=${apellidoController.text}&direccion=${direccionController.text}&descripcion=${descripcionController.text}');

      final resp = await http.post(url);
      final decodeData = json.decode(resp.body);
      print(decodeData);

      if (resp.statusCode == 200) {
        print("Reporte agregado correctamente. Estado: ${resp.statusCode}");

        // Enviar mensaje a WhatsApp después de agregar a la base de datos
        enviarMensajeWhatsApp(
          nombreController.text,
          apellidoController.text,
          direccionController.text,
          descripcionController.text,
        );

        // Limpiar los campos después de agregar el reporte
        setState(() {
          nombreController.clear();
          apellidoController.clear();
          direccionController.clear();
          descripcionController.clear();
        });

        // Mostrar una ventana emergente con el mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Reporte enviado correctamente'),
            duration: Duration(seconds: 3),
          ),
        );

        // Redirigir a la pantalla HomeDesechos
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeDesechos()),
        );
      } else {
        print("Error al agregar reporte. Estado: ${resp.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // Función para enviar mensaje a WhatsApp
  void enviarMensajeWhatsApp(String nombre, String apellido, String direccion, String descripcion) async {
    String mensaje = "Reporte de desechos:\nNombre: $nombre\nApellido: $apellido\nDirección: $direccion\nDescripción: $descripcion";
    String whatsappUrl = "https://wa.me/51992502130?text=${Uri.encodeComponent(mensaje)}";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No se pudo abrir WhatsApp'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.grey),
            label: 'Noticias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.grey),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Clave para el formulario
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Adjunta imagen',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),

                // Contenedor para adjuntar imagen (no implementado en esta versión)
                GestureDetector(
                  onTap: () {
                    // Acción para adjuntar una imagen
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Campo de nombre con validación
                Text(
                  'Nombre',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: nombreController,
                  decoration: InputDecoration(
                    hintText: 'Escribe tu nombre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Campo de apellido con validación
                Text(
                  'Apellido',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: apellidoController,
                  decoration: InputDecoration(
                    hintText: 'Escribe tu apellido',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su apellido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Campo de dirección con validación
                Text(
                  'Dirección',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: direccionController,
                  decoration: InputDecoration(
                    hintText: 'Escribe tu dirección',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su dirección';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Campo de descripción (opcional)
                Text(
                  'Descripción (opcional)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextField(
                    controller: descripcionController,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Escribe una descripción...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Botón Enviar
                Center(
                  child: ElevatedButton(
                    onPressed: addReporte, // Llamamos a la función para enviar el reporte y el mensaje a WhatsApp
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('Enviar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}

