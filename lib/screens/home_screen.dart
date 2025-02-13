import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cambié el color de fondo a blanco
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40), // Espacio superior
          Text(
            "Dr. Tomy",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'Comfortaa',
            ),
          ),
          SizedBox(height: 10),
          Stack(
            alignment: Alignment.center,
            children: [
              Divider(
                color: Colors.blue, // Línea azul
                thickness: 2,
                indent: 80,
                endIndent: 80,
              ),
              Image.asset(
                'assets/images/logo_company.jpg',
                height: 60, // Tamaño del logo
              ),
            ],
          ),
          SizedBox(height: 20),
          Image.asset(
            'assets/images/perro_home.png',
            height: 250, // Imagen del perro
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {}, // Acción de ingresar
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                  ),
                  child: Text("Ingresar", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {}, // Acción de registrarse
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  child: Text("Registrarme", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
          SizedBox(height: 120),
        ],
      ),
    );
  }
}
