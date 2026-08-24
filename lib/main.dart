import 'package:flutter/material.dart';

void main() {
  runApp(const KaradaRehberiApp());
}

class KaradaRehberiApp extends StatelessWidget {
  const KaradaRehberiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Karadağ Rehberi',
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
        title: const Text('Karadağ Rehberi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Hoş Geldiniz!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Buraya gezilecek yerler sayfasına geçiş eklenecek
              },
              icon: const Icon(Icons.place),
              label: const Text('Gezilecek Yerler'),
            ),
          ],
        ),
      ),
    );
  }
}
