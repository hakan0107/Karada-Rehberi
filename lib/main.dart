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
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      home: const MainDashboard(),
    );
  }
}

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Montenegro Super App', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildMenuCard(context, "Konsolosluklar", Icons.flag, Colors.indigo, const EmbassyScreen()),
            _buildMenuCard(context, "Restoranlar", Icons.restaurant, Colors.orange, const RestaurantsScreen()),
            _buildMenuCard(context, "Gezilecek Yerler", Icons.place, Colors.blue, const PlacesScreen()),
            _buildMenuCard(context, "Hizmetler & Oteller", Icons.hotel, Colors.green, const ServicesScreen()),
            _buildMenuCard(context, "Pratik Bilgiler", Icons.info_outline, Colors.purple, const PracticalInfoScreen()),
            _buildMenuCard(context, "Ulaşım & Trafik", Icons.directions_car, Colors.teal, const TransportScreen()),
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
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, size: 35, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- DİĞER SAYFALAR ----------------
class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Gezilecek Yerler')), body: const Center(child: Text("Bölge listeleri aktif.")));
}

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Restoranlar')), body: const Center(child: Text("Restoranlar listesi aktif.")));
}

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Hizmetler & Oteller')), body: const Center(child: Text("Hizmetler listesi aktif.")));
}

class EmbassyScreen extends StatelessWidget {
  const EmbassyScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Konsolosluklar')), body: const Center(child: Text("Konsolosluklar listesi aktif.")));
}

// ---------------- ULAŞIM & TRAFİK SAYFASI (YENİ) ----------------
class TransportScreen extends StatelessWidget {
  const TransportScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ulaşım & Trafik Kuralları')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ExpansionTile(
              leading: Icon(Icons.speed, color: Colors.teal),
              title: Text("🚗 Önemli Trafik Kuralları", style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                ListTile(title: Text("Farlar: Gündüzleri de kısa farlar açık olmalıdır.")),
                ListTile(title: Text("Alkol Sınırı: 0.03 promil (Neredeyse sıfır tolerans).")),
                ListTile(title: Text("Emniyet Kemeri: Ön ve arka koltuklarda zorunludur.")),
                ListTile(title: Text("Hız Sınırları: Yerleşim yerinde 50 km/s, şehir dışında genelde 80 km/s.")),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              leading: const Icon(Icons.directions_bus, color: Colors.blue),
              title: const Text("🚌 Otobüs & Tren Seferleri", style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                ListTile(
                  title: const Text("Podgorica Otogarı (Autobuska Stanica)"),
                  subtitle: const Text("Sefer saatleri ve bilet bilgileri"),
                  trailing: const Icon(Icons.open_in_new, size: 18),
                  onTap: () => _launchURL("https://busticket4.me/"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- PRATİK BİLGİLER ----------------
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
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ExpansionTile(
              leading: Icon(Icons.warning_amber_rounded, color: Colors.red),
              title: Text("🚨 Acil Durum Numaraları", style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                ListTile(title: Text("Polis"), subtitle: Text("122")),
                ListTile(title: Text("İtfaiye"), subtitle: Text("123")),
                ListTile(title: Text("Ambulans"), subtitle: Text("124")),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ExpansionTile(
              leading: Icon(Icons.local_taxi, color: Colors.orange),
              title: Text("🚕 Taksi Durakları", style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                ListTile(title: Text("Naš Taxi"), subtitle: Text("Podgorica yerel taksi servisi")),
                ListTile(title: Text("Peugeot Taxi"), subtitle: Text("Popüler taksi seçeneği")),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              leading: const Icon(Icons.sim_card, color: Colors.blue),
              title: const Text("📱 eSIM & İnternet", style: TextStyle(fontWeight: FontWeight.bold)),
              children: [
                ListTile(
                  title: const Text("One Montenegro (eSIM)"),
                  subtitle: const Text("Resmi web sitesini ziyaret et"),
                  trailing: const Icon(Icons.open_in_new, size: 18),
                  onTap: () => _launchURL("https://www.me.one/"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
