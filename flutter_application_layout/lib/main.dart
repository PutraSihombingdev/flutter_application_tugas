import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double coverHeight = screenWidth * 0.4; // Sesuaikan tinggi cover
            double profileHeight = screenWidth * 0.25; // Ukuran foto profil
            
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      buildCoverImage(coverHeight),
                      Positioned(
                        top: coverHeight - (profileHeight / 2),
                        child: buildProfileImage(profileHeight),
                      ),
                      Positioned(
                        top: coverHeight + profileHeight * 0.4,
                        child: buildTextProfile(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60), // Beri ruang setelah profil
                  buildInfoSection(screenWidth),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildCoverImage(double height) => Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          image: const DecorationImage(
            image: AssetImage('batur.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget buildProfileImage(double size) => CircleAvatar(
        radius: size / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const AssetImage('saya.jpg'),
      );

  Widget buildTextProfile() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Putra Sihombing',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            'www.linkedin.com/in/putra-sihombing-30199a286',
            style: TextStyle(fontSize: 12, color: Colors.blue),
          ),
        ],
      );

  Widget buildInfoSection(double screenWidth) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: screenWidth < 600 ? 1 : 2, // Jika layar kecil, 1 kolom
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            buildInfoCard(Icons.location_on, 'Lokasi', 'Singaraja', Colors.green),
            buildInfoCard(Icons.school, 'Kampus', 'Undiksha', Colors.blue),
            buildInfoCard(Icons.music_note, 'Genre Musik', 'All Genre', Colors.purple),
            buildInfoCard(Icons.info, 'Detail Saya', 'Profil lengkap', Colors.orange),
          ],
        ),
      );

  Widget buildInfoCard(IconData icon, String title, String value, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontSize: 5, fontWeight: FontWeight.bold)),
            Text(value, style: const TextStyle(fontSize: 5, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
