import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/LoginForm.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String impression;

  ProfilePage({
    required this.name,
    required this.impression,
  });

  Future<bool?> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Log Out'),
          content: Text('Anda yakin ingin keluar?'),
          actions: <Widget>[
            TextButton(
              child: Text('Ya'),
              onPressed: () {
                Navigator.pop(context, true); // Mengembalikan nilai true
              },
            ),
            TextButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.pop(context, false); // Mengembalikan nilai false
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage("assets/images/group.png"),
              ),
              SizedBox(height: 20.0),
              Text(
                name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50.0),
              Text(
                'Nama Anggota :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                impression,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () async {
                  bool? logoutConfirmed = await _showLogoutConfirmationDialog(context);
                  if (logoutConfirmed != null && logoutConfirmed) {
                    // Lakukan logika log out di sini, misalnya menghapus token atau mereset status login
                    // Setelah log out berhasil, pindahkan ke halaman LoginForm()
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginForm()),
                    );
                  }
                },
                child: Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(
      name: 'KELOMPOK 12',
      impression: 'JALU WRUHANTARA | FAIZ ROSYID MARUF',
    ),
  ));
}