import 'package:flutter/material.dart';
import 'package:vetomymobile/screens/query_screen.dart';
import 'custom_drawer.dart'; // Importa el CustomDrawer

// Pantalla de datos personales
class DatosPersonalesScreen extends StatefulWidget {
  @override
  _DatosPersonalesScreenState createState() => _DatosPersonalesScreenState();
}

class _DatosPersonalesScreenState extends State<DatosPersonalesScreen> {
  String selectedDay = '02';
  String selectedMonth = '08';
  String selectedYear = '2005';
  String selectedAge = '20';
  String selectedGender = 'Hombre';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // GlobalKey para el Scaffold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Asigna la GlobalKey al Scaffold
      backgroundColor: Colors.white,
      drawer: CustomDrawer(scaffoldKey: _scaffoldKey), // Drawer personalizado
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
                    "Datos Personales",
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
                      Text('1/2', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Clave: KJM-283743'),
                        Row(
                          children: [
                            Text('Fecha: 14/12/2022'),
                            SizedBox(width: 5),
                            Icon(Icons.calendar_today, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextField('Nombre', 'Jonatan Paitan Romero'),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fecha de nacimiento',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDropdown(['02', '03', '04'], selectedDay, (value) {
                        setState(() => selectedDay = value!);
                      }),
                      _buildDropdown(['08', '09', '10'], selectedMonth, (value) {
                        setState(() => selectedMonth = value!);
                      }),
                      _buildDropdown(['2005', '2004', '2003'], selectedYear, (value) {
                        setState(() => selectedYear = value!);
                      }),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDropdown(['20', '21', '22'], selectedAge, (value) {
                        setState(() => selectedAge = value!);
                      }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sexo*', style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              _buildRadio('Hombre'),
                              _buildRadio('Mujer'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildTextField('Teléfono', '+51 987654321'),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50, // Ajuste de altura igual al botón "Aceptar"
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25), // Bordes redondeados
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ConsultaScreen()),
                        );
                      },
                      child: Text(
                        'Siguiente',
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

  // Método para construir los campos de texto
  Widget _buildTextField(String label, String initialValue) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      controller: TextEditingController(text: initialValue),
    );
  }

  // Método para construir los dropdowns de selección
  Widget _buildDropdown(List<String> items, String selectedValue, Function(String?) onChanged) {
    return DropdownButton<String>(
      value: selectedValue,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  // Método para construir los botones de radio para seleccionar el género
  Widget _buildRadio(String gender) {
    return Row(
      children: [
        Radio<String>(
          value: gender,
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() => selectedGender = value!);
          },
        ),
        Text(gender),
      ],
    );
  }
}
