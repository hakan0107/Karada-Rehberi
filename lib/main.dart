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
          _buildMenuCard(context, "Hizmetler & Oteller", Icons.build, Colors.green, null),
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
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$title yapım aşamasında!")));
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

class EmbassyScreen extends StatelessWidget {
  const EmbassyScreen({super.key});
  // ... (Önceki elçilik listesi)
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Konsolosluklar')), body: const Center(child: Text("Elçilikler Listesi"))); 
    // Not: Kod çok uzamasın diye diğer bölümlerdeki uzun listeleri bir sonraki adımda tam dosya olarak vereceğim.
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
      appBar: AppBar(title: const Text('Yüksek Puanlı Restoranlar')),
      body: ListView(
        children: [
          _buildCitySection("Podgorica", [
            {"name": "Restoran Niagara", "rating": "4.8 ★", "desc": "Şelale manzaralı et ve balık restoranı.", "map": "https://www.google.com/maps/search/Restoran+Niagara+Podgorica"},
            {"name": "Pod Volat", "rating": "4.6 ★", "desc": "Geleneksel Balkan mutfağı ve cevapcici.", "map": "https://www.google.com/maps/search/Pod+Volat+Podgorica"},
            {"name": "Hemera Restaurant", "rating": "4.7 ★", "desc": "Şık atmosfer, uluslararası mutfak.", "map": "https://www.google.com/maps/search/Hemera+Restaurant+Podgorica"},
          ]),
          _buildCitySection("Kotor", [
            {"name": "Stari Mlini", "rating": "4.8 ★", "desc": "Tarihi su değirmeninde eşsiz deniz ürünleri.", "map": "https://www.google.com/maps/search/Stari+Mlini+Kotor"},
            {"name": "Galion", "rating": "4.7 ★", "desc": "Körfez manzaralı romantik balık restoranı.", "map": "https://www.google.com/maps/search/Galion+Kotor"},
          ]),
          _buildCitySection("Budva", [
            {"name": "Jadran Kod Krsta", "rating": "4.6 ★", "desc": "Sahilde meşhur deniz ürünleri restoranı.", "map": "https://www.google.com/maps/search/Jadran+Kod+Krsta+Budva"},
            {"name": "Dvoriste by Jadranka", "rating": "4.8 ★", "desc": "Gizli bahçede özel Akdeniz lezzetleri.", "map": "https://www.google.com/maps/search/Dvoriste+by+Jadranka+Budva"},
          ]),
        ],
      ),
    );
  }

  Widget _buildCitySection(String city, List<Map<String, String>> restaurants) {
    return ExpansionTile(
      title: Text(city, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      children: restaurants.map((r) => ListTile(
        leading: const Icon(Icons.restaurant_menu, color: Colors.orange),
        title: Text(r['name']!),
        subtitle: Text("${r['rating']} - ${r['desc']}"),
        trailing: IconButton(icon: const Icon(Icons.map, color: Colors.red), onPressed: () => _launchURL(r['map']!)),
      )).toList(),
    );
  }
}
