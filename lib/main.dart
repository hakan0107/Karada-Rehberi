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
      title: "Montenegro Travel",
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

  final List<Place> historicPlaces = const [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Karadağ Rehberi')),
      body: const Center(child: Text('Hoş Geldiniz')),
    );
  }
}
