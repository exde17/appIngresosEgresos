// import 'dart:js';

// import 'package:empower_app/rutes.dart';
// import 'package:flutter/material.dart';

// class CustomAppBar {
//   static AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.black,
//       automaticallyImplyLeading: false,

//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'HumanSave',
//             style: TextStyle(
//               fontSize: MediaQuery.of(context).size.width * 0.07,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.02,
//           ),
//           Image.asset(
//             'lib/assets/logoHumanSave_transparent.png',
//             width: MediaQuery.of(context).size.width * 0.08,
//             height: MediaQuery.of(context).size.width * 0.08,
//           ),
//         ],
//       ),
//       centerTitle: true,
//       // //boton de opciones
//       // leading: IconButton(
//       //   icon: const Icon(Icons.menu), // Ícono de menú
//       //   onPressed: () {
//       //     // Acción del botón
//       //   },
//       // ),
//       actions: <Widget>[
//         PopupMenuButton<String>(
//           onSelected: (String value) {
//             if (value == 'perfil') {
//               // Navega a la pantalla de perfil
//             } else if (value == 'cerrar_sesion') {
//               Navigator.pushReplacementNamed(context, Routes.login);
//             }
//           },
//           itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//             const PopupMenuItem<String>(
//               value: 'perfil',
//               child: Text('Perfil'),
//             ),
//             const PopupMenuItem<String>(
//               value: 'cerrar_sesion',
//               child: Text('Cerrar sesión'),
//             ),
//           ],
//           icon: Icon(Icons.person,
//               // color: Theme.of(context).primaryColor,
//               color: Colors.white,
//               size: MediaQuery.of(context).size.width * 0.08),
//         ),
//       ],
//     );
//   }
// }

import 'package:ingresos_egresos/rutes.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  static AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading:
          false, // Mantén esto en false ya que vamos a agregar nuestro propio botón
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu,
              color: Colors.white), // Este es el botón de menú
          onPressed: () =>
              Scaffold.of(context).openDrawer(), // Esto abre el menú lateral
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'HumanSave',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.07,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Image.asset(
            'lib/assets/logoHumanSave_transparent.png',
            width: MediaQuery.of(context).size.width * 0.08,
            height: MediaQuery.of(context).size.width * 0.08,
          ),
        ],
      ),
      centerTitle: true,
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'perfil') {
              // Navega a la pantalla de perfil
            } else if (value == 'cerrar_sesion') {
              Navigator.pushReplacementNamed(context, Routes.login);
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'perfil',
              child: Text('Perfil'),
            ),
            const PopupMenuItem<String>(
              value: 'cerrar_sesion',
              child: Text('Cerrar sesión'),
            ),
          ],
          icon: Icon(Icons.person,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.08),
        ),
      ],
    );
  }
}
