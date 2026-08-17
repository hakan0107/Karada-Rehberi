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

  const Place({
    required this.title,
    required this.subtitle,
    required this.description,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Place> historicPlaces = const [
    Place(title: 'Kotor Eski Şehri', subtitle: 'UNESCO Dünya Mirası', description: 'Orta Çağdan kalma dar sokakları ve surlarıyla ünlü körfez şehri.'),
    Place(title: 'Budva Eski Şehri', subtitle: '2500 Yıllık Tarih', description: 'Adriyatik kıyısındaki en eski yerleşimlerden biri, plajlarıyla meşhur.'),
    Place(title: 'Perast', subtitle: 'Barok Kasaba', description: 'Kotor Körfezindeki sarayları ve ikonik adasıyla bilinen huzurlu kasaba.'),
    Place(title: 'Sveti Stefan', subtitle: 'İkonik Yarımada', description: 'Eskiden bir balıkçı köyü olan, günümüzde lüks bir otel olarak kullanılan dünyaca ünlü ada.'),
    Place(title: 'Durmitor Milli Parkı', subtitle: 'Doğa Harikası', description: 'Buzul gölleri ve derin kanyonlarıyla ünlü, dağcılık ve doğa sporları merkezi.'),
    Place(title: 'Cetinje', subtitle: 'Tarihi Başkent', description: 'Karadağ\'ın eski başkenti, müzeleri ve kraliyet sarayıyla kültür merkezi.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Montenegro Travel')),
      body: ListView.builder(
        itemCount: historicPlaces.length,
        itemBuilder: (context, index) {
          final place = historicPlaces[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
