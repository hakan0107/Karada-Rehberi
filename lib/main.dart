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
  final String sehir;
  final String aciklama;
  final String detayliAciklama;
  final String resimUrl;
  final String haritaUrl;

  const GezilecekYer({
    required this.baslik,
    required this.sehir,
    required this.aciklama,
    required this.detayliAciklama,
    required this.resimUrl,
    required this.haritaUrl,
  });
}

class GezilecekYerlerSayfasi extends StatelessWidget {
  const GezilecekYerlerSayfasi({super.key});

  static const List<GezilecekYer> yerler = [
    GezilecekYer(
      baslik: 'Kotor Körfezi (Boka Kotorska)',
      sehir: 'Kotor',
      aciklama: 'Dünyanın en güzel körfezlerinden biri, tarihi surlar ve fjord benzeri doğa.',
      detayliAciklama: 'Kotor Körfezi, Adriyatik Denizi\'nin güneyinde yer alan ve sıklıkla Avrupa\'nın en güneydeki fiyordu olarak anılan muazzam bir coğrafyadır.',
      resimUrl: 'https://picsum.photos/id/1015/800/600',
      haritaUrl: 'https://maps.google.com/?q=Kotor+Bay',
    ),
    GezilecekYer(
      baslik: 'Kotor Old Town',
      sehir: 'Kotor',
      aciklama: 'Orta çağdan kalma surları, dar sokakları ve kedileriyle ünlü UNESCO mirası.',
      detayliAciklama: 'Venedik etkileri taşıyan tarihi yapıları, hareketli meydanları ve St. Tryphon Katedrali ile Karadağ\'ın turizm kalbidir.',
      resimUrl: 'https://picsum.photos/id/1035/800/600',
      haritaUrl: 'https://maps.google.com/?q=Kotor+Old+Town',
    ),
    GezilecekYer(
      baslik: 'Ostrog Manastırı',
      sehir: 'Nikšić',
      aciklama: 'Kayalıkların dik yamacına tamamen oyulmuş mucizevi Ortodoks manastırı.',
      detayliAciklama: 'Zeta vadisinin yükseklerinde, neredeyse dikey bir kayalığın içine oyulmuş olan Ostrog Manastırı, kutsal bir hac merkezidir.',
      resimUrl: 'https://picsum.photos/id/1039/800/600',
      haritaUrl: 'https://maps.google.com/?q=Ostrog+Monastery',
    ),
    GezilecekYer(
      baslik: 'Budva Old Town',
      sehir: 'Budva',
      aciklama: 'Yüksek surları, daracık taş sokakları ve Venedik mimarisiyle Adriyatik\'in kalbi.',
      detayliAciklama: '2.500 yılı aşkın geçmişiyle Adriyatik kıyısındaki en eski yerleşim yerlerinden biridir.',
      resimUrl: 'https://picsum.photos/id/1043/800/600',
      haritaUrl: 'https://maps.google.com/?q=Budva+Old+Town',
    ),
    GezilecekYer(
      baslik: 'Sveti Stefan',
      sehir: 'Budva',
      aciklama: 'Denizin içindeki adacığa bağlı tarihi taş evleriyle Karadağ\'ın simgesi.',
      detayliAciklama: 'Eskiden bir balıkçı köyü olan, günümüzde ise lüks bir tatil beldesi ve ülkenin en ikonik kartpostal görüntüsüdür.',
      resimUrl: 'https://picsum.photos/id/1069/800/600',
      haritaUrl: 'https://maps.google.com/?q=Sveti+Stefan',
    ),
    GezilecekYer(
      baslik: 'Durmitor Millî Parkı',
      sehir: 'Žabljak',
      aciklama: 'Devasa dağları, derin kanyonları ve eşsiz buzul gölleriyle doğa cenneti.',
      detayliAciklama: 'Karadağ\'ın kuzeyinde yer alan Durmitor Milli Parkı, Tara Nehri Kanyonu ve Kara Göl ile doğa severlerin vazgeçilmezidir.',
      resimUrl: 'https://picsum.photos/id/1057/800/600',
      haritaUrl: 'https://maps.google.com/?q=Durmitor+National+Park',
    ),
    GezilecekYer(
      baslik: 'Biogradska Gora Millî Parkı',
      sehir: 'Kolašin',
      aciklama: 'Avrupa\'nın kalan son yaşlı ormanlarından biri ve ortasında büyüleyici göl.',
      detayliAciklama: 'Bjelasica dağlarında yer alan milli park, devasa ağaçları ve Biogradsko gölü ile muazzam bir yürüyüş alanıdır.',
      resimUrl: 'https://picsum.photos/id/1074/800/600',
      haritaUrl: 'https://maps.google.com/?q=Biogradska+Gora',
    ),
    GezilecekYer(
      baslik: 'Lovćen Millî Parkı & Njegoš Mozolesi',
      sehir: 'Cetinje',
      aciklama: 'Karadağ\'ın dağlık ruhunu temsil eden zirve ve muhteşem dağ manzarası.',
      detayliAciklama: 'Lovćen dağının tepesinde bulunan anıt mezar, ülkenin neredeyse tamamını görebileceğiniz nefis bir panoramik açı sunar.',
      resimUrl: 'https://picsum.photos/id/1025/800/600',
      haritaUrl: 'https://maps.google.com/?q=Lovcen+National+Park',
    ),
    GezilecekYer(
      baslik: 'Skadar Gölü Millî Parkı',
      sehir: 'Virpazar',
      aciklama: 'Balkanlar\'ın en büyük gölü, kuş cenneti ve tekne turlarının merkezi.',
      detayliAciklama: 'Zengin bitki örtüsü ve endemik kuş türleriyle ünlü harika bir sulak alandır.',
      resimUrl: 'https://picsum.photos/id/1016/800/600',
      haritaUrl: 'https://maps.google.com/?q=Skadar+Lake',
    ),
    GezilecekYer(
      baslik: 'Porto Montenegro',
      sehir: 'Tivat',
      aciklama: 'Lüks yatların, modern butiklerin ve şık restoranların bulunduğu marina bölgesi.',
      detayliAciklama: 'Karadağ\'ın lüks turizm yüzü olan Tivat, modern mimarisi ve sahil yürüyüş yollarıyla popülerdir.',
      resimUrl: 'https://picsum.photos/id/1024/800/600',
      haritaUrl: 'https://maps.google.com/?q=Porto+Montenegro+Tivat',
    ),
    GezilecekYer(
      baslik: 'Stari Bar (Eski Bar)',
      sehir: 'Bar',
      aciklama: 'Zeytin ağaçları arasında kalmış terk edilmiş tarihi sur şehir kalıntıları.',
      detayliAciklama: 'Binlerce yıllık zeytin ağaçları ile çevrili olan bu antik kent, dağ eteklerinde gizlenmiş tarihi bir açıkhava müzesidir.',
      resimUrl: 'https://picsum.photos/id/1031/800/600',
      haritaUrl: 'https://maps.google.com/?q=Stari+Bar',
    ),
    GezilecekYer(
      baslik: 'Perast ve Our Lady of the Rocks',
      sehir: 'Kotor Körfezi',
      aciklama: 'Barok tarzı sarayları ve körfezin ortasındaki yapay adasıyla masalsı kasaba.',
      detayliAciklama: 'Kotor körfezinde yer alan Perast, karşısındaki kayalara kurulmuş yapay ada kilisesi ile en çok ziyaret edilen yerlerdendir.',
      resimUrl: 'https://picsum.photos/id/1041/800/600',
      haritaUrl: 'https://maps.google.com/?q=Perast+Montenegro',
    ),
    GezilecekYer(
      baslik: 'Ulsinj Eski Şehri ve Sahili',
      sehir: 'Ulcinj',
      aciklama: 'Korsan geçmişi olan tarihi surlar ve Adriyatik\'in en uzun kumsalları.',
      detayliAciklama: 'Karadağ\'ın güney ucunda yer alan Ulcinj, tarihi kalitesi, uzun kumsalları ve doğu kültürü izleriyle dikkat çeker.',
      resimUrl: 'https://picsum.photos/id/1050/800/600',
      haritaUrl: 'https://maps.google.com/?q=Ulcinj+Old+Town',
    ),
    GezilecekYer(
      baslik: 'Ada Bojana',
      sehir: 'Ulcinj',
      aciklama: 'Nehir ile denizin buluştuğu, ahşap evleri ve balık restoranlarıyla ünlü Delta.',
      detayliAciklama: 'Bojana nehrinin adayı oluşturduğu, gün batımı manzaraları ve eşsiz doğasıyla huzur veren özel bir tatil noktasıdır.',
      resimUrl: 'https://picsum.photos/id/1060/800/600',
      haritaUrl: 'https://maps.google.com/?q=Ada+Bojana',
    ),
    GezilecekYer(
      baslik: 'Cetinje Manastırı ve Tarihi Müze Kenti',
      sehir: 'Cetinje',
      aciklama: 'Karadağ\'ın eski kraliyet başkenti ve tarihi yapıtların merkezi.',
      detayliAciklama: 'Lovćen dağının eteklerinde kurulu olan Cetinje, ülkenin kültürel mirasını yansıtan müzeleri ve manastırlarıyla doludur.',
      resimUrl: 'https://picsum.photos/id/1070/800/600',
      haritaUrl: 'https://maps.google.com/?q=Cetinje+Monastery',
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
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(yer.sehir, style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.w500, fontSize: 12)),
                  Text(yer.aciklama, maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
              isThreeLine: true,
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
                  Chip(
                    label: Text(yer.sehir, style: const TextStyle(color: Colors.white)),
                    backgroundColor: Colors.blueAccent,
                  ),
                  const SizedBox(height: 8),
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

  static const List<Restoran> restoranlar = [
    Restoran(
      sehir: 'Podgorica',
      isim: 'Pod Volat',
      mutfak: 'Balkan & Karadağ Mutfağı',
      puan: '4.8 / 5.0',
      aciklama: 'Podgorica\'nın kalbinde geleneksel et yemekleri.',
      haritaUrl: 'https://maps.google.com/?q=Pod+Volat+Podgorica',
    ),
    Restoran(
      sehir: 'Kotor',
      isim: 'Galion Restaurant',
      mutfak: 'Deniz Ürünleri & Fine Dining',
      puan: '4.9 / 5.0',
      aciklama: 'Kotor körfezi manzarasına nazır lüks akşam yemekleri.',
      haritaUrl: 'https://maps.google.com/?q=Galion+Restaurant+Kotor',
    ),
    Restoran(
      sehir: 'Budva',
      isim: 'Konoba Stari Grad',
      mutfak: 'Balkan & Izgara',
      puan: '4.8 / 5.0',
      aciklama: 'Budva Eski Kenti\'nin içinde tarihi dokuda ızgara lezzetleri.',
      haritaUrl: 'https://maps.google.com/?q=Konoba+Stari+Grad+Budva',
    ),
    Restoran(
      sehir: 'Tivat',
      isim: 'Marea Restaurant',
      mutfak: 'İtalyan & Deniz Ürünleri',
      puan: '4.8 / 5.0',
      aciklama: 'Porto Montenegro yat limanında seçkin tatlar.',
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
