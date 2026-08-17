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
      title: 'Karadag Rehberi',
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
      description: 'Orta Çağdan kalma dar sokakları, meydanları ve Venedik mimarisi ile Karadağın tarihi kalbidir. Surlara çıkıp körfez manzarasını izlemek büyüleyicidir.',
      imageUrl: 'https://images.unsplash.com/photo-1533105079780-92b9be482077?w=600',
    ),
    Place(
      title: 'Budva Eski Şehri',
      subtitle: '2500 Yıllık Tarih',
      description: 'Adriyatik kıyısındaki en eski yerleşim yerlerinden biridir. İtalyan mimarisinin izlerini taşır ve hareketli sokaklarıyla ünlüdür.',
      imageUrl: 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=600',
    ),
    Place(
      title: 'Perast ve Our Lady of the Rocks',
      subtitle: 'Barok Kasaba ve Yapay Ada',
      description: 'Kotor Körfezinde, 17. ve 18. yüzyıldan kalma barok tarzı villaların bulunduğu sakin bir sahil kasabasıdır. Karşısında tarihi ada kilisesi yer alır.',
      imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=600',
    ),
    Place(
      title: 'Cetinje (Eski Başkent)',
      subtitle: 'Ruhani ve Tarihi Merkez',
      description: 'Karadağın eski başkenti olup pek çok tarihi müze, eski elçilik binası ve önemli Cetinje Manastırına ev sahipliği yapar.',
      imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=600',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karadağ Rehberi - Tarihi Yerler'),
        backgroundColor: Colors.red[700],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: historicPlaces.length,
        itemBuilder: (context, index) {
          final place = historicPlaces[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(place: place),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    place.imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          place.subtitle,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red[700],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Place place;

  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
        backgroundColor: Colors.red[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              place.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    place.subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Divider(height: 32),
                  Text(
                    place.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
