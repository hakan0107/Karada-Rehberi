import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MontenegroGuideApp());
}

class MontenegroGuideApp extends StatelessWidget {
  const MontenegroGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Montenegro Travel Guide',
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  final String _adUnitId = 'ca-app-pub-3940256099942544/6300978111';

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    _bannerAd = BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) => setState(() => _isLoaded = true),
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }

  final List<Map<String, String>> spots = const [
    {'title': 'Kotor Old Town', 'city': 'Kotor', 'desc': 'UNESCO korumasındaki tarihi kale içi ve körfez manzarası.'},
    {'title': 'Budva Old Town', 'city': 'Budva', 'desc': 'Eşsiz plajlar, hareketli gece hayatı ve tarihi surlar.'},
    {'title': 'Durmitor National Park', 'city': 'Žabljak', 'desc': 'Siyah Göl (Crno Jezero) ve Tara Kanyonu raftingi.'},
    {'title': 'Sveti Stefan', 'city': 'Budva', 'desc': 'Karadağ ikonik ada oteli ve kırmızı çakıllı plajlar.'},
    {'title': 'Ostrog Monastery', 'city': 'Danilovgrad', 'desc': 'Kayalıkların içine oyulmuş görkemli tarihi manastır.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karadağ Keşif Rehberi'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: spots.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final spot = spots[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.redAccent, size: 36),
                    title: Text(spot['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${spot['city']!}\n${spot['desc']!}'),
                  ),
                );
              },
            ),
          ),
          if (_isLoaded && _bannerAd != null)
            SizedBox(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
        ],
      ),
    );
  }
}
