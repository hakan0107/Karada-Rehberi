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
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const Center(child: Text("Gezilecek Yerler Yakında")),
    const Center(child: Text("Restoranlar Yakında")),
    const ServicesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Gezilecek'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Yemek'),
          BottomNavigationBarItem(icon: Icon(Icons.hotel), label: 'Hizmetler'),
        ],
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
      appBar: AppBar(title: const Text('Hizmetler & Konaklama')),
      body: ListView(
        children: [
          const ListTile(title: Text("--- ARAÇ KİRALAMA ---", style: TextStyle(fontWeight: FontWeight.bold))),
          ListTile(leading: const Icon(Icons.directions_car), title: const Text("LocalRent"), onTap: () => _launchURL("https://localrent.com/me/")),
          
          const Divider(),
          
          const ListTile(title: Text("--- YÜKSEK PUANLI OTELLER ---", style: TextStyle(fontWeight: FontWeight.bold))),
          ListTile(leading: const Icon(Icons.hotel), title: const Text("Regent Porto Montenegro (Tivat)"), onTap: () => _launchURL("https://www.booking.com/hotel/me/regent-porto-montenegro.tr.html")),
          ListTile(leading: const Icon(Icons.hotel), title: const Text("Aman Sveti Stefan"), onTap: () => _launchURL("https://www.booking.com/hotel/me/aman-sveti-stefan.tr.html")),
          ListTile(leading: const Icon(Icons.hotel), title: const Text("Hotel Splendid (Bečići)"), onTap: () => _launchURL("https://www.booking.com/hotel/me/splendid-conference-spa-resort.tr.html")),
        ],
      ),
    );
  }
}
