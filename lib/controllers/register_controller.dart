import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> register(String name, String email, String password) async {

//const String baseUrl = 'http://localhost:8000/api/register'; //WEB
  const String baseUrl = 'http://10.0.2.2:8000/api/register';
  
  var client = http.Client();
  var url = Uri.parse(baseUrl);
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'cache-control': 'no-cache',
  };

  var body = json.encode({'name': name, 'email': email, 'password': password});

  try {
    var response = await client.post(url, headers: headers, body: body);

    // Verificar que la respuesta no sea null y el código de estado sea 200
    if (response.statusCode == 200) {
      print('Registro exitoso: ${response.body}');
      return true;  // Indica que la solicitud fue exitosa
    } else {
      print('Error en el registro: ${response.body}');
      return false;  // Si no es un código 200, consideramos que hubo un error
    }
  } catch (e) {
    print('Error al hacer la solicitud: $e');
    return false;  // Si ocurre cualquier otro error, devolvemos false
  }
}




