import 'package:flutter/material.dart';
import 'package:flutter_application_login/pages/login_page.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class StarterPage extends StatelessWidget {
  const StarterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          // lineas diagonales
          Positioned.fill(
            child: CustomPaint(
              painter: DiagonalLinesPainter(),
            ),
          ),


          // Contenido principal centrado
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: [
                // Imagen del logo de la aplicación
                 Image.asset(
              'assets/logo.png', //imagen añadida en assets
              height: 325,
            ),
            const SizedBox(height: 100),


                // Título principal de la aplicación
                const Text(
                  'Diamond Studios',
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(height: 8), 

                // Texto introductorio con una breve descripción de la aplicación
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Game developer community.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.white), 
                  ),
                ),
                const SizedBox(height: 100), 

                // Botón de acción principal
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12), 
                    backgroundColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                    onPressed: () async {
                    // Muestra el alert de loading
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.loading,
                      title: 'Loading',
                      text: 'Please wait...',
                    );

                    // Simula un retardo para demostrar el loading
                    await Future.delayed(const Duration(seconds: 2));

                    // Luego de que termine el loading, navega a la LoginPage
                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text(
                    'Get started',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// clase para lineas diagonales
class DiagonalLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    double offset = 60; 

    // Esquina superior izquierda
    canvas.drawLine(
      Offset(0, offset),
      Offset(offset, 0),
      paint,
    );

    // Esquina superior derecha
    canvas.drawLine(
      Offset(size.width - offset, 0),
      Offset(size.width, offset),
      paint,
    );

    // Esquina inferior izquierda
    canvas.drawLine(
      Offset(0, size.height - offset),
      Offset(offset, size.height),
      paint,
    );

    // Esquina inferior derecha
    canvas.drawLine(
      Offset(size.width - offset, size.height),
      Offset(size.width, size.height - offset),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}