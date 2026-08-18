import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MontenegroApp());

class MontenegroApp extends StatelessWidget {
  const MontenegroApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      useMaterial3: true,
      cardTheme: CardTheme(elevation: 4, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    ),
    home: const MainDashboard(),
  );
}

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Montenegro Guide', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.language))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
              child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Hoş Geldiniz", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Karadağ'ı keşfetmeye hazır mısınız?", style: TextStyle(color: Colors.white70)),
              ]),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildCard(context, "Gezilecek Yerler", Icons.landscape, Colors.green, const PlacesScreen()),
                _buildCard(context, "Restoranlar", Icons.restaurant, Colors.orange, const RestaurantsScreen()),
                _buildCard(context, "Pratik Bilgiler", Icons.info_outline, Colors.blue, const Placeholder()),
                _buildCard(context, "Trafik Kuralları", Icons.speed, Colors.red, const Placeholder()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(context, title, icon, color, page) => InkWell(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    child: Card(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, size: 48, color: color),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ]),
    ),
  );
}

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});
  final List places = const [
    {"name": "Kotor Körfezi", "desc": "UNESCO Dünya Mirası.", "img": "https://images.unsplash.com/photo-1596489373752-d55883833d7b?q=80&w=600"},
    {"name": "Ostrog Manastırı", "desc": "Kayalara oyulmuş mucize.", "img": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Ostrog_monastery_Montenegro.jpg/600px-Ostrog_monastery_Montenegro.jpg"},
  ];

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Gezilecek Yerler")), 
    body: ListView.builder(itemCount: places.length, itemBuilder: (context, i) => _buildItem(places[i])));

  Widget _buildItem(item) => Card(margin: const EdgeInsets.all(12), child: Column(children: [
    Image.network(item['img'], height: 200, width: double.infinity, fit: BoxFit.cover),
    ListTile(title: Text(item['name']), subtitle: Text(item['desc']), trailing: const Icon(Icons.map, color: Colors.indigo))
  ]));
}

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});
  final List rests = const [
    {"name": "Niagara Restoran", "desc": "Şelale kenarında keyif.", "img": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/46/f1/3e/restoran-niagara.jpg?w=600&h=-1&s=1"},
  ];

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Restoranlar")),
    body: ListView.builder(itemCount: rests.length, itemBuilder: (context, i) => _buildItem(rests[i])));

  Widget _buildItem(item) => Card(margin: const EdgeInsets.all(12), child: Column(children: [
    Image.network(item['img'], height: 200, width: double.infinity, fit: BoxFit.cover),
    ListTile(title: Text(item['name']), subtitle: Text(item['desc']), trailing: const Icon(Icons.map, color: Colors.indigo))
  ]));
}
