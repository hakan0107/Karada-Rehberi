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
          _buildMenuCard(context, "Konsolosluklar", Icons.flag, Colors.indigo, null),
          _buildMenuCard(context, "Restoranlar", Icons.restaurant, Colors.orange, null),
          _buildMenuCard(context, "Gezilecek Yerler", Icons.place, Colors.blue, null),
          _buildMenuCard(context, "Hizmetler & Konaklama", Icons.hotel, Colors.green, null),
          _buildMenuCard(context, "Pratik Bilgiler", Icons.info_outline, Colors.purple, const PracticalInfoScreen()),
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

class PracticalInfoScreen extends StatelessWidget {
  const PracticalInfoScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pratik Bilgiler & Acil Durum')),
      body: ListView(
        children: [
          const ExpansionTile(
            title: Text("🚨 Acil Durum Numaraları", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
            children: [
              ListTile(title: Text("Polis"), subtitle: Text("122"), trailing: Icon(Icons.phone, color: Colors.green)),
              ListTile(title: Text("İtfaiye"), subtitle: Text("123"), trailing: Icon(Icons.phone, color: Colors.green)),
              ListTile(title: Text("Ambulans / Acil Sağlık"), subtitle: Text("124"), trailing: Icon(Icons.phone, color: Colors.green)),
              ListTile(title: Text("Yol Yardım & Çekici (AMSCG)"), subtitle: Text("19807"), trailing: Icon(Icons.phone, color: Colors.green)),
            ],
          ),
          ExpansionTile(
            title: const Text("🚕 Taksi & Transfer", style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(
                title: const Text("Tesla Go App"),
                subtitle: const Text("Elektrikli araç taksi servisi"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _launchURL("https://www.teslago.me/"),
              ),
              ListTile(
                title: const Text("Red Taxi Podgorica"),
                subtitle: const Text("Popüler şehir içi durak"),
                trailing: const Icon(Icons.phone, color: Colors.green),
                onTap: () => _launchURL("tel:+38219988"),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text("⛽ Akaryakıt İstasyonları", style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(
                title: const Text("Jugopetrol (EKO)"),
                subtitle: const Text("Ülke geneli yaygın istasyonlar"),
                trailing: const Icon(Icons.map, color: Colors.red),
                onTap: () => _launchURL("https://www.google.com/maps/search/Jugopetrol+Montenegro"),
              ),
              ListTile(
                title: const Text("Ina Montenegro"),
                subtitle: const Text("Kaliteli akaryakıt noktaları"),
                trailing: const Icon(Icons.map, color: Colors.red),
                onTap: () => _launchURL("https://www.google.com/maps/search/INA+gas+station+Montenegro"),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text("📱 Mobil İnternet & eSIM", style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(
                title: const Text("Airalo eSIM (Karadağ)"),
                subtitle: const Text("Dijital internet paketleri"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _launchURL("https://www.airalo.com/montenegro-esim"),
              ),
              ListTile(
                title: const Text("m:tel Montenegro"),
                subtitle: const Text("Yerel turist SIM kart seçenekleri"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _launchURL("https://mtel.me/"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
