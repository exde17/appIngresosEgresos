import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key})
      : super(key: key); // Agrega el parámetro key al constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmpowerApp'),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla principal'),
      ),
      bottomNavigationBar: const CustonBottomNavigation(
        selectedIndex: 0, // Puedes cambiar esto según sea necesario
        onItemTapped: null, // Puedes definir una función aquí si es necesario
      ),
    );
  }
}

class CustonBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onItemTapped;

  const CustonBottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key); // Agrega el parámetro key al constructor

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Consejos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.room_service), label: 'Servicios'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800], // Color seleccionado
      onTap: onItemTapped,
    );
  }
}
