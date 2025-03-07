import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class ConsultaScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.black, size: 30),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Spacer(),
                  Text(
                    "Consulta",
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
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/logo_company.jpg'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('2/2', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 1.0,
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildTextField('Nombre de la mascota', 'Bella'),
                  _buildTextField('Causa de la cita', 'Heridas en la piel de mi mascota'),
                  _buildTextField('Especie de la mascota', 'Perro'),
                  _buildTextField('Raza', 'Labrador'),
                  _buildTextField('Edad', '5 años'),
                  _buildTextField('Peso', '30 Kg.'),
                  _buildTextField('Síntomas Actuales', 'Tos y letargo'),
                  _buildTextField(
                    'Comentarios Adicionales',
                    'Toby ha estado menos activo de lo habitual y no tiene ganas de jugar.',
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Aceptar',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String text, {int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextField(
            readOnly: true,
            maxLines: maxLines,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
            controller: TextEditingController(text: text),
          ),
        ],
      ),
    );
  }
}
