//importacion de paquetes
import 'package:flutter/material.dart';
import 'package:flutter_application_login/controllers/register_controller.dart';  // Asegúrate de que el controlador esté correctamente importado

//definicion de la clases
class RegisterPage extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterPage({super.key});


//personalizacion de la pantalla 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
            body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/mult2.gif'),
              fit: BoxFit.cover,
            ),
          ),
          //fin de la personalizacion de la pantalla


            //pasdding para alejarlo del top
        child: Padding(
           padding: const EdgeInsets.only(top: 130.0),
             child: Padding(padding: const EdgeInsets.all(30.0),          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // fin del padding para alejarlo del top

            // personalizacion del titulo de la pagina de registro
            children: [
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  'Register',
                 style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            //fin de la personalizacion del titulo de la pagina de registro


              // Campo de Nombre y estilo
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

                  border: OutlineInputBorder(),
                  

                ),
                  style: const TextStyle(color: Colors.white),

              ),
              const SizedBox(height: 20),
              // Fin del campo de Nombre y estilo

              // Campo de Email y estilo
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              // Fin del campo de Email y estilo 


              // Campo de Contraseña  y estilo
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                   labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              // Fin del campo de Contraseña y estilo


              // Botón de Registro y estilo
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_validateInputs(context)) {
                      bool success = await register(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                      );

                      if (success) {
                        // Mostrar el mensaje de éxito
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("User registered successfully"),
                            backgroundColor: Colors.green,
                          ),
                        );

                        // Vaciar los campos después de un registro exitoso
                        nameController.clear();
                        emailController.clear();
                        passwordController.clear();
                      } else {
                        // Mostrar el mensaje de error si el registro falla
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Error registering user"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Register'),
                ),
              ),
              // Fin del botón de Registro y estilo

              const SizedBox(height: 20), // Espacio entre el botón y el texto


              // Sección de redirección a login
              Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Text(
              'Already have an account?',
             style: TextStyle(color: Colors.white), // Texto en blanco
              ),
               TextButton(
             onPressed: () {
              Navigator.pop(context); // Regresa a la pantalla anterior (Login)
              },
               style: TextButton.styleFrom(
               foregroundColor: Colors.lightBlue, // Texto del botón en celeste
               ),
               child: const Text('Login'),
               ),
                ],
              ),
              // Fin de la sección de redirección a login

            ],
          ),
        ),
      ),
            )
            )
    );
  
  }

  // Método para validar los campos
  bool _validateInputs(BuildContext context) {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required")),
      );
      return false;
    }
    if (!emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email address")),
      );
      return false;
    }
    if (passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password must be at least 6 characters")),
      );
      return false;
    }
    return true;
  }
}
