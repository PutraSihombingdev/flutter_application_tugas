import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final double coverHeight =280;
  final double profileHeight = 144;
  

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight /2;
    
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
              buildCoverImage(),
              Positioned(top: top,
              child :buildProfileImage(),
              ), 
               
          ],
        ),
      ),
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset('batur.jpg'), 
        width: double.infinity,
        height: coverHeight,

      );
      Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: AssetImage('saya.jpg'), // Perbaikan di sini
    );
      
      
      
      
      

}
