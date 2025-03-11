import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double coverHeight = screenWidth * 0.4;
    double profileSize = screenWidth * 0.25;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Saya', 
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xFF1E3A8A), 
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                buildCoverImage(coverHeight),
                Positioned(
                  top: coverHeight - (profileSize / 2),
                  child: buildProfileImage(profileSize),
                ),
                Positioned(
                  top: coverHeight + profileSize * 0.4,
                  child: buildTextProfile(screenWidth),
                ),
              ],
            ),
            SizedBox(height: profileSize * 0.20), // Menurunkan box info
            buildInfoSection(screenWidth),
          ],
        ),
      ),
    );
  }

  Widget buildCoverImage(double height) => Container(
        width: double.infinity,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/batur.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget buildProfileImage(double size) => CircleAvatar(
        radius: size / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const AssetImage('assets/saya.jpg'),
      );

  Widget buildTextProfile(double screenWidth) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenWidth * 0.05),
          Text(
            'Putra Sihombing',
            style: TextStyle(
              fontSize: screenWidth * 0.06, // Ukuran teks adaptif
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'www.linkedin.com/in/putra-sihombing-30199a286',
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.blue,
            ),
          ),
        ],
      );

  Widget buildInfoSection(double screenWidth) => Padding(
        padding: EdgeInsets.only(top: screenWidth * 0.23, left: 20, right: 20),
        child: GridView.count(
          crossAxisCount: screenWidth < 600 ? 2 : 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: [
            buildInfoCard(Icons.location_on, 'Lokasi', 'Singaraja', Colors.green, screenWidth),
            buildInfoCard(Icons.school, 'Kampus', 'Undiksha', Colors.blue, screenWidth),
            buildInfoCard(Icons.music_note, 'Genre Musik', 'All Genre', Colors.purple, screenWidth),
            buildInfoCard(Icons.info, 'Detail Saya', 'Profil lengkap', Colors.orange, screenWidth),
          ],
        ),
      );

  Widget buildInfoCard(IconData icon, String title, String value, Color color, double screenWidth) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: screenWidth * 0.1, color: color), // Ikon adaptif
            const SizedBox(height: 5),
            Text(title, style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold)),
            Text(value, style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
