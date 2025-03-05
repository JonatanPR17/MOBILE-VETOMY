import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Importa la pantalla de carga
import 'screens/home_screen.dart'; // Importa la pantalla principal
import 'screens/login_screen.dart'; //Importa la pantalla de login
import 'screens/welcome_screen.dart';
import 'screens/new_account_screen.dart';
import 'screens/my_account_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/configuration_screen.dart';
import 'package:localstorage/localstorage.dart';
import 'screens/recover_account_screen.dart';
import 'screens/verify_mail_screen.dart';
import 'screens/create_new_password_screen.dart';
import 'screens/my_pet_screen.dart';
import 'screens/history_screen.dart';
import 'screens/history_2_screen.dart';
import 'screens/my_appointments_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
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
      debugShowCheckedModeBanner: false,
      initialRoute: '/account',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/register': (context) => NuevaCuentaScreen(),
        '/account': (context) => MiCuentaScreen(),
        '/notifications': (context) => NotificacionesScreen(),
        '/configuraciones': (context) => ConfiguracionesScreen(),
        '/recuperar': (context) => RecuperarCuentaScreen(),
        '/verificar': (context) => VerificarCorreoScreen(),
        '/crear': (context) => CrearNuevaContrasenaScreen(),
        '/mascota': (context) => MiMascotaScreen(),
        '/historial': (context) => HistorialScreen(),
        '/historial2': (context) => Historial2Screen(),
        '/citas': (context) => CitasScreen(),

      },
    );
  }
}
