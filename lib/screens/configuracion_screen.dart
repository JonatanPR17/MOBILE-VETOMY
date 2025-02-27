import 'package:flutter/material.dart';
import 'package:vetomymobile/screens/cambiar_contraseña.dart';
import 'package:vetomymobile/screens/notifications.dart';

class ConfiguracionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.blue, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 10),
                Text(
                  "Configuraciones",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          _buildConfigOption(
            context,
            "Notificaciones",
            Icons.lightbulb_outline,
            () {
              // Acción al tocar "Notificaciones", por ejemplo, navegar a una nueva pantalla
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificacionesScreen()),
              );
            },
          ),
          _buildConfigOption(
            context,
            "Contraseña",
            Icons.vpn_key_outlined,
            () {
              // Acción al tocar "Contraseña", por ejemplo, navegar a una nueva pantalla
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CambiarContrasenaScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildConfigOption(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: onTap, // Ejecuta la acción cuando se toca la opción
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Alineamos verticalmente
          children: [
            Icon(icon, color: Colors.blue, size: 24),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Comfortaa',
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.black38, size: 18),
          ],
        ),
      ),
    );
  }
}