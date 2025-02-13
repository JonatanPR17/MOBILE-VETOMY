import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';  // Importa la pantalla de carga
import 'screens/home_screen.dart';   // Importa la pantalla principal

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veterinaria App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),  // Pantalla de carga inicial
      routes: {
        '/home': (context) => HomeScreen(),  // Pantalla principal
      },
    );
  }
}
