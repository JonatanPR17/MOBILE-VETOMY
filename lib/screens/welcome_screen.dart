import 'package:flutter/material.dart';
import 'custom_drawer.dart';  // Importamos la clase CustomDrawer

class WelcomeScreen extends StatelessWidget {
  // Crea una GlobalKey para el Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,  // Asigna la GlobalKey al Scaffold
      backgroundColor: Colors.white,
      // Drawer añadido al Scaffold
      drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40), // Espacio superior
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, size: 30, color: Colors.black87),
                    onPressed: () {
                      // Ahora usamos la GlobalKey para abrir el Drawer
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Text(
                    "¡Bienvenido!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/logo_company.jpg'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            
            // Stack para superponer el contenedor encima de la imagen
            Stack(
              children: [
                // Imagen de fondo
                ClipRRect(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                  child: Image.asset(
                    'assets/images/doctor.jpg', // Asegúrate de tener esta imagen en tu proyecto
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                
                // Contenedor superpuesto encima de la imagen
                Positioned(
                  top: 525, // Ajusta la distancia desde la parte superior
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,  // Hace que el Container ocupe todo el ancho de la pantalla
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda
                      children: [
                        Text(
                          "Usuario",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Jonatan Paitan Romero"),
                        SizedBox(height: 20),
                        Text(
                          "Datos personales",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Id/Clave: KJM-283743"),
                        Text("Sexo: Hombre"),
                        Text("Edad: 24"),
                        Text("Otro:"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
