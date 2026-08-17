import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MontenegroGuideApp());
}

class MontenegroGuideApp extends StatelessWidget {
  const MontenegroGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Montenegro Travel',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const HomeScreen(),
    );
  }
}

class Place {
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;

  Place({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Place> historicPlaces = const [
    Place(
      title: 'Kotor Eski Şehri (Stari Grad)',
      subtitle: 'UNESCO Dünya Mirası',
      description: 'Orta Çağdan kalma dar sokakları, surları ve tarihi kalıntılarıyla büyüleyici bir körfez şehri.',
      imageUrl: 'https://images.unsplash.com/photo-1516483638261-f4dbaf036963',
    ),
    Place(
      title: 'Budva Eski Şehri',
      subtitle: '2500 Yıllık Tarih',
      description: 'Adriyatik kıyısındaki en eski yerleşimlerden biri, muhteşem plajları ve taş evleriyle ünlü.',
      imageUrl: 'https://images.unsplash.com/photo-1569383746731-e1ef01859e88',
    ),
    Place(
      title: 'Perast ve Our Lady of the Rocks',
      subtitle: 'Barok Kasaba ve Yapay Ada',
      description: 'Kotor Körfezinde yer alan, tarihi sarayları ve adadaki ikonik kilisesiyle bilinen huzurlu kasaba.',
      imageUrl: 'https://images.unsplash.com/photo-1589556396867-a060d40217cf',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Montenegro Travel - Tarihi Yerler')),
      body: ListView.builder(
        itemCount: historicPlaces.length,
        itemBuilder: (context, index) {
          final place = historicPlaces[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(place.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${place.subtitle}\n${place.description}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
