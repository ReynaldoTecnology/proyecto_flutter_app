import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'LoginPage.dart';
import 'LoginScreen.dart';
import 'HomeDesechos.dart';
import 'PerfilUsuario.dart';
import 'NoticiasApp.dart';
import 'HistorialReporteApp.dart';
import 'ReporteApp.dart';
import 'ReporteDesechosApp.dart';
import 'InicioApp.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "GENERAR REPORTE",
      //home: AgregarReporteScreen(),
      //home: LoginPage(), // Aquí llamamos a la pantalla de login como primera pantalla
      home: InicioApp(),

    );
  }
  }


  class AgregarReporteScreen extends StatefulWidget{
  @override
  _AgregarReporteState createState() => _AgregarReporteState();
  
  }

  class _AgregarReporteState extends State<AgregarReporteScreen> {

    final TextEditingController nombreController = TextEditingController();
    final TextEditingController apellidoController = TextEditingController();
    final TextEditingController direccionController = TextEditingController();
    final TextEditingController descripcionController = TextEditingController();

    final String _url = "http://localhost/proy_appmovil_reporte_desechos/controller/ReporteController.php";

    Future<void> addReporte() async{

        try{

          final url = Uri.parse(

            '$_url/?op=1&nombre=${nombreController.text}&apellido=${apellidoController.text}'
                '&direccion=${direccionController.text}&descripcion=${descripcionController.text}'
          );

          final resp =await http.post(url);
          final decodeData = json.decode(resp.body);
          print(decodeData);

          if(resp.statusCode == 200){

            print("Reporte agregado correctamente . Estado : ${resp.statusCode}");

            // Limpiar los campos después de agregar el reporte
            nombreController.clear();
            apellidoController.clear();
            direccionController.clear();
            descripcionController.clear();


            // Mostrar una ventana emergente  con el mensaje de éxito
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Reporte enviado correctamente'),
                  duration: Duration(seconds: 3), // Duración del mensaje
                ),
            );




            
          }else{
            print("Error al agregar reporte. Estado: ${resp.statusCode}");

          }

        }catch (e) {

          print("Error: $e");
        }

    }

  @override
  Widget build(BuildContext context) {

      return Scaffold(

        appBar: AppBar(title: Text('Agregar Reporte')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: apellidoController,
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              TextField(
                controller: direccionController,
                decoration: InputDecoration(labelText: 'Direccion'),
              ),
              TextField(
                controller: descripcionController,
                decoration: InputDecoration(labelText: 'Descripcion'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: addReporte,
                  child: Text('Enviar Reporte'))
            ],
          ),
        ),


      );

  }



  }
  
  
  

