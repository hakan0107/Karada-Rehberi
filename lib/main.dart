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
    const PlacesScreen(),
    const Center(child: Text("Restoranlar Yakında Eklenecek")),
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
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Hizmetler'),
        ],
      ),
    );
  }
}

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gezilecek Yerler')),
      body: ListView(children: const [
        ListTile(title: Text("Skadar Gölü"), subtitle: Text("Balkanların En Büyüğü")),
        ListTile(title: Text("Kotor Körfezi"), subtitle: Text("UNESCO Mirası")),
      ]),
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
      appBar: AppBar(title: const Text('Araç & Konaklama')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.directions_car, color: Colors.red),
            title: const Text("Araç Kiralama (LocalRent)"),
            onTap: () => _launchURL("https://localrent.com/me/"),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.red),
            title: const Text("Konaklama (Booking.com)"),
            onTap: () => _launchURL("https://www.booking.com/city/me/podgorica.tr.html"),
          ),
        ],
      ),
    );
  }
}
