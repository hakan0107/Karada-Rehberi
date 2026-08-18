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
          _buildMenuCard(context, "Hizmetler & Konaklama", Icons.hotel, Colors.green, const ServicesScreen()),
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

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Araç Kiralama & Konaklama')),
      body: ListView(
        children: [
          ExpansionTile(
            title: const Text("🚗 Araç Kiralama Firmaları", style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(
                title: const Text("Montenegro Car"),
                subtitle: const Text("Ülkenin en köklü yerel araç kiralama firması"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _launchURL("https://www.montenegrocar.me/"),
              ),
              ListTile(
                title: const Text("Sixt Rent a Car Montenegro"),
                subtitle: const Text("Uluslararası güvenilir küresel marka"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _launchURL("https://www.sixt.me/"),
              ),
              ListTile(
                title: const Text("LocalRent"),
                subtitle: const Text("Yerel acenteleri karşılaştırma platformu"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _launchURL("https://localrent.com/me/"),
              ),
              ListTile(
                title: const Text("Méga Rent a Car"),
                subtitle: const Text("Podgorica ve Budva ofisleri"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _launchURL("https://megarentacar.com/"),
              ),
              ListTile(
                title: const Text("Green Motion Montenegro"),
                subtitle: const Text("Havalimanı teslimatlı global firma"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _launchURL("https://www.greenmotion.com/"),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text("🏠 Konaklama & Airbnb", style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(
                title: const Text("Airbnb Montenegro"),
                subtitle: const Text("Ev ve villa kiralama seçenekleri"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _launchURL("https://www.airbnb.com.tr/montenegro/stays"),
              ),
              ListTile(
                title: const Text("Booking.com Podgorica & Kıyı"),
                subtitle: const Text("Otel ve apart seçenekleri"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _launchURL("https://www.booking.com/country/me.tr.html"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
