import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const KaradaRehberiApp());
}

class KaradaRehberiApp extends StatelessWidget {
  const KaradaRehberiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Montenegro Travel',
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
        title: const Text('Montenegro Travel'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Karadağ Keşif Rehberi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GezilecekYerlerSayfasi()),
                );
              },
              icon: const Icon(Icons.place),
              label: const Text('Gezilecek Yerler', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RestoranlarSayfasi()),
                );
              },
              icon: const Icon(Icons.restaurant),
              label: const Text('Restoranlar ve Yemek Yerleri', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GezilecekYer {
  final String baslik;
  final String aciklama;
  final String detayliAciklama;
  final String resimUrl;
  final String haritaUrl;

  const GezilecekYer({
    required this.baslik,
    required this.aciklama,
    required this.detayliAciklama,
    required this.resimUrl,
    required this.haritaUrl,
  });
}

class GezilecekYerlerSayfasi extends StatelessWidget {
  const GezilecekYerlerSayfasi({super.key});

  final List<GezilecekYer> yerler = const [
    GezilecekYer(
      baslik: 'Kotor Körfezi',
      aciklama: 'Dünyanın en güzel körfezlerinden biri, tarihi surlar ve fjord benzeri doğa.',
      detayliAciklama: 'Kotor Körfezi (Boka Kotorska), Adriyatik Denizi\'nin güneyinde yer alan ve sıklıkla Avrupa\'nın en güneydeki fiyordu olarak anılan muazzam bir körfeze sahiptir.',
      resimUrl: 'https://picsum.photos/id/1015/800/600',
      haritaUrl: 'https://maps.google.com/?q=Kotor+Bay',
    ),
    GezilecekYer(
      baslik: 'Ostrog Manastırı',
      aciklama: 'Kayalıkların dik yamacına tamamen oyulmuş mucizevi Ortodoks manastırı.',
      detayliAciklama: 'Zeta vadisinin yükseklerinde, neredeyse dikey bir kayalığın içine oyulmuş olan Ostrog Manastırı, önemli hac merkezlerinden biridir.',
      resimUrl: 'https://picsum.photos/id/1039/800/600',
      haritaUrl: 'https://maps.google.com/?q=Ostrog+Monastery',
    ),
    GezilecekYer(
      baslik: 'Budva Old Town',
      aciklama: 'Yüksek surları, daracık taş sokakları ve Venedik mimarisiyle Adriyatik\'in kalbi.',
      detayliAciklama: '2.500 yılı aşkın geçmişiyle Adriyatik kıyısındaki en eski yerleşim yerlerinden biridir.',
      resimUrl: 'https://picsum.photos/id/1043/800/600',
      haritaUrl: 'https://maps.google.com/?q=Budva+Old+Town',
    ),
    GezilecekYer(
      baslik: 'Durmitor Millî Parkı',
      aciklama: 'Devasa dağları, derin kanyonları ve eşsiz buzul gölleriyle doğa cenneti.',
      detayliAciklama: 'Karadağ\'ın kuzeyinde yer alan Durmitor Milli Parkı, 20\'den fazla zirvesi ve kanyonuyla ünlüdür.',
      resimUrl: 'https://picsum.photos/id/1057/800/600',
      haritaUrl: 'https://maps.google.com/?q=Durmitor+National+Park',
    ),
    GezilecekYer(
      baslik: 'Sveti Stefan',
      aciklama: 'Denizin içindeki adacığa bağlı tarihi taş evleriyle Karadağ\'ın simgesi.',
      detayliAciklama: 'Eskiden bir balıkçı köyü olan, günümüzde ise lüks bir tatil beldesi ve ülkenin en ikonik kartpostal görüntüsüdür.',
      resimUrl: 'https://picsum.photos/id/1069/800/600',
      haritaUrl: 'https://maps.google.com/?q=Sveti+Stefan',
    ),
    GezilecekYer(
      baslik: 'Biogradska Gora Millî Parkı',
      aciklama: 'Avrupa\'nın kalan son yaşlı ormanlarından biri ve ortasında büyüleyici göl.',
      detayliAciklama: 'Bjelasica dağlarında yer alan milli park, devasa ağaçları ve Biogradsko gölü ile doğa severlerin vazgeçilmezidir.',
      resimUrl: 'https://picsum.photos/id/1074/800/600',
      haritaUrl: 'https://maps.google.com/?q=Biogradska+Gora',
    ),
  ];

  Future<void> _haritayiAc(String urlStr) async {
    final Uri url = Uri.parse(urlStr);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Harita açılamadı: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gezilecek Yerler')),
      body: ListView.builder(
        itemCount: yerler.length,
        itemBuilder: (context, index) {
          final yer = yerler[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(yer.resimUrl, width: 60, height: 60, fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => const Icon(Icons.image, size: 60)),
              ),
              title: Text(yer.baslik, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(yer.aciklama, maxLines: 2, overflow: TextOverflow.ellipsis),
              trailing: IconButton(
                icon: const Icon(Icons.map, color: Colors.blue),
                onPressed: () => _haritayiAc(yer.haritaUrl),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => YerDetaySayfasi(yer: yer)));
              },
            ),
          );
        },
      ),
    );
  }
}

