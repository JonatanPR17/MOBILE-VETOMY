import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'my_account_screen.dart';
import 'store_screen.dart';
import 'my_appointments_screen.dart';
import 'my_pet_screen.dart';
import 'my_purchases_screen.dart';
import 'configuration_screen.dart';
import 'close_session_screen.dart';
import 'package:image_picker/image_picker.dart'; // Importa para la selección de imágenes
import 'dart:io'; // Importa para manejar archivos de imagen

class CustomDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  // Constructor que recibe la GlobalKey
  CustomDrawer({required this.scaffoldKey});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  File? _profileImage; // Variable para almacenar la imagen seleccionada
  final ImagePicker _picker = ImagePicker(); // Instancia del ImagePicker

  // Función para seleccionar una imagen desde la galería o cámara
  Future<void> _pickImage() async {
    // Seleccionar imagen desde la galería
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path); // Asignar la imagen seleccionada
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // Parte superior del menú (Drawer Header)
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white, // Fondo blanco
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    // Foto de perfil
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!) // Si hay una imagen seleccionada, la mostramos
                          : AssetImage('assets/images/logo_company.jpg') as ImageProvider, // Imagen por defecto
                    ),
                    // Ícono de lápiz sobre la foto de perfil
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: _pickImage, // Llamamos a la función para seleccionar la imagen
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xFF159EEC), // Celeste
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 15, // Tamaño del icono como en tu versión original
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Nombre del usuario debajo de la foto de perfil
                Text(
                  "Paitan Romero Jonatan", // Aquí puedes cambiar el nombre si es necesario
                  style: TextStyle(
                    color: Colors.black, // Texto en negro
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Parte inferior del menú con opciones
          Expanded(
            child: Container(
              color: Colors.black, // Fondo negro
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(height: 20),
                  // Envuelve cada ListTile en un widget Material
                  _buildListTile(context, Icons.person, 'Mi Cuenta', MiCuentaScreen()),
                  _buildListTile(context, Icons.home, 'Inicio', WelcomeScreen()),
                  _buildListTile(context, Icons.store, 'Tienda', TiendaScreen()),
                  _buildListTile(context, Icons.calendar_today, 'Citas', CitasScreen()),
                  _buildListTile(context, Icons.pets, 'Mi Mascota', MiMascotaScreen()),
                  _buildListTile(context, Icons.shopping_cart, 'Mis Compras', MisComprasScreen()),
                  _buildListTile(context, Icons.settings, 'Configuración', ConfiguracionesScreen()),
                  _buildListTile(context, Icons.exit_to_app, 'Cerrar sesión', null),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Método que construye los ListTiles envueltos en Material para el cambio de color
  Widget _buildListTile(BuildContext context, IconData icon, String title, Widget? screen) {
    return Material(
      color: Colors.transparent, // Color de fondo transparente
      child: InkWell(
        onTap: () {
          Navigator.pop(context); // Cierra el Drawer
          if (title == 'Cerrar sesión') {
            // Si el título es "Cerrar sesión", invoca el cierre de sesión
            cerrarSesion(context); // Llamada a la función de cerrar sesión
          } else {
            // Si no es "Cerrar sesión", navega a la pantalla correspondiente
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen!),
            );
          }
        },
        splashColor: Color(0xFF159EEC), // Color al hacer "splash" (tacto)
        highlightColor: Color(0xFF159EEC), // Color de highlight (hover)
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.white, // Color por defecto del ícono
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}