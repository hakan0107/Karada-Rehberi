import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MontenegroApp());

class MontenegroApp extends StatelessWidget {
  const MontenegroApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          _buildMenuCard(context, "Gezilecek Yerler", Icons.place, Colors.blue, null),
          _buildMenuCard(context, "Hizmetler & Oteller", Icons.hotel, Colors.green, null),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, Widget? page) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          if (page != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$title yakında aktif!")));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon, size: 50, color: color), const SizedBox(height: 10), Text(title, style: const TextStyle(fontWeight: FontWeight.bold))],
        ),
      ),
    );
  }
}

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restoranlar')),
      body: ListView(
        children: [
          _buildCitySection("Podgorica", [
            {"name": "Stara Kuća", "rating": "4.7 ★", "desc": "Geleneksel yapı ve lezzet.", "map": "https://www.google.com/maps/search/Stara+Kuca+Podgorica"},
            {"name": "Salaš 23", "rating": "4.8 ★", "desc": "Otantik köy mutfağı.", "map": "https://www.google.com/maps/search/Salas+23+Podgorica"},
            {"name": "Djedovina", "rating": "4.7 ★", "desc": "Atalarımızın tarifleri.", "map": "https://www.google.com/maps/search/Djedovina+Podgorica"},
          ]),
          _buildCitySection("Kotor", [
            {"name": "Stari Mlini", "rating": "4.8 ★", "desc": "Tarihi su değirmeni.", "map": "https://www.google.com/maps/search/Stari+Mlini+Kotor"},
          ]),
        ],
      ),
    );
  }

  Widget _buildCitySection(String city, List<Map<String, String>> restaurants) {
    return ExpansionTile(
      title: Text(city, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: restaurants.map((r) => ListTile(
        title: Text(r['name']!),
        subtitle: Text("${r['rating']} - ${r['desc']}"),
        trailing: IconButton(icon: const Icon(Icons.map, color: Colors.red), onPressed: () => _launchURL(r['map']!)),
      )).toList(),
    );
  }
}

class EmbassyScreen extends StatelessWidget {
  const EmbassyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Konsolosluklar')), body: const Center(child: Text("Elçilik bilgileri yüklenecek...")));
  }
}
