// import 'package:empower_app/main.dart';
// import 'package:empower_app/rutes.dart';
import 'package:ingresos_egresos/rutes.dart';
// import 'package:empower_app/src/screens/empleate/empleate.dart';
import 'package:ingresos_egresos/src/utils/bar.dart';
import 'package:ingresos_egresos/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0; // Estado para rastrear el ítem seleccionado

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Verifica qué ítem se seleccionó y navega a la pantalla correspondiente
      if (index == 0) {
        Navigator.pushNamed(context, Routes.home);
      }
      if (index == 1) {
        Navigator.pushNamed(context, Routes.queHacer);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizedBox(height: MediaQuery.of(context).size.height * 0.02);
    return Scaffold(
      //el appBar
      appBar: CustomAppBar.buildAppBar(context),

      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
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

            // const Spacer(),
            Expanded(
                child: Image.asset(
              'lib/assets/home2.webp', // Asegúrate de que la ruta de tu imagen sea correcta
              width: MediaQuery.of(context).size.width * 23,
              height: MediaQuery.of(context).size.height * 2,
            )),

            // const Spacer(),
            // Espacio entre el botón y el formulario
          ],
        ),
      ),

      bottomNavigationBar: CustonBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
