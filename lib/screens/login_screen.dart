import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),

            // Flecha de retroceso
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

            // Logo con borde redondo y sombra
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
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Outfit',
              ),
            ),

            SizedBox(height: 5),

            Text(
              "Inicia sesión ahora",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            SizedBox(height: 20),

            _buildTextField("Correo electrónico", false),
            SizedBox(height: 10),
            _buildTextField("Contraseña", true),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 200),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                "Ingresar",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 10),

            TextButton(
              onPressed: () {},
              child: Text(
                "Olvidé mi contraseña",
                style: TextStyle(color: Colors.blue),
              ),
            ),

            SizedBox(height: 20),

            Text(
              "o conéctate con:",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
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
    );
  }

  Widget _buildTextField(String hintText, bool isPassword) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        suffixIcon: isPassword ? Icon(Icons.visibility_off) : null,
      ),
    );
  }

  Widget _buildSocialButton(String imagePath) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFFD0E4FF),
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xFF159EEC), width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Image.asset(imagePath),
      ),
    );
  }
}