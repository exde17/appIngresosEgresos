import 'package:ingresos_egresos/rutes.dart';
import 'package:ingresos_egresos/src/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

TextEditingController _passwordController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _nameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra los elementos dentro de la Row
          children: [
            const Text(
              'HumanSave', // El título
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold, // Hace el texto más grueso
                color: Colors.grey, // Color gris oscuro
              ),
            ),
            const SizedBox(width: 10), // Espacio entre el título y la imagen
            Image.asset(
              'lib/assets/logoHumanSave_transparent.png', // Asegúrate de que la ruta de tu imagen sea correcta
              width: 50,
              height: 50,
            ),
          ],
        ),
        centerTitle:
            true, // Centra el Row, pero no sus contenidos internos individualmente
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.centerRight, // Alinea el botón a la derecha
              child: Padding(
                padding: const EdgeInsets.all(
                    19.0), // Añade un poco de espacio alrededor del botón
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Acción del botón
                  },
                  icon: const Icon(Icons.play_arrow), // Ícono de reproducción
                  label: const Text("Escuchar"), // Texto del botón
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Hace el botón redondeado
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(), // Espacio entre el botón y el formulario

            // Campo de texto para el nombre
            Textt(
              labelText: 'Nombre',
              controller: _nameController,
              onChanged: (value) => {},
            ),

            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),

            Textt(
              labelText: 'Apellido',
              controller: _lastNameController,
              onChanged: (value) => {},
            ),

            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ), // Espacio entre los campos de texto

            Textt(
              labelText: 'Email',
              controller: _emailController,
              onChanged: (value) => {},
            ),

            // Campo de texto para el correo electrónico

            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),

            // Campo de texto para la contraseña
            Textt(
              labelText: 'Contraseña',
              controller: _passwordController,
              onChanged: (value) => {},
            ),

            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
            ),
            //boton de registro
            ElevatedButton(
                onPressed: () => {
                      register(
                          _nameController.text,
                          _lastNameController.text,
                          _emailController.text,
                          _passwordController.text,
                          context)
                    },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Registrarse',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                )),

            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),

            //redes sociales
            Center(
                child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Ajusta el padding según necesites
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Centra los botones en la fila
                        children: [
                          // Botón de Facebook
                          ElevatedButton.icon(
                            icon: const Icon(
                              FontAwesomeIcons.facebookF, // Ícono de Facebook
                              color: Colors.white,
                              size: 40,
                            ),
                            label: const Text(''),
                            onPressed: () {
                              // Lógica para iniciar sesión con Facebook
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                  255, 7, 67, 187), // Color de Facebook
                              shape: const CircleBorder(), // Forma circular
                              padding:
                                  const EdgeInsets.all(11), // Tamaño del botón
                            ),
                          ),

                          const SizedBox(
                              width: 40), // Espacio entre los botones

                          // Botón de Google
                          ElevatedButton.icon(
                            icon: const Icon(
                              FontAwesomeIcons.google, // Ícono de Google
                              color: Colors.white,
                              size: 35,
                            ),
                            label: const Text(''),
                            onPressed: () {
                              // Lógica para iniciar sesión con Google
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                  255, 211, 26, 9), // Color de Google
                              shape: const CircleBorder(), // Forma circular
                              padding:
                                  const EdgeInsets.all(13), // Tamaño del botón
                            ),
                          ),
                          const SizedBox(
                              width: 40), // Espacio entre los botones

                          // Botón de LinkedIn
                          ElevatedButton.icon(
                            icon: const Icon(
                              FontAwesomeIcons.linkedin, // Ícono de LinkedIn
                              color: Colors.white,
                              size: 32,
                            ),
                            label: const Text(''),
                            onPressed: () {
                              // Lógica para iniciar sesión con LinkedIn
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                  255, 2, 141, 215), // Color de LinkedIn
                              shape: const CircleBorder(), // Forma circular
                              padding:
                                  const EdgeInsets.all(14), // Tamaño del botón
                            ),
                          ),
                        ]))),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

//WIDGET PARA LOS LabelText
class Textt extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final void Function(String) onChanged;
  const Textt({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xFFBEBCBC),
            fontWeight: FontWeight.w700,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

Future<void> register(String name, String apellido, String email,
    String password, BuildContext context) async {
  // Aquí puedes mostrar un indicador de progreso si lo deseas

  final Uri url = Uri.parse(
      'https://devempowerapp.gatewayit.co/empowerapp/api/auth/register');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'firstName': name,
      'lastName': apellido,
      'password': password,
      'email': email,
    }),
  );

  // Aquí puedes ocultar el indicador de progreso si lo mostraste

  if (response.statusCode == 200 || response.statusCode == 201) {
    Navigator.pushReplacementNamed(
        // ignore: use_build_context_synchronously
        context,
        Routes.login); // Navega a la pantalla de inicio
  } else {
    // ignore: use_build_context_synchronously
    // showCustomToastWithIcon(context, response.body);
    // Asumiendo que `response.body` es un String que contiene el JSON que mostraste
    var responseBody = response.body;

// Decodifica el String JSON a un mapa
    var decodedResponse = jsonDecode(responseBody);

// Extrae el mensaje
    String message = decodedResponse['message']
        [0]; // Accede al primer elemento de la lista 'message'

// Ahora puedes mostrar el mensaje usando tu función personalizada
// ignore: use_build_context_synchronously
    showCustomToastWithIcon(context, message);
  }
}
