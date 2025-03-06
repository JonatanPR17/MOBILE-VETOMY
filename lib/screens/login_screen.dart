import 'package:flutter/material.dart';
import 'package:vetomymobile/data/usecase/authentication_usecase_imp.dart';
import '../screens/recover_account_screen.dart';
import 'package:vetomymobile/domain/auth/models/login_request.dart';
import 'welcome_screen.dart'; // Importa la nueva pantalla

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  HTTP_STATES login_state = HTTP_STATES.NONE;

  @override
  Widget build(BuildContext context) {
    String loginText =
        this.login_state != HTTP_STATES.LOADING ? "Ingresar" : "Cargando";
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.blue, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 20),
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
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/logo_company.jpg'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "¡Bienvenido!",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comfortaa',
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Inicia sesión ahora",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Outfit',
                ),
              ),
              SizedBox(height: 20),
              _buildTextField("Correo electrónico", false),
              SizedBox(height: 10),
              _buildTextField("Contraseña", true),
              SizedBox(height: 20),
              ElevatedButton(
                //enabled: this.login_state =! HTTP_STATES.LOADING,
                onPressed: this.login_state != HTTP_STATES.LOADING
                    ? () => login(context)
                    : () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  loginText,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  softWrap: false,
                ),
              ),
              SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RecuperarCuentaScreen()),
                  );
                },
                child: Text(
                  "Olvidé mi contraseña",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 50),
              Text(
                "o conéctate con:",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black38,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton('assets/images/google.png'),
                  SizedBox(width: 15),
                  _buildSocialButton('assets/images/facebook.png'),
                  SizedBox(width: 15),
                  _buildSocialButton('assets/images/huella_dactilar.png'),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, bool isPassword) {
    return TextField(
      controller: isPassword ? _passwordController : _emailController,
      obscureText: isPassword && !_isPasswordVisible,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
      ),
    );
  }

  Widget _buildSocialButton(String imagePath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFD0E4FF),
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xFF159EEC), width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Image.asset(
          imagePath,
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  void login(BuildContext context) {
    AuthenticationUsecaseImpl _auth = AuthenticationUsecaseImpl();
    LoginRequest reqData = LoginRequest(
      mail: _emailController.text,
      password: _passwordController.text,
    );

    print(reqData);
    setState(() {
      login_state = HTTP_STATES.LOADING;
    });
    _auth.login(reqData).then((profile) {
      print("${profile.name} ${profile.lastName} -- ${profile.rol!.name}");
      setState(() {
        login_state = HTTP_STATES.DONE;
      });
      SnackBar snackBar = SnackBar(
        content: Text("¡Login exitoso!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    }).catchError((err) {
      setState(() {
        login_state = HTTP_STATES.ERROR;
      });
      print(err);
      SnackBar snackBar = SnackBar(
        content: Text(
            "No se pudo iniciar sesión, verifica tus credenciales e inténtalo nuevamente"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}

enum HTTP_STATES {
  LOADING,
  DONE,
  ERROR,
  NONE,
}
