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
          _buildMenuCard(context, "Gezilecek Yerler", Icons.place, Colors.blue, const PlacesScreen()),
          _buildMenuCard(context, "Restoranlar", Icons.restaurant, Colors.orange, const RestaurantsScreen()),
          _buildMenuCard(context, "Hizmetler & Oteller", Icons.hotel, Colors.green, const ServicesScreen()),
          _buildMenuCard(context, "Konsolosluklar", Icons.flag, Colors.indigo, const EmbassyScreen()),
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

// ---------------- GEZİLECEK YERLER SAYFASI ----------------
class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gezilecek Yerler')),
      body: ListView(
        children: [
          _buildCitySection("Budva & Çevresi", [
            {"name": "Stari Grad (Budva Old Town)", "desc": "2500 yıllık tarihi kale içi ve dar sokaklar.", "map": "https://www.google.com/maps/search/Budva+Old+Town"},
            {"name": "Sveti Stefan", "desc": "Karadağ'ın simgesi ikonik ada otel ve plaj.", "map": "https://www.google.com/maps/search/Sveti+Stefan"},
            {"name": "Mogren Plajı", "desc": "Kayalıkların arasından geçilen büyüleyici koy.", "map": "https://www.google.com/maps/search/Mogren+Beach+Budva"},
            {"name": "Sveti Nikola Adası (Hawaii)", "desc": "Budva'nın karşısındaki turkuaz ada.", "map": "https://www.google.com/maps/search/Sveti+Nikola+Island+Budva"},
          ]),
          _buildCitySection("Ulcinj & Sahil Şeridi", [
            {"name": "Stari Grad Ulcinj", "desc": "Kalesi ve korsan tarihiyle meşhur eski şehir.", "map": "https://www.google.com/maps/search/Ulcinj+Old+Town"},
            {"name": "Velika Plaža (Uzun Plaj)", "desc": "13 km uzunluğunda ince kumlu rüzgar sörfü cenneti.", "map": "https://www.google.com/maps/search/Velika+Plaza+Ulcinj"},
            {"name": "Ada Bojana", "desc": "Nehir ve denizin birleştiği adada taze balık restoranları.", "map": "https://www.google.com/maps/search/Ada+Bojana+Ulcinj"},
            {"name": "Valdanos Körfezi", "desc": "Binlerce yıllık zeytin ağaçlarıyla çevrili koy.", "map": "https://www.google.com/maps/search/Valdanos+Bay+Ulcinj"},
          ]),
          _buildCitySection("Kotor & Körfez", [
            {"name": "Kotor Stari Grad", "desc": "UNESCO korumasındaki tarihi surlar ve meydanlar.", "map": "https://www.google.com/maps/search/Kotor+Old+Town"},
            {"name": "San Giovanni Kalesi", "desc": "Körfezi kuşbakışı gören eşsiz manzara tırmanışı.", "map": "https://www.google.com/maps/search/Kotor+Fortress"},
            {"name": "Perast & Gospa od Škrpjela", "desc": "Kayaların Leydisi yapay adası ve tarihi kasaba.", "map": "https://www.google.com/maps/search/Perast+Montenegro"},
          ]),
          _buildCitySection("Podgorica & Çevresi", [
            {"name": "Skadar Gölü Milli Parkı", "desc": "Balkanların en büyük gölü ve kuş cenneti.", "map": "https://www.google.com/maps/search/Lake+Skadar+Montenegro"},
            {"name": "Ostrog Manastırı", "desc": "Kayalara oyulmuş büyüleyici dik dağ manastırı.", "map": "https://www.google.com/maps/search/Ostrog+Monastery"},
            {"name": "Niagara Şelalesi (Podgorica)", "desc": "Cijevna nehrindeki doğal kanyon ve şelale.", "map": "https://www.google.com/maps/search/Niagara+Waterfalls+Podgorica"},
          ]),
          _buildCitySection("Herceg Novi & Bar", [
            {"name": "Stari Bar", "desc": "Zeytinlikler arasında antik surlar ve tarihi kent.", "map": "https://www.google.com/maps/search/Stari+Bar"},
            {"name": "Stara Maslina (Eski Zeytin Ağacı)", "desc": "2000 yaşından fazla tarihi zeytin ağacı.", "map": "https://www.google.com/maps/search/Stara+Maslina+Bar"},
            {"name": "Kanli Kula (Herceg Novi)", "desc": "Tarihi kale ve açık hava tiyatrosu manzarası.", "map": "https://www.google.com/maps/search/Kanli+Kula+Herceg+Novi"},
          ]),
          _buildCitySection("Kuzey Doğa & Milli Parklar", [
            {"name": "Durmitor & Crno Jezero (Kara Göl)", "desc": "Çam ormanlarıyla kaplı eşsiz dağ gölü.", "map": "https://www.google.com/maps/search/Crno+Jezero+Zabljak"},
            {"name": "Đurđevića Tara Köprüsü", "desc": "Avrupa'nın en derin kanyonunda dev köprü ve zipline.", "map": "https://www.google.com/maps/search/Djurdjevica+Tara+Bridge"},
            {"name": "Lovćen Milli Parkı & Njegoš Mozolesi", "desc": "Karadağ'ın zirvesinden tüm ülkeyi izleyin.", "map": "https://www.google.com/maps/search/Njegos+Mausoleum+Lovcen"},
          ]),
        ],
      ),
    );
  }

  Widget _buildCitySection(String city, List<Map<String, String>> places) {
    return ExpansionTile(
      title: Text(city, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
      children: places.map((p) => ListTile(
        leading: const Icon(Icons.explore, color: Colors.blue),
        title: Text(p['name']!, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(p['desc']!),
        trailing: IconButton(
          icon: const Icon(Icons.map, color: Colors.red),
          onPressed: () => _launchURL(p['map']!),
        ),
      )).toList(),
    );
  }
}

// ---------------- RESTORANLAR SAYFASI ----------------
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
            {"name": "Stara Kuća", "rating": "4.7 ★", "desc": "Geleneksel mimari ve otantik lezzetler.", "map": "https://www.google.com/maps/search/Stara+Kuca+Podgorica"},
            {"name": "Salaš 23", "rating": "4.8 ★", "desc": "Doğayla iç içe köy lezzetleri.", "map": "https://www.google.com/maps/search/Salas+23+Podgorica"},
            {"name": "Djedovina", "rating": "4.7 ★", "desc": "Geleneksel tarifler.", "map": "https://www.google.com/maps/search/Djedovina+Podgorica"},
            {"name": "Restoran Niagara", "rating": "4.8 ★", "desc": "Şelale manzaralı et ve balık.", "map": "https://www.google.com/maps/search/Restoran+Niagara+Podgorica"},
            {"name": "Pod Volat", "rating": "4.6 ★", "desc": "Meşhur Balkan kebapları.", "map": "https://www.google.com/maps/search/Pod+Volat+Podgorica"},
          ]),
          _buildCitySection("Kotor & Budva", [
            {"name": "Stari Mlini (Kotor)", "rating": "4.8 ★", "desc": "Tarihi su değirmeninde eşsiz deniz ürünleri.", "map": "https://www.google.com/maps/search/Stari+Mlini+Kotor"},
            {"name": "Jadran Kod Krsta (Budva)", "rating": "4.6 ★", "desc": "Sahilde meşhur deniz ürünleri.", "map": "https://www.google.com/maps/search/Jadran+Kod+Krsta+Budva"},
          ]),
        ],
      ),
    );
  }

  Widget _buildCitySection(String city, List<Map<String, String>> restaurants) {
    return ExpansionTile(
      title: Text(city, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: restaurants.map((r) => ListTile(
        leading: const Icon(Icons.restaurant_menu, color: Colors.orange),
        title: Text(r['name']!),
        subtitle: Text("${r['rating']} - ${r['desc']}"),
        trailing: IconButton(icon: const Icon(Icons.map, color: Colors.red), onPressed: () => _launchURL(r['map']!)),
      )).toList(),
    );
  }
}

