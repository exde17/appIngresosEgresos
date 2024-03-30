import 'dart:async';
import 'package:ingresos_egresos/rutes.dart';
import 'package:ingresos_egresos/src/utils/bar.dart';
import 'package:ingresos_egresos/src/utils/bottom_navigation.dart.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Ubica extends StatefulWidget {
  const Ubica({Key? key}) : super(key: key);

  @override
  UbicaState createState() => UbicaState();
}

class UbicaState extends State<Ubica> {
  int _selectedIndex = 0;
  LatLng? _currentPosition;

  GoogleMapController? mapController; // Controlador para Google Map
  Location location = Location();
  StreamSubscription<LocationData>? _locationSubscription;
  // LatLng _currentPosition = const LatLng(8.766715943538037, -75.86097289347256); // Un valor predeterminado
  LatLng alamedas = const LatLng(8.763424695364305, -75.87359486585017);
  LatLng buenaVista = const LatLng(8.778890994380614, -75.86153321796318);
  LatLng nuestro = const LatLng(8.743094687106142, -75.86814777563593);
// Agrega aquí más rutas predefinidas

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  final Set<Marker> _markers = {};

  void _updateUserLocationMarker(LatLng position) {
    setState(() {
      _markers.removeWhere(
          (marker) => marker.markerId == const MarkerId('userLocation'));
      _markers.add(
        Marker(
          markerId: const MarkerId('userLocation'),
          position: position,
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  void _getCurrentLocation() {
    _locationSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentPosition =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _updateUserLocationMarker(_currentPosition!);
        _goToRoute(_currentPosition!);
      });
    });
  }

  void _goToRoute(LatLng route) {
    _locationSubscription
        ?.cancel(); // Detiene la suscripción a cambios de ubicación si la hay.
    setState(() {
      _currentPosition =
          route; // Actualiza la posición actual con la nueva ruta.
      _updateUserLocationMarker(
          route); // Actualiza el marcador a la nueva ubicación.
    });
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: route, zoom: 14.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar.buildAppBar(context),
      //menu lateral
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent, // Cambia esto al color que desees
              ),
              accountName: Text("Usuario"),
              accountEmail: Text("usuario@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "U",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            // ListTile(
            //   leading: const Icon(Icons.home),
            //   title: const Text('Inicio'),
            //   onTap: () {
            //     // Navigator.pushNamed(context, Routes.ubica);
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () {
                // Navigator.pushNamed(context, Routes.queHacer);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_alarm_outlined),
              title: const Text('Que hacer'),
              onTap: () {
                Navigator.pushNamed(context, Routes.queHacer);
                // Navigator.pop(context);
              },
            ),
            // Agrega más ListTile aquí para más opciones
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              // color: const Color.fromARGB(
              //     255, 237, 236, 236), // Color de fondo del Container interno
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.05,
                // ),
                // Container(
                //   width: double.infinity,
                //   // color: const Color(0xFF03ABA2),
                //   padding: const EdgeInsets.all(16.0),
                //   child: Text(
                //     'UBICA AL NIÑO',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: MediaQuery.of(context).size.height * 0.04,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent, // Color del contenedor
                    borderRadius: BorderRadius.circular(10), // Radio del borde
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'UBICA AL NIÑO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      fontWeight: FontWeight.bold,
                      fontFamily: '.SF UI Display',
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Container(
                  // color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Color del contenedor
                    borderRadius: BorderRadius.circular(10), // Radio del borde
                    border: Border.all(
                      // Agrega esto
                      color: const Color.fromARGB(
                          255, 219, 217, 217), // Color del borde
                      width: MediaQuery.of(context).size.width *
                          0.01, // Ancho del borde
                    ),
                  ),
                  child: Text(
                    'Con solo tocar un botón, podrás visualizar la ubicación exacta de tus hijos en tiempo real, asegurando su seguridad y tu tranquilidad. Asegúrate de que el dispositivo de tu hijo tenga activada la función de localización para utilizar esta característica efectivamente.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.026,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Color del contenedor
                    borderRadius: BorderRadius.circular(10), // Radio del borde
                    border: Border.all(
                      // Agrega esto
                      color: const Color.fromARGB(
                          255, 219, 217, 217), // Color del borde
                      width: MediaQuery.of(context).size.width *
                          0.01, // Ancho del borde
                    ),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: _currentPosition == null
                        ? const Center(
                            child:
                                CircularProgressIndicator()) // Muestra un indicador de carga mientras la ubicación está cargando
                        : GoogleMap(
                            onMapCreated: (GoogleMapController controller) {
                              mapController = controller;
                            },
                            initialCameraPosition: CameraPosition(
                              target: _currentPosition!,
                              zoom: 14.0,
                            ),
                            myLocationEnabled:
                                true, // Muestra el botón de ubicación actual
                          ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _goToRoute(alamedas);
                      },
                      child: const Text('Ir a Alamedas'),
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.02,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     _goToRoute(buenaVista);
                    //   },
                    //   child: const Text('Ir a BuenaVista'),
                    // ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.02,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     _goToRoute(nuestro);
                    //   },
                    //   child: const Text('Ir a Nuestro Hogar'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      //bottoms navigations
      // bottomNavigationBar: CustonBottomNavigation(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: _onItemTapped,
      // )
    );
  }
}
