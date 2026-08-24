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
          children: [
            const Text(
              'Karadağ Keşif Rehberi',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GezilecekYerlerSayfasi()),
                );
              },
              icon: const Icon(Icons.place),
              label: const Text('Gezilecek Yerler'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
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
      detayliAciklama: 'Kotor Körfezi (Boka Kotorska), Adriyatik Denizi\'nin güneyinde yer alan ve sıklıkla Avrupa\'nın en güneydeki fiyordu olarak anılan muazzam bir körfeze sahiptir. Sarp dağların denize dikine indiği bu coğrafyada; tarihi surlarla çevrili Kotor Eski Şehri, Perast kasabası ve ortadaki adacıklar büyüleyici bir atmosfer sunmaktadır. UNESCO Dünya Mirası listesinde yer alan bölge, tarihi ve doğal güzellikleriyle Karadağ\'ın kalbidir.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Kotor_bay_from_Vrmac_2.jpg/800px-Kotor_bay_from_Vrmac_2.jpg',
      haritaUrl: 'https://maps.google.com/?q=Kotor+Bay',
    ),
    GezilecekYer(
      baslik: 'Ostrog Manastırı',
      aciklama: 'Kayalıkların dik yamacına tamamen oyulmuş mucizevi Ortodoks manastırı.',
      detayliAciklama: 'Zeta vadisinin yükseklerinde, neredeyse dikey bir kayalığın içine oyulmuş olan Ostrog Manastırı, Sırp Ortodoks Kilisesi\'nin Balkanlar\'daki en önemli hac merkezlerinden biridir. 17. yüzyılda Aziz Basil tarafından kurulan manastır, hem mimari hem de manevi açıdan ziyaretçilerini hayrete düşürür. Kayanın içinden süzülen suyun ve mucizevi hikayelerin yanı sıra sunduğu vadi manzarası nefis kesicidir.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Ostrog_Monastery_02.jpg/800px-Ostrog_Monastery_02.jpg',
      haritaUrl: 'https://maps.google.com/?q=Ostrog+Monastery',
    ),
    GezilecekYer(
      baslik: 'Budva Old Town',
      aciklama: 'Yüksek surları, daracık taş sokakları ve Venedik mimarisiyle Adriyatik\'in kalbi.',
      detayliAciklama: '2.500 yılı aşkın geçmişiyle Adriyatik kıyısındaki en eski yerleşim yerlerinden biri olan Budva Eski Şehri (Stari Grad); Orta Çağ surları, dar labirent sokakları, taş evleri ve hareketli meydanlarıyla ünlüdür. Venedik Cumhuriyeti izlerini taşıyan bu tarihi bölge, günümüzde butik otelleri, kafe ve restoranları, sahil yürüyüş yolları ve muazzam plajlarıyla ülkenin turizm başkentidir.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Budva_Stari_Grad_2017.jpg/800px-Budva_Stari_Grad_2017.jpg',
      haritaUrl: 'https://maps.google.com/?q=Budva+Old+Town',
    ),
    GezilecekYer(
      baslik: 'Durmitor Millî Parkı',
      aciklama: 'Devasa dağları, derin kanyonları ve eşsiz buzul gölleriyle doğa cenneti.',
      detayliAciklama: 'Karadağ\'ın kuzeyinde yer alan Durmitor Milli Parkı, 20\'den fazla 2.000 metrenin üzerindeki zirvesi, buzul gölleri ("dağ gözleri" olarak anılır) ve Avrupa\'nın en derin kanyonu olan Tara Kanyonu ile doğa tutkunlarının cennetidir. Yürüyüş, kış sporları, rafting ve kamp için muazzam bir ekosisteme sahiptir.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Durmitor_National_Park_Montenegro.jpg/800px-Durmitor_National_Park_Montenegro.jpg',
      haritaUrl: 'https://maps.google.com/?q=Durmitor+National+Park',
    ),
    GezilecekYer(
      baslik: 'Sveti Stefan',
      aciklama: 'Denizin ortasında ince bir yolla karaya bağlanan ikonik kartpostal adacık.',
      detayliAciklama: '15. yüzyıldan kalma tahkim edilmiş bir balıkçı köyüyken günümüzde dünyanın en lüks ve prestijli tatil köylerinden birine dönüştürülen Sveti Stefan, ana karaya dar bir kumsal yoluyla bağlıdır. Pembe kireçtaşı evleri ve muhteşem rengiyle Karadağ\'ın turizm simgelerinin başında gelmektedir.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Sveti_Stefan_Montenegro_2018.jpg/800px-Sveti_Stefan_Montenegro_2018.jpg',
      haritaUrl: 'https://maps.google.com/?q=Sveti+Stefan',
    ),
    GezilecekYer(
      baslik: 'Rijeka Crnojevića',
      aciklama: 'At nalı kıvrımı manzarası ve tarihi taş köprüsüyle meşhur nehir kasabası.',
      detayliAciklama: 'İşkodra Gölü\'ne dökülen Rijeka Crnojevića nehrinin kıyısında kurulmuş huzurlu bir kasabadır. Nehrin dağlar arasında yaptığı meşhur "at nalı" kıvrımı (Pavlova Strana seyir terasından görünür), Karadağ\'ın en ikonik fotoğraf karelerinden birini oluşturur. Tarihi taş köprüsü ve yöresel balık restoranlarıyla bilinir.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Rijeka_Crnojevica_river_bend.jpg/800px-Rijeka_Crnojevica_river_bend.jpg',
      haritaUrl: 'https://maps.google.com/?q=Rijeka+Crnojevica',
    ),
    GezilecekYer(
      baslik: 'İşkodra Gölü (Skadar)',
      aciklama: 'Su zambakları, yüzlerce kuş türü ve tekne turlarıyla Balkanlar\'ın en büyük gölü.',
      detayliAciklama: 'Güneydoğu Avrupa\'nın en büyük gölü olan İşkodra Gölü, Karadağ ile Arnavutluk sınırları arasında yer alır. Yüzlerce kuş türüne (özellikle pelikanlara) ev sahipliği yapan milli park, su zambaklarıyla kaplı yüzeyi, geleneksel balıkçı köyleri ve keyifli tekne turlarıyla eşsiz bir biyolojik çeşitliliğe sahiptir.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Skadar_Lake_Montenegro.jpg/800px-Skadar_Lake_Montenegro.jpg',
      haritaUrl: 'https://maps.google.com/?q=Skadar+Lake',
    ),
    GezilecekYer(
      baslik: 'Podgorica Niagara Şelalesi',
      aciklama: 'Cijevna nehri üzerinde, karların erimesiyle muazzam bir görsellik sunan şelale.',
      detayliAciklama: 'Başkent Podgorica\'ya çok yakın bir konumda, Cijevna Nehri üzerinde bulunan Niagara Şelalesi, adını Kanada\'daki büyük benzerinden alır. Özellikle ilkbahar aylarında dağlardaki karların erimesiyle su seviyesi zirve yapar ve etrafındaki popüler restoranlarla harika bir dinlenme alanı sunar.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Niagara_waterfall_near_Podgorica.jpg/800px-Niagara_waterfall_near_Podgorica.jpg',
      haritaUrl: 'https://maps.google.com/?q=Niagara+Waterfall+Podgorica',
    ),
    GezilecekYer(
      baslik: 'Dajbabe Manastırı (Beyaz Kilise)',
      aciklama: 'Podgorica\'da bir mağaranın içine oyulmuş eşsiz ve manevi Ortodoks manastırı.',
      detayliAciklama: 'Dajbabe köyü yakınlarında, Dajbabe Tepesi\'nin eteklerinde yer alan bu manastır, tamamen doğal bir mağara sisteminin içerisine inşa edilmiştir. İçeriye girdiğinizde dar koridorları ve kaya duvarlarına yapılmış orijinal freskleriyle son derece huzurlu ve mistik bir ortama sahiptir.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Manastir_Dajbabe.jpg/800px-Manastir_Dajbabe.jpg',
      haritaUrl: 'https://maps.google.com/?q=Dajbabe+Monastery',
    ),
    GezilecekYer(
      baslik: 'Stari Bar (Eski Bar)',
      aciklama: 'Dağ eteğinde kurulmuş, binlerce yıllık zeytin ağaçlarıyla dolu tarihi hayalet şehir.',
      detayliAciklama: 'Modern Bar şehrinin birkaç kilometre iç kesimlerinde, sarp bir dağ yamacında yer alan Stari Bar, terk edilmiş antik bir kalıntılar şehridir. 19. sonlarında yaşanan patlamalar ve depremler nedeniyle boşaltılmış olsa da; kaleleri, Osmanlı su kemerleri, camileri ve dünyanın en eski zeytin ağaçlarından biri (2000+ yıllık) burada ziyaretçilerini beklemektedir.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Stari_Bar_ruins.jpg/800px-Stari_Bar_ruins.jpg',
      haritaUrl: 'https://maps.google.com/?q=Stari+Bar',
    ),
    GezilecekYer(
      baslik: 'Ülgün (Ulcinj)',
      aciklama: 'Osmanlı izleri taşıyan, uzun plajları ve korsan geçmişiyle ünlü güney şehri.',
      detayliAciklama: 'Karadağ\'ın Arnavut sınırına en yakın güney ucunda yer alan Ülgün (Ulcinj), 2000 yılı aşkın tarihi boyunca korsanların saklanma yeri olmuş ve Osmanlı döneminde önemli bir liman kenti kalmıştır. Uzun kumlu plajları (Velika Plaža), doğu mimarili çarşısı ve sıcak iklimiyle farklı bir kültürel deneyim sunar.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Ulcinj_Old_Town_2016.jpg/800px-Ulcinj_Old_Town_2016.jpg',
      haritaUrl: 'https://maps.google.com/?q=Ulcinj',
    ),
    GezilecekYer(
      baslik: 'Cetinje Tarihi Şehri',
      aciklama: 'Karadağ\'ın eski kraliyet başkenti, tarihi müzeleri ve Cetinje Manastırı.',
      detayliAciklama: 'Lovćen Dağı eteklerinde kurulmuş olan Cetinje, Karadağ\'ın tarihi ve kültürel başkentidir. 19. yüzyıl mimarisine sahip eski elçilik binaları, müzeleri, kraliyet sarayları ve binlerce yıllık kutsal emanetleri (Hristiyanlığa ait el izi vb.) barındıran Cetinje Manastırı ile ülkenin ruhunu yansıtır.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Cetinje_Monastery_Montenegro.jpg/800px-Cetinje_Monastery_Montenegro.jpg',
      haritaUrl: 'https://maps.google.com/?q=Cetinje',
    ),
    GezilecekYer(
      baslik: 'Perast & Kayalardaki Meryem',
      aciklama: 'Venedik mimarili sakin kasaba ve açıklarındaki yapay adacık kilisesi.',
      detayliAciklama: 'Kotor Körfezi\'nde bulunan Perast, barok tarzı sarayları ve deniz kenarındaki taş evleriyle sakinliği sevenlerin favorisidir. Açıklarında yer alan ve tamamen yapay olarak inşa edilmiş olan "Gospa od Škrpjela" (Kayalardaki Meryem) adacığı ve üzerindeki tarihi kilise, kasabanın en önemli simgesidir.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Perast_Montenegro.jpg/800px-Perast_Montenegro.jpg',
      haritaUrl: 'https://maps.google.com/?q=Perast',
    ),
    GezilecekYer(
      baslik: 'Kolaşin Kayak Merkezi',
      aciklama: 'Bjelasica Dağı eteklerinde modern pistleri ve kış turizmiyle ünlü dağ merkezi.',
      detayliAciklama: 'Bjelasica Dağları\'nın eteklerinde kurulu olan Kolaşin, Karadağ\'ın kış turizmi başkentidir. Modern telesiyejleri, çam ormanlarıyla çevrili kayak pistleri ve yaz aylarındaki doğa yürüyüşü rotalarıyla yılın her dönemi ayrı bir cazibe merkezidir.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Kolasin_Montenegro.jpg/800px-Kolasin_Montenegro.jpg',
      haritaUrl: 'https://maps.google.com/?q=Kolasin+Ski+Centre',
    ),
    GezilecekYer(
      baslik: 'Biogradska Gora Milli Parkı',
      aciklama: 'Avrupa\'nın son yaşlı ormanlarından biri ve ortasındaki büyüleyici buzul gölü.',
      detayliAciklama: 'Biogradska Gora, Avrupa\'da günümüze kadar korunabilmiş son üç büyük yaşlı ormandan (virgin forest) biridir. Parkın tam ortasında yer alan muhteşem buzul gölü ve etrafındaki ahşap yürüyüş yolları, doğanın en saf halini deneyimlemek isteyenler için eşsiz bir rotadır.',
      resimUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Biogradsko_jezero_2011.jpg/800px-Biogradsko_jezero_2011.jpg',
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
      appBar: AppBar(
        title: const Text('Gezilecek Yerler'),
      ),
      body: ListView.builder(
        itemCount: yerler.length,
        itemBuilder: (context, index) {
          final yer = yerler[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YerDetaySayfasi(yer: yer),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        yer.resimUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image_not_supported, size: 60),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            yer.baslik,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            yer.aciklama,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.map, color: Colors.blue, size: 28),
                      onPressed: () => _haritayiAc(yer.haritaUrl),
                      tooltip: 'Haritada Aç',
                    ),
                  ],
                ),
              ),
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
      appBar: AppBar(
        title: Text(yer.baslik),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              yer.resimUrl,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 250,
                color: Colors.grey,
                child: const Icon(Icons.image_not_supported, size: 80, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    yer.baslik,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    yer.detayliAciklama,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () => _haritayiAc(yer.haritaUrl),
                    icon: const Icon(Icons.map, size: 24),
                    label: const Text(
                      'Haritada Konumunu Aç',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
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
