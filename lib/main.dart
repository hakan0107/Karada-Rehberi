import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MontenegroGuideApp());
}

class MontenegroGuideApp extends StatelessWidget {
  const MontenegroGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Montenegro Travel',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const ServicesScreen(),
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
      appBar: AppBar(title: const Text('Şehir Bazlı Oteller')),
      body: ListView(
        children: [
          _buildCitySection("Podgorica", "https://www.booking.com/city/me/podgorica.tr.html", [
            {"name": "Hotel Hemera", "url": "https://www.booking.com/hotel/me/hemera.tr.html"},
            {"name": "Hilton Podgorica Crna Gora", "url": "https://www.booking.com/hotel/me/hilton-podgorica-crna-gora.tr.html"},
          ]),
          _buildCitySection("Budva", "https://www.booking.com/city/me/budva.tr.html", [
            {"name": "Avala Resort & Villas", "url": "https://www.booking.com/hotel/me/avala-resort-villas.tr.html"},
            {"name": "Hotel Splendid (Bečići)", "url": "https://www.booking.com/hotel/me/splendid-conference-spa-resort.tr.html"},
          ]),
          _buildCitySection("Kotor", "https://www.booking.com/city/me/kotor.tr.html", [
            {"name": "Hotel Vardar", "url": "https://www.booking.com/hotel/me/hotel-vardar.tr.html"},
            {"name": "Forza Terra", "url": "https://www.booking.com/hotel/me/forza-terra.tr.html"},
          ]),
          _buildCitySection("Bar", "https://www.booking.com/city/me/bar.tr.html", [
            {"name": "Hotel Princess", "url": "https://www.booking.com/hotel/me/hotel-princess-bar.tr.html"},
          ]),
          _buildCitySection("Herceg Novi", "https://www.booking.com/city/me/herceg-novi.tr.html", [
            {"name": "Lazure Hotel & Marina", "url": "https://www.booking.com/hotel/me/lazure-hotel-marina.tr.html"},
            {"name": "Hotel Palmon Bay", "url": "https://www.booking.com/hotel/me/palmon-bay-hotel-spa.tr.html"},
          ]),
        ],
      ),
    );
  }

  Widget _buildCitySection(String city, String cityUrl, List<Map<String, String>> hotels) {
    return ExpansionTile(
      title: Text(city, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      children: [
        ListTile(title: const Text("Tüm Otelleri Gör"), leading: const Icon(Icons.list), onTap: () => _launchURL(cityUrl)),
        ...hotels.map((h) => ListTile(title: Text(h['name']!), leading: const Icon(Icons.hotel), onTap: () => _launchURL(h['url']!))),
      ],
    );
  }
}
