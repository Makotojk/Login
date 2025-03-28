// dependencias necesarias para la pagina de login
import 'package:flutter/material.dart';
import 'package:flutter_application_login/controllers/login_controller.dart';
import 'package:flutter_application_login/pages/welcome_page.dart';
import 'package:flutter_application_login/pages/register_page.dart';
//fin de las dependencias 

//inicio de la clase LoginPage
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}
//fin de la clase LoginPage


//controladores y variables 
class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
//fin de controladores y variables

//visualizacion color y del fondo de la pagina
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/mult1.gif'),
              fit: BoxFit.cover,
            ),
          ),
//fin de la visualizacion del color y del fondo


          //este es el formulario de login
          child: Padding(
                     padding: const EdgeInsets.only(top: 130.0),
             child: Padding(padding: const EdgeInsets.all(30.0),            child: Form(
              key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                //este es el campo de correo con su respectiva validacion	
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please type your email';
                      }
                      return null;
                    },
                  ),
                ),
                //fin del campo de correo

                //este es el campo de contraseña con su respectiva validacion
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please type your password';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                ),
                    //fin del campo de contraseña


                //este es el boton de ingresa con su respectiva validacion
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      setState(() {
                        isLoading = true;
                      });

                      final response = await login(
                        emailController.text,
                        passwordController.text,
                      );

                      setState(() {
                        isLoading = false;
                      });

                      if (response == 200) {
                        Navigator.pushReplacement(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomePage(
                              email: emailController.text,
                            ),
                          ),
                        );
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Email or password incorrect"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    }
                  },
                  
                  //decoracion del boton de ingresar
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),


                    // este es la barra indicadora de carga
                    child: isLoading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                  ),
                ),

                 //fin del boton de ingresar



                //Boton de registro de usuario 
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                      //fin del boton de registro de usuario

                      
                //este nos devuelve un mensaje de recuperar contraseña no implementado
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Recover password not implemented"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },


                  //este es el boton de recuperar contraseña
                  child: const Text(
                    'Recover password',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
          )
      ),
      )
    );
  
  }
}
