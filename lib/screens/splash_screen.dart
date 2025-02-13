import 'package:flutter/material.dart';
import 'home_screen.dart';  // Asegúrate de importar la pantalla principal

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Espera de 5 segundos antes de ir a la pantalla principal
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) { // Evita errores si el widget ya no está en el árbol
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBFD2F8), // Aplica el color de fondo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/perros.gif',
              height: 200,
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/huellas.gif',
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
