import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MonteDiscoverApp());
}

class MonteDiscoverApp extends StatelessWidget {
  const MonteDiscoverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monte Discover',
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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.explore, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 8),
            const Text('Monte Discover', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // Ana Ekran Logo / İkon Alanı
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue.shade200, width: 2),
                ),
                child: Icon(Icons.travel_explore, size: 64, color: Colors.blue.shade700),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Monte Discover',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Karadağ Keşif Rehberi',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
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

// ================= GEZİLECEK YERLER MODELİ =================
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

// ================= RESTORANLAR MODELİ VE SAYFASI =================
class Restoran {
  final String sehir;
  final String isim;
  final String mutfak;
  final String puan;
  final String fiyatSeviyesi;
  final String calismaSaatleri;
  final String adres;
  final String telefon;
  final String webSitesi;
  final String aciklama;
  final String resimUrl;
  final String haritaUrl;

  const Restoran({
    required this.sehir,
    required this.isim,
    required this.mutfak,
    required this.puan,
    required this.fiyatSeviyesi,
    required this.calismaSaatleri,
    required this.adres,
    required this.telefon,
    required this.webSitesi,
    required this.aciklama,
    required this.resimUrl,
    required this.haritaUrl,
  });
}

class RestoranlarSayfasi extends StatefulWidget {
  const RestoranlarSayfasi({super.key});

  @override
  State<RestoranlarSayfasi> createState() => _RestoranlarSayfasiState();
}

class _RestoranlarSayfasiState extends State<RestoranlarSayfasi> {
  final Set<String> _favoriler = {};

