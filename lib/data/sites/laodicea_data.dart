import '../../core/models.dart';

SiteData getLaodiceaData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'laodicea',
    title: isTr ? 'Laodikya (Denizli)' : 'Laodicea',
    introText: isTr
        ? 'Lykos (Çürüksu) Vadisi\'nde kurulan Laodikya, İncil\'de adı geçen 7 kiliseden birine ev sahipliği yapar. Antik çağın en zengin tekstil, finans ve tıp merkezlerinden biriydi. Son yıllardaki kazılarla "ayağa kaldırılan kent" olarak bilinir.'
        : 'Founded in the Lycos Valley, Laodicea hosts one of the 7 churches mentioned in the Bible. It was one of the richest textile, finance, and medical centers of antiquity. Known as the "resurrected city" due to recent excavations.',
    timeline: [
      TimelineData(label: isTr ? 'Helenistik' : 'Hellenistic', targetBlockId: 'l1'),
      TimelineData(label: isTr ? 'Roma' : 'Roman', targetBlockId: 'l2'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'Hristiyanlık' : 'Christianity', targetBlockId: 'l3'),
      TimelineData(label: isTr ? 'Deprem' : 'Earthquake'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'l1',
            imagePath: 'assets/images/laodicea1.jpg',
            title: isTr ? 'I. Suriye Caddesi' : 'I. Syria Street',
            text: isTr
                ? 'Kentin ana aksını oluşturan sütunlu cadde, doğu-batı yönünde uzanır. Caddenin altındaki merkezi kanalizasyon sistemi ve cam küplerle yapılan zemin döşemeleri, kentin altyapı lüksünü gösterir.'
                : 'The colonnaded street forming the city\'s main axis runs east-west. The central sewage system under the street and glass cube flooring show the city\'s infrastructural luxury.',
          ),
          ContentBlockModel(
            id: 'l2',
            imagePath: 'assets/images/laodicea2.jpg',
            title: isTr ? 'II. Laodikya Kilisesi' : 'II. Church of Laodicea',
            text: isTr
                ? 'MS 4. yüzyıla tarihlenen bu yapı, Hristiyanlık serbest bırakıldıktan sonra yapılan en eski ve en büyük kiliselerden biridir. İncil\'de (Vahiy Kitabı) Laodikya halkının "ne sıcak ne soğuk, ılık" olduğu söylenerek eleştirildiği kilise burasıdır.'
                : 'Dating to the 4th century AD, this is one of the oldest and largest churches built after Christianity was legalized. This is the church where Laodiceans were criticized in the Bible (Revelation) as being "neither hot nor cold, but lukewarm".',
          ),
          ContentBlockModel(
            id: 'l3',
            imagePath: 'assets/images/laodicea3.jpg',
            title: isTr ? 'III. Tapınak A' : 'III. Temple A',
            text: isTr
                ? 'Kentin kutsal alanındaki bu tapınak, cam zemin üzerine inşa edilerek altındaki tonozlu yapıların görülmesi sağlanmıştır. Restorasyon çalışmalarıyla sütunları tamamen ayağa kaldırılmıştır.'
                : 'Located in the city\'s sacred area, this temple was built on a glass floor to allow viewing of the vaulted structures underneath. Its columns were fully re-erected through restoration work.',
          ),
        ],
      ),
      SiteSection(
        title: isTr ? 'Stratigrafik Analiz' : 'Stratigraphic Analysis',
        content: [
          AnalysisSectionModel(
            title: isTr
                ? 'Deprem Katmanları ve Izgara Plan'
                : 'Earthquake Layers and Grid Plan',
            mainImage: 'assets/images/laodicea_s.jpg',
            abstractText: isTr
                ? 'Laodikya kesiti, Lykos Vadisi\'ne hakim bir plato üzerine kurulan ızgara planlı kentin, tarih boyunca yaşadığı yıkıcı depremlerle nasıl şekillendiğini gösterir. Stratigrafi, "Yıkım - Dolgu - Yeniden İnşa" döngüsünü belgeler.'
                : 'The Laodicea section shows how the grid-planned city on a plateau overlooking the Lycos Valley was shaped by destructive earthquakes throughout history. Stratigraphy documents the "Destruction - Fill - Rebuild" cycle.',
            paragraphs: [
              AnalysisParagraph(
                title: isTr ? '1. Coğrafi Taban' : '1. Geographical Base',
                content: [
                  {
                    'bold': isTr ? 'Konglomera Plato (Gri):' : 'Conglomerate Plateau (Grey):',
                    'text': isTr
                        ? ' Kent, vadi tabanından yüksekte, sağlam bir zemin üzerine kurulmuştur. Bu konum, kentin su dağıtım sistemini (sifonlar) zorunlu kılmıştır.'
                        : ' The city is built on solid ground elevated from the valley floor. This location necessitated a water distribution system (siphons).'
                  },
                ],
              ),
              AnalysisParagraph(
                title: isTr ? '2. Deprem ve Dolgu' : '2. Earthquake & Fill',
                content: [
                  {
                    'bold': isTr ? 'Yıkım Molozları (Karışık):' : 'Destruction Rubble (Mixed):',
                    'text': isTr
                        ? ' Kesitte, yapıların temelleri arasında görülen karışık dolgu, MS 494 ve 602 yıllarındaki büyük depremlerin enkazıdır. Laodikyalılar her depremden sonra enkazı düzleyip üzerine yeni yapılar inşa etmişlerdir.'
                        : ' The mixed fill seen between building foundations in the section is rubble from major earthquakes in 494 and 602 AD. Laodiceans leveled the rubble after each quake and built new structures on top.'
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