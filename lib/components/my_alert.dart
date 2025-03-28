import 'package:flutter/material.dart';
import 'package:flutter_application_login/pages/login_page.dart';



 //Inicio de alerta de mensaje

class MyAlert extends StatelessWidget {
  final String message;
  final String titulo;
  const MyAlert({super.key, required this.message, required this.titulo});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(titulo),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
           
//Final de la alerta de mensaje



           //Boton de ok


            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
  
    );


//fin del boton de ok


  }
}