// ---------------- HİZMETLER & KONAKLAMA SAYFASI ----------------
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
              ListTile(title: const Text("Montenegro Car"), subtitle: const Text("Yerel ve köklü firma"), onTap: () => _launchURL("https://www.montenegrocar.me/")),
              ListTile(title: const Text("Sixt Rent a Car"), subtitle: const Text("Uluslararası marka"), onTap: () => _launchURL("https://www.sixt.me/")),
              ListTile(title: const Text("LocalRent"), subtitle: const Text("Uygun fiyatlı yerel acenteler"), onTap: () => _launchURL("https://localrent.com/me/")),
            ],
          ),
          ExpansionTile(
            title: const Text("🏠 Konaklama & Airbnb", style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(title: const Text("Airbnb Montenegro"), subtitle: const Text("Ev ve villa kiralama"), onTap: () => _launchURL("https://www.airbnb.com.tr/montenegro/stays")),
              ListTile(title: const Text("Booking.com Otelleri"), subtitle: const Text("Otel ve apart seçenekleri"), onTap: () => _launchURL("https://www.booking.com/country/me.tr.html")),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------- KONSOLOSLUKLAR SAYFASI ----------------
class EmbassyScreen extends StatelessWidget {
  const EmbassyScreen({super.key});

  final List<Map<String, String>> embassies = const [
    {"name": "Türkiye Büyükelçiliği", "phone": "+38220443000", "map": "https://www.google.com/maps/search/Turkish+Embassy+Podgorica"},
    {"name": "Almanya Büyükelçiliği", "phone": "+38220441000", "map": "https://www.google.com/maps/search/German+Embassy+Podgorica"},
    {"name": "ABD Büyükelçiliği", "phone": "+38220412800", "map": "https://www.google.com/maps/search/US+Embassy+Podgorica"},
    {"name": "İngiltere Büyükelçiliği", "phone": "+38220420100", "map": "https://www.google.com/maps/search/British+Embassy+Podgorica"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konsolosluklar')),
      body: ListView.builder(
        itemCount: embassies.length,
        itemBuilder: (context, index) {
          final e = embassies[index];
          return ListTile(
            title: Text(e['name']!),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: const Icon(Icons.phone, color: Colors.green), onPressed: () => launchUrl(Uri.parse('tel:${e['phone']}'))),
                IconButton(icon: const Icon(Icons.map, color: Colors.red), onPressed: () => launchUrl(Uri.parse(e['map']!))),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ---------------- PRATİK BİLGİLER SAYFASI ----------------
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
              ListTile(title: Text("Polis"), subtitle: Text("122")),
              ListTile(title: Text("İtfaiye"), subtitle: Text("123")),
              ListTile(title: Text("Ambulans"), subtitle: Text("124")),
              ListTile(title: Text("Yol Yardım & Çekici (AMSCG)"), subtitle: Text("19807")),
            ],
          ),
          ExpansionTile(
            title: const Text("🚕 Taksi & Transfer", style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(title: const Text("Tesla Go App"), subtitle: const Text("Elektrikli taksi"), onTap: () => _launchURL("https://www.teslago.me/")),
            ],
          ),
          ExpansionTile(
            title: const Text("📱 Mobil İnternet & eSIM", style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(title: const Text("Airalo eSIM"), subtitle: const Text("Dijital internet paketi"), onTap: () => _launchURL("https://www.airalo.com/montenegro-esim")),
              ListTile(title: const Text("m:tel Montenegro"), subtitle: const Text("Turist SIM kartı"), onTap: () => _launchURL("https://mtel.me/")),
            ],
          ),
        ],
      ),
    );
  }
}
