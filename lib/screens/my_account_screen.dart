import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'change_password.dart';
import 'custom_drawer.dart'; // Importa el CustomDrawer
import 'dart:io'; // Para trabajar con archivos de imagen

class MiCuentaScreen extends StatefulWidget {
  @override
  _MiCuentaScreenState createState() => _MiCuentaScreenState();
}

class _MiCuentaScreenState extends State<MiCuentaScreen> {
  bool _isEditing = false; // Controla si los campos están habilitados o no
  bool _showMoreOptions = false; // Controla si la opción "Más opciones" debe mostrarse
  File? _profileImage; // Variable para almacenar la imagen seleccionada

  final ImagePicker _picker = ImagePicker(); // Instancia del ImagePicker
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // GlobalKey para el Scaffold

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
    return Scaffold(
      key: _scaffoldKey, // Asigna la GlobalKey al Scaffold
      backgroundColor: Colors.white,
      drawer: CustomDrawer(scaffoldKey: _scaffoldKey), // Añade el CustomDrawer
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.black, size: 30),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Spacer(),
                  Text(
                    "Mi cuenta",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.blue, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Foto de perfil
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!) // Si hay una imagen seleccionada, la mostramos
                          : AssetImage('assets/images/logo_company.jpg') as ImageProvider, // Imagen por defecto
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: _pickImage, // Llamamos a la función para seleccionar la imagen
                        child: Container(
                          padding: EdgeInsets.all(8), // Tamaño del contenedor
                          decoration: BoxDecoration(
                            color: Color(0xFF159EEC), // Celeste
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18, // Tamaño del icono
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildTextField("Nombre completo", "Jonatan Alexander Paitan Romero", false),
              SizedBox(height: 10),
              _buildTextField("Correo electrónico", "i2316622@continental.edu.pe", false),
              SizedBox(height: 10),
              _buildTextField("Contraseña", "****************", true),

              Visibility(
                visible: _isEditing, // Mostrar solo cuando estamos en modo de edición
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Acción para ir a la pantalla de nueva contraseña
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CambiarContrasenaScreen()),
                        );
                      },
                      child: Text("Más opciones"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              _buildTextField("Fecha de nacimiento", "20/20/2020", false),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing; // Cambiar el estado de edición
                    if (_isEditing) {
                      _showMoreOptions = true; // Mostrar "Más opciones" cuando se haga clic en editar
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  _isEditing ? "Guardar" : "Editar",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Comfortaa'),
        ),
        SizedBox(height: 5),
        TextField(
          enabled: _isEditing,  // Habilitar o deshabilitar el campo según _isEditing
          obscureText: isPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            hintText: value,
            hintStyle: TextStyle(fontSize: 14, fontFamily: 'Outfit', color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
