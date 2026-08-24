import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const KaradaRehberiApp());
}

class KaradaRehberiApp extends StatelessWidget {
  const KaradaRehberiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Montenegro Travel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Montenegro Travel'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Karadağ Keşif Rehberi',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GezilecekYerlerSayfasi()),
                );
              },
              icon: const Icon(Icons.place),
              label: const Text('Gezilecek Yerler'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GezilecekYer {
  final String baslik;
  final String aciklama;
  final String resimUrl;
  final String haritaUrl;

  GezilecekYer({
    required this.baslik,
    required this.aciklama,
    required this.resimUrl,
    required this.haritaUrl,
  });
}

class GezilecekYerlerSayfasi extends StatelessWidget {
  const GezilecekYerlerSayfasi({super.key});

  final List<GezilecekYer> yerler = const [
    GezilecekYer(
      baslik: 'Kotor Körfezi',
      aciklama: 'Dünyanın en güzel körfezlerinden biri, tarihi surlar ve fjord benzeri doğa.',
      resimUrl: 'https://images.unsplash.com/photo-1533105079780-92b9be482077?w=300',
      haritaUrl: 'https://maps.google.com/?q=Kotor+Bay',
    ),
    GezilecekYer(
      baslik: 'Ostrog Manastırı',
      aciklama: 'Kayalıkların dik yamacına tamamen oyulmuş mucizevi Ortodoks manastırı.',
      resimUrl: 'https://images.unsplash.com/photo-1609854485371-d85cd2a0614f?w=300',
      haritaUrl: 'https://maps.google.com/?q=Ostrog+Monastery',
    ),
    GezilecekYer(
      baslik: 'Budva Old Town',
      aciklama: 'Yüksek surları, daracık taş sokakları ve Venedik mimarisiyle Adriyatik\'in kalbi.',
      resimUrl: 'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?w=300',
      haritaUrl: 'https://maps.google.com/?q=Budva+Old+Town',
    ),
    GezilecekYer(
      baslik: 'Durmitor Millî Parkı',
      aciklama: 'Devasa dağları, derin kanyonları ve eşsiz buzul gölleriyle doğa cenneti.',
      resimUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba?w=300',
      haritaUrl: 'https://maps.google.com/?q=Durmitor+National+Park',
    ),
    GezilecekYer(
      baslik: 'Sveti Stefan',
      aciklama: 'Denizin ortasında ince bir yolla karaya bağlanan ikonik kartpostal adacık.',
      resimUrl: 'https://images.unsplash.com/photo-1589870830743-4c90d5cb2e32?w=300',
      haritaUrl: 'https://maps.google.com/?q=Sveti+Stefan',
    ),
    GezilecekYer(
      baslik: 'Rijeka Crnojevića',
      aciklama: 'At nalı kıvrımı manzarası ve tarihi taş köprüsüyle meşhur nehir kasabası.',
      resimUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=300',
      haritaUrl: 'https://maps.google.com/?q=Rijeka+Crnojevica',
    ),
    GezilecekYer(
      baslik: 'İşkodra Gölü (Skadar)',
      aciklama: 'Su zambakları, yüzlerce kuş türü ve tekne turlarıyla Balkanlar\'ın en büyük gölü.',
      resimUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=300',
      haritaUrl: 'https://maps.google.com/?q=Skadar+Lake',
    ),
  ];

  Future<void> _haritayiAc(String urlStr) async {
    final Uri url = Uri.parse(urlStr);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Harita açılamadı: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gezilecek Yerler'),
      ),
      body: ListView.builder(
        itemCount: yerler.length,
        itemBuilder: (context, index) {
          final yer = yerler[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  yer.resimUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 60),
                ),
              ),
              title: Text(
                yer.baslik,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                yer.aciklama,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.map, color: Colors.blue, size: 28),
                onPressed: () => _haritayiAc(yer.haritaUrl),
                tooltip: 'Haritada Aç',
              ),
            ),
          );
        },
      ),
    );
  }
}
