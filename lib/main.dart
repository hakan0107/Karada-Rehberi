import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MontenegroApp());

class MontenegroApp extends StatelessWidget {
  const MontenegroApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Montenegro Travel',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MainDashboard(),
    );
  }
}

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Montenegro Super App')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuCard(context, "Konsolosluklar", Icons.flag, Colors.indigo, const EmbassyScreen()),
          _buildMenuCard(context, "Restoranlar", Icons.restaurant, Colors.orange, const RestaurantsScreen()),
          _buildMenuCard(context, "Gezilecek Yerler", Icons.place, Colors.blue, const PlacesScreen()),
          _buildMenuCard(context, "Hizmetler & Oteller", Icons.hotel, Colors.green, const ServicesScreen()),
          _buildMenuCard(context, "Pratik Bilgiler", Icons.info_outline, Colors.purple, const PracticalInfoScreen()),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, Widget page) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Gezilecek Yerler')), body: const Center(child: Text("Bölge listeleri aktif.")));
  }
}

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Restoranlar')), body: const Center(child: Text("Restoranlar listesi aktif.")));
  }
}

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Hizmetler')), body: const Center(child: Text("Hizmetler listesi aktif.")));
  }
}

class EmbassyScreen extends StatelessWidget {
  const EmbassyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Konsolosluklar')), body: const Center(child: Text("Konsolosluklar listesi aktif.")));
  }
}

class PracticalInfoScreen extends StatelessWidget {
  const PracticalInfoScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pratik Bilgiler')),
      body: ListView(
        children: [
          const ExpansionTile(
            title: Text("🚨 Acil Durum Numaraları", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
            children: [
              ListTile(title: Text("Polis: 122"), leading: Icon(Icons.local_police)),
              ListTile(title: Text("İtfaiye: 123"), leading: Icon(Icons.fire_truck)),
              ListTile(title: Text("Ambulans: 124"), leading: Icon(Icons.medical_services)),
            ],
          ),
          ExpansionTile(
            title: Text("🚕 Taksi Durakları", style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(title: Text("Naš Taxi"), subtitle: Text("Podgorica yerel taksi servisi"), leading: Icon(Icons.local_taxi)),
              ListTile(title: Text("Peugeot Taxi"), subtitle: Text("Popüler taksi seçeneği"), leading: Icon(Icons.local_taxi)),
            ],
          ),
          ExpansionTile(
            title: Text("📱 eSIM & İnternet", style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(title: Text("One Montenegro (eSIM)"), leading: Icon(Icons.sim_card), onTap: () => _launchURL("https://www.me.one/")),
            ],
          ),
        ],
      ),
    );
  }
}
