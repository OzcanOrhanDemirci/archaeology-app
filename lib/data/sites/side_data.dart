import '../../core/models.dart';

SiteData getSideData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'side',
    title: isTr ? 'Side (Antalya)' : 'Side',
    introText: isTr
        ? 'Nar anlamına gelen Side, Pamphylia bölgesinin en önemli liman kentidir. Yarımada üzerine kurulu olan kent, antik tiyatrosu, sütunlu caddeleri ve deniz kenarındaki Apollon Tapınağı ile eşsiz bir siluete sahiptir.'
        : 'Meaning "Pomegranate", Side is the most important port city of the Pamphylia region. Located on a peninsula, the city possesses a unique silhouette with its ancient theater, colonnaded streets, and the Temple of Apollo by the sea.',
    timeline: [
      TimelineData(label: isTr ? 'Luviler' : 'Luwian', targetBlockId: 'sd1'),
      TimelineData(label: isTr ? 'Helenistik' : 'Hellenistic', targetBlockId: 'sd2'),
      TimelineData(label: isTr ? 'Roma' : 'Roman', targetBlockId: 'sd3'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'Bizans' : 'Byzantine'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'sd1',
            imagePath: 'assets/images/side1.jpg',
            title: isTr ? 'I. Antik Tiyatro' : 'I. Ancient Theater',
            text: isTr
                ? 'Anadolu\'daki diğer tiyatroların aksine bir dağ yamacına değil, düz bir alana kemerli tonozlar üzerine inşa edilmiştir. 17.000 kişilik kapasitesiyle Roma mimari mühendisliğinin en özgün örneklerinden biridir.'
                : 'Unlike other theaters in Anatolia, it was not built on a mountain slope but on a flat area atop arched vaults. With a capacity of 17,000, it is one of the most unique examples of Roman architectural engineering.',
          ),
          ContentBlockModel(
            id: 'sd2',
            imagePath: 'assets/images/side2.jpg',
            title: isTr ? 'II. Apollon Tapınağı' : 'II. Temple of Apollo',
            text: isTr
                ? 'Side\'nin simgesi olan tapınak, MS 2. yüzyılda Roma Barışı (Pax Romana) döneminde inşa edilmiştir. Işık, güzellik ve sanat tanrısı Apollon\'a adanan yapı, gün batımındaki manzarasıyla ünlüdür.'
                : 'The symbol of Side, this temple was built in the 2nd century AD during the Pax Romana. Dedicated to Apollo, the god of light, beauty, and art, the structure is famous for its sunset view.',
          ),
          ContentBlockModel(
            id: 'sd3',
            imagePath: 'assets/images/side3.jpg',
            title: isTr ? 'III. Vespasian Anıtı ve Kapısı' : 'III. Vespasian Monument & Gate',
            text: isTr
                ? 'Kentin ana girişinde yer alan bu anıtsal kapı, İmparator Vespasianus onuruna yapılmıştır. Yanındaki anıtsal çeşme (Nymphaeum), geniş havuzu ve süslemeli cephesiyle kente gelenleri karşılardı.'
                : 'Located at the main entrance of the city, this monumental gate was built in honor of Emperor Vespasian. The adjacent monumental fountain (Nymphaeum) welcomed visitors with its large pool and decorated facade.',
          ),
        ],
      ),
      SiteSection(
        title: isTr ? 'Stratigrafik Analiz' : 'Stratigraphic Analysis',
        content: [
          AnalysisSectionModel(
            title: isTr
                ? 'Yarımada Yerleşimi ve Liman Stratigrafisi'
                : 'Peninsula Settlement and Harbor Stratigraphy',
            mainImage: 'assets/images/side_s.jpg',
            abstractText: isTr
                ? 'Side kesiti, düz bir yarımada üzerindeki yapılaşmanın zorluklarını ve Roma mühendisliğinin çözümlerini gösterir. Profil, kentin deniz seviyesinden (Liman) iç kısımlara doğru yükselişini ve tonozlu altyapı sistemlerini analiz eder.'
                : 'The Side section shows the challenges of construction on a flat peninsula and the solutions of Roman engineering. The profile analyzes the rise of the city from sea level (Harbor) inland and the vaulted infrastructure systems.',
            paragraphs: [
              AnalysisParagraph(
                title: isTr ? '1. Kıyı ve Liman Tabanı' : '1. Coast & Harbor Floor',
                content: [
                  {
                    'bold': isTr ? 'Deniz Seviyesi ve Rıhtım (Mavi/Gri):' : 'Sea Level and Quay (Blue/Grey):',
                    'text': isTr
                        ? ' Side, doğal bir liman kenti değildir; limanı mendireklerle yapay olarak oluşturulmuştur. Kesitin en sağında, denizin hemen kıyısında yükselen Apollon Tapınağı, gemiler için bir fener işlevi de görmüştür.'
                        : ' Side is not a natural harbor city; its harbor was artificially created with breakwaters. On the far right of the section, the Temple of Apollo rising right by the sea also served as a lighthouse for ships.'
                  },
                ],
              ),
              AnalysisParagraph(
                title: isTr ? '2. Yapay Yükseltiler (Tonozlar)' : '2. Artificial Elevations (Vaults)',
                content: [
                  {
                    'bold': isTr ? 'Tiyatro Altyapısı (Kırmızı/Tuğla):' : 'Theater Infrastructure (Red/Brick):',
                    'text': isTr
                        ? ' Kesitin en çarpıcı noktasıdır. Doğal bir tepe olmadığı için, tiyatronun oturma sıraları (cavea) devasa kemerli tonozlar üzerine oturtulmuştur. Bu, Side\'yi diğer Anadolu kentlerinden ayıran en önemli stratigrafik özelliktir.'
                        : ' The most striking point of the section. Since there was no natural hill, the theater\'s seating rows (cavea) were seated on massive arched vaults. This is the most important stratigraphic feature distinguishing Side from other Anatolian cities.'
                  },
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}