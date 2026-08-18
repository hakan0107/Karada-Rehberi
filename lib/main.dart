import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MontenegroApp());

class MontenegroApp extends StatelessWidget {
  const MontenegroApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.red),
    home: const MainDashboard(),
  );
}

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Karadağ Rehberi')),
    body: GridView.count(crossAxisCount: 2, padding: const EdgeInsets.all(12), children: [
      _buildMenu(context, "Gezilecek Yerler", Icons.landscape, Colors.green, const PlacesScreen()),
      _buildMenu(context, "Restoranlar", Icons.restaurant, Colors.orange, const RestaurantsScreen()),
    ]),
  );

  Widget _buildMenu(context, title, icon, color, page) => Card(
    child: InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, size: 40, color: color), Text(title)]),
  ));
}

// Harita Destekli Sayfalar
class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});
  final List places = const [
    {"name": "Kotor Körfezi", "desc": "Tarihi ve deniz.", "img": "https://images.unsplash.com/photo-1596489373752-d55883833d7b?q=80&w=600"},
    {"name": "Ostrog Manastırı", "desc": "Kayalara oyulmuş.", "img": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Ostrog_monastery_Montenegro.jpg/600px-Ostrog_monastery_Montenegro.jpg"},
  ];

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Gezilecek Yerler")),
    body: ListView.builder(itemCount: places.length, itemBuilder: (context, i) => _buildCard(places[i])));

  Widget _buildCard(item) => Card(margin: const EdgeInsets.all(10), child: Column(children: [
    Image.network(item['img'], height: 150, width: double.infinity, fit: BoxFit.cover),
    ListTile(title: Text(item['name']), subtitle: Text(item['desc']),
    trailing: IconButton(icon: const Icon(Icons.map, color: Colors.red), 
    onPressed: () => launchUrl(Uri.parse("https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(item['name'])}"), mode: LaunchMode.externalApplication)))
  ]));
}

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});
  final List rests = const [
    {"name": "Niagara Restoran", "desc": "Şelale kenarı.", "img": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/46/f1/3e/restoran-niagara.jpg?w=600&h=-1&s=1"},
  ];

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Restoranlar")),
    body: ListView.builder(itemCount: rests.length, itemBuilder: (context, i) => _buildCard(rests[i])));

  Widget _buildCard(item) => Card(margin: const EdgeInsets.all(10), child: Column(children: [
    Image.network(item['img'], height: 150, width: double.infinity, fit: BoxFit.cover),
    ListTile(title: Text(item['name']), subtitle: Text(item['desc']),
    trailing: IconButton(icon: const Icon(Icons.map, color: Colors.red), 
    onPressed: () => launchUrl(Uri.parse("https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(item['name'])}"), mode: LaunchMode.externalApplication)))
  ]));
}