class YerDetaySayfasi extends StatelessWidget {
  final GezilecekYer yer;
  const YerDetaySayfasi({super.key, required this.yer});

  Future<void> _haritayiAc(String urlStr) async {
    final Uri url = Uri.parse(urlStr);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Harita açılamadı: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(yer.baslik)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(yer.resimUrl, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(yer.baslik, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(yer.detayliAciklama, style: const TextStyle(fontSize: 16, height: 1.5)),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () => _haritayiAc(yer.haritaUrl),
                    icon: const Icon(Icons.map),
                    label: const Text('Haritada Konumunu Aç'),
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
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

class Restoran {
  final String sehir;
  final String isim;
  final String mutfak;
  final String puan;
  final String aciklama;
  final String haritaUrl;

  const Restoran({
    required this.sehir,
    required this.isim,
    required this.mutfak,
    required this.puan,
    required this.aciklama,
    required this.haritaUrl,
  });
}

class RestoranlarSayfasi extends StatelessWidget {
  const RestoranlarSayfasi({super.key});

  final List<Restoran> restoranlar = const [
    Restoran(
      sehir: 'Podgorica',
      isim: 'Pod Volat',
      mutfak: 'Balkan & Karadağ Mutfağı',
      puan: '4.8 / 5.0',
      aciklama: 'Podgorica\'nın kalbinde, geleneksel et yemekleri ve ev yapımı ekmekleriyle meşhur yerel restoran.',
      haritaUrl: 'https://maps.google.com/?q=Pod+Volat+Podgorica',
    ),
    Restoran(
      sehir: 'Podgorica',
      isim: 'Restoran Carine',
      mutfak: 'Akdeniz & Balkan',
      puan: '4.7 / 5.0',
      aciklama: 'Şık atmosferi ve zengin menüsüyle başkentin popüler buluşma noktalarından biri.',
      haritaUrl: 'https://maps.google.com/?q=Restoran+Carine+Podgorica',
    ),
    Restoran(
      sehir: 'Kotor',
      isim: 'Galion Restaurant',
      mutfak: 'Deniz Ürünleri & Fine Dining',
      puan: '4.9 / 5.0',
      aciklama: 'Kotor körfezi manzarasına nazır, taze deniz ürünleri ve lüks akşam yemekleri için 1 numaralı mekan.',
      haritaUrl: 'https://maps.google.com/?q=Galion+Restaurant+Kotor',
    ),
    Restoran(
      sehir: 'Kotor',
      isim: 'Konoba Scala Santa',
      mutfak: 'Akdeniz & Deniz Mahsulleri',
      puan: '4.6 / 5.0',
      aciklama: 'Kotor Eski Şehir\'in tarihi atmosferinde, taş duvarlar arasında samimi bir aile işletmesi.',
      haritaUrl: 'https://maps.google.com/?q=Konoba+Scala+Santa+Kotor',
    ),
    Restoran(
      sehir: 'Budva',
      isim: 'Konoba Stari Grad',
      mutfak: 'Balkan & Izgara',
      puan: '4.8 / 5.0',
      aciklama: 'Budva Eski Kenti\'nin içinde, tarihi dokuyu hissederek yemek yiyebileceğiniz en iyi ızgara adresi.',
      haritaUrl: 'https://maps.google.com/?q=Konoba+Stari+Grad+Budva',
    ),
    Restoran(
      sehir: 'Budva',
      isim: 'Jadran kod Krsta',
      mutfak: 'Taze Balık & Deniz Ürünleri',
      puan: '4.7 / 5.0',
      aciklama: 'Deniz kenarında dalga sesleri eşliğinde taze balık yemek isteyenlerin Budva\'daki vazgeçilmez durağı.',
      haritaUrl: 'https://maps.google.com/?q=Jadran+kod+Krsta+Budva',
    ),
    Restoran(
      sehir: 'Tivat',
      isim: 'Marea Restaurant',
      mutfak: 'İtalyan & Deniz Ürünleri',
      puan: '4.8 / 5.0',
      aciklama: 'Porto Montenegro yat limanında, modern bir ortamda dünya mutfağından seçkin tatlar sunan mekan.',
      haritaUrl: 'https://maps.google.com/?q=Marea+Tivat',
    ),
  ];

  Future<void> _haritayiAc(String urlStr) async {
    final Uri url = Uri.parse(urlStr);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Harita açılamadı: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restoranlar ve Yemek Yerleri')),
      body: ListView.builder(
        itemCount: restoranlar.length,
        itemBuilder: (context, index) {
          final res = restoranlar[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(res.sehir, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        backgroundColor: Colors.blueAccent,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(res.puan, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(res.isim, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(res.mutfak, style: TextStyle(color: Colors.grey[700], fontStyle: FontStyle.italic)),
                  const SizedBox(height: 8),
                  Text(res.aciklama, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton.icon(
                      onPressed: () => _haritayiAc(res.haritaUrl),
                      icon: const Icon(Icons.map, size: 18),
                      label: const Text('Haritada Konumunu Aç'),
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
