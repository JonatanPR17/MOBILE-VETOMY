import 'package:flutter/material.dart';
import 'custom_drawer.dart'; // Importa el CustomDrawer

class CitasScreen extends StatefulWidget {
  @override
  _CitasScreenState createState() => _CitasScreenState();
}

class _CitasScreenState extends State<CitasScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // GlobalKey para el Scaffold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Asigna la GlobalKey al Scaffold
      backgroundColor: Colors.white,
      drawer: CustomDrawer(scaffoldKey: _scaffoldKey), // Añade el CustomDrawer
      body: SingleChildScrollView( // Añade el SingleChildScrollView
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
                    icon: Icon(Icons.menu, color: Colors.black, size: 30), // Icono del menú
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer(); // Abrir el CustomDrawer
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.blue, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            _buildCalendar(),
            _buildAppointmentInfo(),
            _buildDoctorsList(),
            _buildAddAppointmentButton(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          return _buildCalendarDay('${9 + index}', ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'][index], index == 2);
        }),
      ),
    );
  }

  Widget _buildCalendarDay(String day, String label, bool isSelected) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.white,
            shape: BoxShape.circle,
          ),
          child: Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildAppointmentInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('11 Wednesday - Today', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          _buildAppointmentCard(),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dr. Olivia Turner, M.D.', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.more_horiz, color: Colors.black54),
            ],
          ),
          SizedBox(height: 5),
          Text('Treatment and prevention of skin and photodermatitis.', style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildDoctorsList() {
    List<Map<String, dynamic>> doctors = [
      {'name': 'Dr. Tomy Perez Huamani', 'rating': '5', 'reviews': '60'},
      {'name': 'Dr. Alexander Bennett', 'rating': '4.5', 'reviews': '40'},
      {'name': 'Dr. Sophia Martinez', 'rating': '5', 'reviews': '150'},
      {'name': 'Dr. Michael Davidson', 'rating': '4.8', 'reviews': '90'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: doctors.map((doctor) => _buildDoctorCard(doctor)).toList(),
      ),
    );
  }

  Widget _buildDoctorCard(Map<String, dynamic> doctor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/doctor_placeholder.png'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Veterinario', style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text('${doctor['rating']}  (${doctor['reviews']})'),
                SizedBox(width: 10),
                Icon(Icons.favorite_border, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddAppointmentButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () {},
          child: Text(
            'Agregar Nueva Cita',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}