  static const List<Restoran> restoranlar = [
    Restoran(
      sehir: 'Kotor',
      isim: 'Stari Mlini',
      mutfak: 'Deniz Ürünleri & Fine Dining',
      puan: '4.9 / 5.0',
      fiyatSeviyesi: '€€€€ (Yüksek)',
      calismaSaatleri: '12:00 - 23:00',
      adres: 'Ljuta bb, Kotor 85330',
      telefon: '+382 32 333 555',
      webSitesi: 'https://www.starimlini.com',
      aciklama: 'Kotor Körfezi\'nde, tarihi bir su değirmeninden dönüştürülmüş, eşsiz manzarası ve üst düzey deniz ürünleriyle ünlü efsanevi restoran.',
      resimUrl: 'https://picsum.photos/id/1020/800/600',
      haritaUrl: 'https://maps.google.com/?q=Stari+Mlini+Kotor',
    ),
    Restoran(
      sehir: 'Podgorica',
      isim: 'Niagara Restoran',
      mutfak: 'Şelale Kenarı & Balık & Izgara',
      puan: '4.8 / 5.0',
      fiyatSeviyesi: '€€€ (Orta-Yüksek)',
      calismaSaatleri: '09:00 - 00:00',
      adres: 'Cijevna bb, Podgorica',
      telefon: '+382 67 234 567',
      webSitesi: 'https://www.niagararestoran.com',
      aciklama: 'Şelale manzarasıyla ünlü, özellikle taze balık ve yöresel et yemekleri sunan efsanevi mekan.',
      resimUrl: 'https://picsum.photos/id/1040/800/600',
      haritaUrl: 'https://maps.google.com/?q=Niagara+Restaurant+Podgorica',
    ),
    Restoran(
      sehir: 'Podgorica',
      isim: 'Salas 23',
      mutfak: 'Doğal & Çiftlik Konsepti',
      puan: '4.7 / 5.0',
      fiyatSeviyesi: '€€ (Orta)',
      calismaSaatleri: '10:00 - 23:00',
      adres: 'Spuž, Podgorica yakınları',
      telefon: '+382 68 345 678',
      webSitesi: 'https://www.salas23.me',
      aciklama: 'Doğal ortamı, çiftlik konsepti ve huzurlu atmosferiyle bilinen harika bir dinlenme ve yemek noktası.',
      resimUrl: 'https://picsum.photos/id/1060/800/600',
      haritaUrl: 'https://maps.google.com/?q=Salas+23+Podgorica',
    ),
    Restoran(
      sehir: 'Podgorica',
      isim: 'Restoran Dedovina',
      mutfak: 'Geleneksel Karadağ Mutfağı',
      puan: '4.8 / 5.0',
      fiyatSeviyesi: '€€€ (Orta-Yüksek)',
      calismaSaatleri: '08:00 - 23:00',
      adres: 'Vaka Đurovića, Podgorica',
      telefon: '+382 20 665 443',
      webSitesi: 'https://www.dedovina.me',
      aciklama: 'Geleneksel Karadağ mutfağının en otantik lezzetlerini sunan popüler yerel restoran.',
      resimUrl: 'https://picsum.photos/id/1050/800/600',
      haritaUrl: 'https://maps.google.com/?q=Restoran+Dedovina+Podgorica',
    ),
    Restoran(
      sehir: 'Podgorica',
      isim: 'Spago',
      mutfak: 'Dünya Mutfağı & Pizza',
      puan: '4.6 / 5.0',
      fiyatSeviyesi: '€€ (Orta)',
      calismaSaatleri: '08:00 - 01:00',
      adres: 'Bulevar Stanka Dragojevića, Podgorica',
      telefon: '+382 20 667 889',
      webSitesi: 'https://www.spagopg.me',
      aciklama: 'Şehir merkezinde lezzetli dünya mutfağı, pizza ve şık sunumlarıyla öne çıkan mekan.',
      resimUrl: 'https://picsum.photos/id/1080/800/600',
      haritaUrl: 'https://maps.google.com/?q=Spago+Podgorica',
    ),
    Restoran(
      sehir: 'Podgorica',
      isim: 'Zenghe',
      mutfak: 'Uzak Doğu & Asya Mutfağı',
      puan: '4.7 / 5.0',
      fiyatSeviyesi: '€€€ (Orta-Yüksek)',
      calismaSaatleri: '11:00 - 23:00',
      adres: 'Moskovska, Podgorica',
      telefon: '+382 20 234 111',
      webSitesi: 'https://www.zenghe.me',
      aciklama: 'Podgorica\'da Uzak Doğu ve Asya mutfağı arayanlar için önde gelen restoranlardan biri.',
      resimUrl: 'https://picsum.photos/id/1081/800/600',
      haritaUrl: 'https://maps.google.com/?q=Zenghe+Podgorica',
    ),
    Restoran(
      sehir: 'Podgorica',
      isim: 'Perşemple',
      mutfak: 'Yerel & Kafe Restoran',
      puan: '4.6 / 5.0',
      fiyatSeviyesi: '€€ (Orta)',
      calismaSaatleri: '07:00 - 23:00',
      adres: 'Center, Podgorica',
      telefon: '+382 20 555 432',
      webSitesi: 'https://www.persemple.me',
      aciklama: 'Şehrin sevilen ve samimi buluşma noktalarından biri.',
      resimUrl: 'https://picsum.photos/id/1082/800/600',
      haritaUrl: 'https://maps.google.com/?q=Persemple+Podgorica',
    ),
    Restoran(
      sehir: 'Podgorica',
      isim: 'Pod Volat',
      mutfak: 'Balkan & Karadağ Mutfağı',
      puan: '4.8 / 5.0',
      fiyatSeviyesi: '€€ (Orta)',
      calismaSaatleri: '08:00 - 00:00',
      adres: 'Trg Bećir-beg Osmanagića, Podgorica',
      telefon: '+382 20 633 666',
      webSitesi: 'https://www.podvolat.me',
      aciklama: 'Podgorica\'nın kalbinde geleneksel et yemekleri ve ev yapımı lezzetler.',
      resimUrl: 'https://picsum.photos/id/1083/800/600',
      haritaUrl: 'https://maps.google.com/?q=Pod+Volat+Podgorica',
    ),
    Restoran(
      sehir: 'Kotor',
      isim: 'Galion Restaurant',
      mutfak: 'Deniz Ürünleri & Fine Dining',
      puan: '4.9 / 5.0',
      fiyatSeviyesi: '€€€€ (Yüksek)',
      calismaSaatleri: '13:00 - 23:30',
      adres: 'Šetalište Kapetan Iva Vizina, Kotor',
      telefon: '+382 32 337 400',
      webSitesi: 'https://www.galion.me',
      aciklama: 'Kotor körfezi manzarasına nazır lüks akşam yemekleri ve şef tabakları.',
      resimUrl: 'https://picsum.photos/id/1084/800/600',
      haritaUrl: 'https://maps.google.com/?q=Galion+Restaurant+Kotor',
    ),
    Restoran(
      sehir: 'Budva',
      isim: 'Konoba Stari Grad',
      mutfak: 'Balkan & Izgara',
      puan: '4.8 / 5.0',
      fiyatSeviyesi: '€€€ (Orta-Yüksek)',
      calismaSaatleri: '10:00 - 00:00',
      adres: 'Stari Grad, Budva 85310',
      telefon: '+382 33 451 222',
      webSitesi: 'https://www.konobastarigrad.me',
      aciklama: 'Budva Eski Kenti\'nin içinde tarihi dokuda geleneksel ızgara lezzetleri.',
      resimUrl: 'https://picsum.photos/id/1085/800/600',
      haritaUrl: 'https://maps.google.com/?q=Konoba+Stari+Grad+Budva',
    ),
    Restoran(
      sehir: 'Budva',
      isim: 'Restaurant Jadran Kod Krsta',
      mutfak: 'Deniz Ürünleri & Balık',
      puan: '4.7 / 5.0',
      fiyatSeviyesi: '€€€ (Orta-Yüksek)',
      calismaSaatleri: '08:00 - 00:00',
      adres: 'Slovenska obala, Budva',
      telefon: '+382 33 451 028',
      webSitesi: 'https://www.jadranbudva.com',
      aciklama: 'Budva sahilinde onlarca yıldır taze balık ve deniz mahsulleri sunan efsane mekan.',
      resimUrl: 'https://picsum.photos/id/1086/800/600',
      haritaUrl: 'https://maps.google.com/?q=Restaurant+Jadran+Kod+Krsta+Budva',
    ),
    Restoran(
      sehir: 'Tivat',
      isim: 'Marea Restaurant',
      mutfak: 'İtalyan & Deniz Ürünleri',
      puan: '4.8 / 5.0',
      fiyatSeviyesi: '€€€€ (Yüksek)',
      calismaSaatleri: '12:00 - 00:00',
      adres: 'Porto Montenegro, Tivat',
      telefon: '+382 32 674 888',
      webSitesi: 'https://www.marea.me',
      aciklama: 'Porto Montenegro yat limanında şık ve seçkin tatlar.',
      resimUrl: 'https://picsum.photos/id/1087/800/600',
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
      appBar: AppBar(
        title: const Text('Restoranlar ve Yemek Yerleri'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Favori sayınız: ${_favoriler.length}')),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: restoranlar.length,
        itemBuilder: (context, index) {
          final res = restoranlar[index];
          final isFavori = _favoriler.contains(res.isim);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestoranDetaySayfasi(restoran: res)),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        res.resimUrl,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) => Container(
                          height: 160,
                          color: Colors.grey[300],
                          child: const Icon(Icons.restaurant, size: 50, color: Colors.grey),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              isFavori ? Icons.favorite : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                if (isFavori) {
                                  _favoriler.remove(res.isim);
                                } else {
                                  _favoriler.add(res.isim);
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 8,
                        child: Chip(
                          label: Text(res.sehir, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          backgroundColor: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                res.isim,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 18),
                                const SizedBox(width: 4),
                                Text(res.puan, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(res.mutfak, style: TextStyle(color: Colors.grey[700], fontStyle: FontStyle.italic, fontSize: 13)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.euro_symbol, size: 16, color: Colors.green),
                            const SizedBox(width: 4),
                            Text(res.fiyatSeviyesi, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            const Icon(Icons.access_time, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(res.calismaSaatleri, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton.icon(
                              onPressed: () => _haritayiAc(res.haritaUrl),
                              icon: const Icon(Icons.map, size: 16),
                              label: const Text('Haritada Aç'),
                              style: OutlinedButton.styleFrom(visualDensity: VisualDensity.compact),
                            ),
                          ],
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

// ================= RESTORAN DETAY SAYFASI =================
class RestoranDetaySayfasi extends StatelessWidget {
  final Restoran restoran;
  const RestoranDetaySayfasi({super.key, required this.restoran});

  Future<void> _haritayiAc(String urlStr) async {
    final Uri url = Uri.parse(urlStr);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Harita açılamadı: $url');
    }
  }

  Future<void> _aramayiBaslat(String tel) async {
    final Uri url = Uri.parse('tel:$tel');
    if (!await launchUrl(url)) {
      throw Exception('Arama yapılamadı');
    }
  }

  Future<void> _webAc(String webUrl) async {
    final Uri url = Uri.parse(webUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Web sitesi açılamadı');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(restoran.isim)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(restoran.resimUrl, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(restoran.sehir, style: const TextStyle(color: Colors.white)),
                        backgroundColor: Colors.blueAccent,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(restoran.puan, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(restoran.isim, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  Text(restoran.mutfak, style: TextStyle(color: Colors.grey[700], fontStyle: FontStyle.italic, fontSize: 16)),
                  const SizedBox(height: 16),
                  Text(restoran.aciklama, style: const TextStyle(fontSize: 15, height: 1.5)),
                  const Divider(height: 30),
                  
                  ListTile(
                    leading: const Icon(Icons.euro, color: Colors.green),
                    title: const Text('Fiyat Seviyesi'),
                    subtitle: Text(restoran.fiyatSeviyesi),
                  ),
                  ListTile(
                    leading: const Icon(Icons.access_time, color: Colors.orange),
                    title: const Text('Çalışma Saatleri'),
                    subtitle: Text(restoran.calismaSaatleri),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.red),
                    title: const Text('Adres'),
                    subtitle: Text(restoran.adres),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone, color: Colors.blue),
                    title: const Text('Telefon'),
                    subtitle: Text(restoran.telefon),
                    onTap: () => _aramayiBaslat(restoran.telefon),
                  ),
                  ListTile(
                    leading: const Icon(Icons.language, color: Colors.purple),
                    title: const Text('Web Sitesi'),
                    subtitle: Text(restoran.webSitesi, style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
                    onTap: () => _webAc(restoran.webSitesi),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: () => _haritayiAc(restoran.haritaUrl),
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
