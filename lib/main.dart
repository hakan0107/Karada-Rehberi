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
    Place(
      title: 'Podgorica Niagara Şelalesi',
      subtitle: 'Doğa Harikası',
      description: 'Cijevna Nehri üzerinde yer alan, özellikle ilkbaharda coşkulu akan popüler şelale.',
      imageUrl: 'https://images.unsplash.com/photo-1432405972618-c60b0225b8f9',
      mapUrl: 'https://www.google.com/maps/search/Niagara+Waterfall+Podgorica'
    ),
    Place(
      title: 'Dajbabe Manastırı (Beyaz Kilise)',
      subtitle: 'Tarihi Dini Yapı',
      description: 'Podgorica yakınlarında, bir kayanın içine oyulmuş ve içerisindeki freskleriyle ünlü özel manastır.',
      imageUrl: 'https://images.unsplash.com/photo-1548625149-fc4a29cf7092',
      mapUrl: 'https://www.google.com/maps/search/Dajbabe+Monastery'
    ),
    Place(
      title: 'Kolasin Kayak Merkezi',
      subtitle: 'Kış Turizmi',
      description: 'Bjelasica Dağı eteklerinde modern kayak tesisleri.',
      imageUrl: 'https://images.unsplash.com/photo-1605721967599-917711463973',
      mapUrl: 'https://www.google.com/maps/search/Kolasin+Ski+Resort'
    ),
    Place(
      title: 'Ostrog Manastırı',
      subtitle: 'Kutsal Hac Merkezi',
      description: 'Kayalara oyulmuş mucizevi yapı.',
      imageUrl: 'https://images.unsplash.com/photo-1594993875323-863a357731a5',
      mapUrl: 'https://www.google.com/maps/search/Ostrog+Monastery'
    ),
    Place(
      title: 'Kotor Körfezi',
      subtitle: 'UNESCO Mirası',
      description: 'Dar sokakları ve muhteşem doğasıyla büyüleyici.',
      imageUrl: 'https://images.unsplash.com/photo-1516483638261-f4dbaf036963',
      mapUrl: 'https://www.google.com/maps/search/Kotor'
    ),
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
              leading: SizedBox(width: 50, height: 50, child: Image.network(p.imageUrl, fit: BoxFit.cover)),
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
