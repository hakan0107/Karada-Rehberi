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
      home: const HomeScreen(),
    );
  }
}

class Place {
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;
  final String mapUrl;

  const Place({required this.title, required this.subtitle, required this.description, required this.imageUrl, required this.mapUrl});
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Place> places = const [
    Place(title: 'Skadar Gölü', subtitle: 'Balkanların En Büyüğü', description: 'Kuş cenneti ve eşsiz doğa manzaralarıyla ünlü göl.', imageUrl: 'https://images.pexels.com/photos/1534560/pexels-photo-1534560.jpeg', mapUrl: 'https://www.google.com/maps/search/Skadar+Lake'),
    Place(title: 'Rijeka Crnojevića', subtitle: 'Tarihi Köprü ve Nehir', description: 'Eski köprüsü ve nehir kıyısı manzarasıyla ünlü huzurlu nokta.', imageUrl: 'https://images.pexels.com/photos/258523/pexels-photo-258523.jpeg', mapUrl: 'https://www.google.com/maps/search/Rijeka+Crnojevica'),
    Place(title: 'Virpazar', subtitle: 'Gölün Kalbi', description: 'Skadar Gölü üzerinde tekne turlarının kalktığı şirin balıkçı kasabası.', imageUrl: 'https://images.pexels.com/photos/848599/pexels-photo-848599.jpeg', mapUrl: 'https://www.google.com/maps/search/Virpazar'),
    Place(title: 'Podgorica Niagara Şelalesi', subtitle: 'Doğa Harikası', description: 'Cijevna Nehri üzerinde popüler şelale.', imageUrl: 'https://images.pexels.com/photos/1534560/pexels-photo-1534560.jpeg', mapUrl: 'https://www.google.com/maps/search/Niagara+Waterfall+Podgorica'),
    Place(title: 'Dajbabe Manastırı', subtitle: 'Tarihi Dini Yapı', description: 'Kayalara oyulmuş freskli özel manastır.', imageUrl: 'https://images.pexels.com/photos/258523/pexels-photo-258523.jpeg', mapUrl: 'https://www.google.com/maps/search/Dajbabe+Monastery'),
    Place(title: 'Kolasin Kayak Merkezi', subtitle: 'Kış Turizmi', description: 'Bjelasica Dağı eteklerinde modern tesisler.', imageUrl: 'https://images.pexels.com/photos/848599/pexels-photo-848599.jpeg', mapUrl: 'https://www.google.com/maps/search/Kolasin+Ski+Resort'),
    Place(title: 'Ostrog Manastırı', subtitle: 'Kutsal Hac Merkezi', description: 'Dikey kayaya oyulmuş eşsiz manastır.', imageUrl: 'https://images.pexels.com/photos/459024/pexels-photo-459024.jpeg', mapUrl: 'https://www.google.com/maps/search/Ostrog+Monastery'),
    Place(title: 'Kotor Körfezi', subtitle: 'UNESCO Mirası', description: 'Büyüleyici körfez ve eski şehir merkezi.', imageUrl: 'https://images.pexels.com/photos/338515/pexels-photo-338515.jpeg', mapUrl: 'https://www.google.com/maps/search/Kotor'),
    Place(title: 'Eski Bar (Stari Bar)', subtitle: 'Tarihi Kalıntılar', description: 'Zeytin ağaçları arasında antik kent.', imageUrl: 'https://images.pexels.com/photos/1486222/pexels-photo-1486222.jpeg', mapUrl: 'https://www.google.com/maps/search/Stari+Bar'),
    Place(title: 'Sutomore', subtitle: 'Sahil Kasabası', description: 'Geniş plajları ile ünlü kıyı bölgesi.', imageUrl: 'https://images.pexels.com/photos/1269383/pexels-photo-1269383.jpeg', mapUrl: 'https://www.google.com/maps/search/Sutomore'),
    Place(title: 'Sveti Stefan', subtitle: 'İkonik Ada', description: 'Dünyaca ünlü, lüks tarihi yarımada.', imageUrl: 'https://images.pexels.com/photos/592398/pexels-photo-592398.jpeg', mapUrl: 'https://www.google.com/maps/search/Sveti+Stefan'),
    Place(title: 'Durmitor Milli Parkı', subtitle: 'Doğa Harikası', description: 'Buzul gölleri ve derin kanyonlar.', imageUrl: 'https://images.pexels.com/photos/672358/pexels-photo-672358.jpeg', mapUrl: 'https://www.google.com/maps/search/Durmitor+National+Park'),
    Place(title: 'Cetinje', subtitle: 'Tarihi Başkent', description: 'Kraliyet sarayı ve kültür merkezi.', imageUrl: 'https://images.pexels.com/photos/2085799/pexels-photo-2085799.jpeg', mapUrl: 'https://www.google.com/maps/search/Cetinje'),
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Montenegro Travel')),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final p = places[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: SizedBox(width: 60, height: 60, child: ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(p.imageUrl, fit: BoxFit.cover))),
              title: Text(p.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${p.subtitle}\n${p.description}'),
              trailing: IconButton(
                icon: const Icon(Icons.map, color: Colors.red),
                onPressed: () => _launchURL(p.mapUrl),
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
