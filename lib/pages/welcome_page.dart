import 'package:flutter/material.dart';
import 'package:flutter_application_login/pages/login_page.dart';
import 'package:flutter_application_login/pages/my_alerts.dart';

//definicion de la clase 
class WelcomePage extends StatelessWidget {
  final String email;
  const WelcomePage({super.key, required this.email});
  //fin de la definicion de la clase



  //estructura de la pagina de bienvenida
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 81, 0, 119), // Fondo negro en toda la pantalla
      appBar: AppBar(
        title: const Text('Welcome', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 108, 0, 196),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    // fin de la estructura

      // stilo de drawer 
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 3, 3, 3), // Fondo negro en el Drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[


            // drawer header y estilo
            DrawerHeader(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 37, 1, 134)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/user1.jpg', // Imagen en el Drawer
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  Text(
                    'Welcome, $email!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            //fin del estilo del d rawer

            //lista de opciones del drawer
            ListTile(
              leading: const Icon(Icons.message, color: Colors.white),
              title: const Text('Alerts', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyAlerts(message: '', titulo: ''),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.white),
              title: const Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Log out', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
          //fin de la lista de opciones del drawer


      // Cuerpo con 3 imágenes en BoxDecoration y textos entre cada imagen
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageBox('assets/daimon.jpg', 'immerse yourself in this adventure ', Alignment.centerRight),
            _buildImageBox('assets/imagg2.gif', 'Create your own world and your own rules ', Alignment.centerLeft),
            _buildImageBox('assets/imagg3.gif', 'Build your own path ', Alignment.centerRight),
          ],
        ),
      ),
    );
  }
  //fin del cuerpo con 3 imagenes en BoxDecoration y textos entre cada imagen
  

  // Función para crear cada caja con imagen y texto entre ellas
  Widget _buildImageBox(String imagePath, String text, Alignment alignment) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Espaciado
      child: Column(
        children: [
          Container(
            width: double.infinity, // Ocupa todo el ancho disponible
            height: 200, // Ajusta la altura según necesites
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // Bordes redondeados
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover, // Ajusta la imagen al contenedor
              ),
            ),
          ),
          const SizedBox(height: 10), // Espaciado entre la imagen y el texto
          Align(
            alignment: alignment, // Alinea el texto según la imagen
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
