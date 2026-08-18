import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MontenegroApp());

class MontenegroApp extends StatelessWidget {
  const MontenegroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Montenegro Super App',
      theme: ThemeData(primarySwatch: Colors.red, scaffoldBackgroundColor: Colors.grey[100]),
      home: const MainDashboard(),
    );
  }
}

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Karadağ Rehberim'), centerTitle: true, backgroundColor: Colors.redAccent),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildMenuCard(context, "Hava Durumu", Icons.wb_sunny, Colors.amber, const WeatherScreen()),
            _buildMenuCard(context, "Trafik & Ulaşım", Icons.directions_car, Colors.teal, const TransportScreen()),
            _buildMenuCard(context, "Pratik Kelimeler", Icons.translate, Colors.blueGrey, const PhrasesScreen()),
            _buildMenuCard(context, "Gezilecek Yerler", Icons.landscape, Colors.green, const PlacesScreen()),
            _buildMenuCard(context, "Restoranlar", Icons.restaurant, Colors.orange, const RestaurantsScreen()),
            _buildMenuCard(context, "Pratik Bilgiler", Icons.info_outline, Colors.purple, const PracticalInfoScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, Widget page) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon, size: 40, color: color), const SizedBox(height: 8), Text(title, style: const TextStyle(fontWeight: FontWeight.bold))],
        ),
      ),
    );
  }
}

// ---------------- PRATİK KELİMELER (YENİ) ----------------
class PhrasesScreen extends StatelessWidget {
  const PhrasesScreen({super.key});

  final List<Map<String, String>> phrases = const [
    {"tr": "Merhaba", "me": "Zdravo"},
    {"tr": "Teşekkür ederim", "me": "Hvala"},
    {"tr": "Ne kadar?", "me": "Koliko košta?"},
    {"tr": "Nerede?", "me": "Gdje je?"},
    {"tr": "Evet / Hayır", "me": "Da / Ne"},
    {"tr": "Hesap lütfen", "me": "Račun, molim"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pratik Karadağca')),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(phrases[index]['me']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Text(phrases[index]['tr']!),
          leading: const Icon(Icons.record_voice_over, color: Colors.blueGrey),
        ),
      ),
    );
  }
}

// ---------------- GEZİLECEK YERLER (GÜNCELLENDİ) ----------------
class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mutlaka Görülmeli')),
      body: ListView(
        children: const [
          ListTile(title: Text("Kotor Körfezi (Boka)"), subtitle: Text("Adriyatik'in incisi")),
          ListTile(title: Text("Ostrog Manastırı"), subtitle: Text("Kayalara oyulmuş mucize")),
          ListTile(title: Text("Skadar Gölü"), subtitle: Text("Doğa ve kuş cenneti")),
        ],
      ),
    );
  }
}

// ---------------- DİĞER SAYFALAR (Aynı mantıkla eklemeler yapıldı...) ----------------
class WeatherScreen extends StatelessWidget { const WeatherScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Hava Durumu')), body: const Center(child: Text("Meteo.co.me üzerinden takip edilebilir."))); }
class TransportScreen extends StatelessWidget { const TransportScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Trafik Kuralları')), body: const Center(child: Text("Farlar açık, alkol sınırı 0!"))); }
class RestaurantsScreen extends StatelessWidget { const RestaurantsScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Restoranlar')), body: const Center(child: Text("Niagara, Pod Volat..."))); }
class PracticalInfoScreen extends StatelessWidget { const PracticalInfoScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Pratik Bilgiler')), body: const Center(child: Text("Acil numaralar..."))); }
