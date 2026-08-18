import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('Montenegro Guide', style: TextStyle(fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
              child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Hoş Geldiniz", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Karadağ'ı keşfedin", style: TextStyle(color: Colors.white70)),
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
                _buildCard(context, "Gezilecek Yerler", Icons.landscape, Colors.green),
                _buildCard(context, "Restoranlar", Icons.restaurant, Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(context, title, icon, color) => Card(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon, size: 48, color: color),
      const SizedBox(height: 10),
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    ]),
  );
}
