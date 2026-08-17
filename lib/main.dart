import 'package:flutter/material.dart';

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

  const Place({required this.title, required this.subtitle, required this.description});
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Place> places = const [
    Place(title: 'Kotor Teleferiği', subtitle: 'Muhteşem Manzara', description: 'Körfezi kuş bakışı izleyebileceğiniz modern teleferik hattı.'),
    Place(title: 'Eski Bar (Stari Bar)', subtitle: 'Tarihi Kalıntılar', description: 'Zeytin ağaçları arasında, surlarla çevrili büyüleyici antik kent.'),
    Place(title: 'Sutomore', subtitle: 'Sahil Kasabası', description: 'Geniş plajları ve hareketli atmosferiyle sevilen kıyı bölgesi.'),
    Place(title: 'Kotor Eski Şehri', subtitle: 'UNESCO Mirası', description: 'Orta Çağdan kalma dar sokakları ile ünlü körfez şehri.'),
    Place(title: 'Sveti Stefan', subtitle: 'İkonik Ada', description: 'Dünyaca ünlü, lüks ve tarihi yarımada/ada.'),
    Place(title: 'Durmitor Milli Parkı', subtitle: 'Doğa Harikası', description: 'Buzul gölleri ve derin kanyonlarıyla doğa sporları merkezi.'),
    Place(title: 'Cetinje', subtitle: 'Tarihi Başkent', description: 'Müzeleri ve kraliyet sarayıyla ülkenin kültür merkezi.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Montenegro Travel')),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final p = places[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(p.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${p.subtitle}\n${p.description}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
