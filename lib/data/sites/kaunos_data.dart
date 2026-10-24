import '../../core/models.dart';

SiteData getKaunosData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'kaunos',
    title: isTr ? 'Kaunos (Dalyan)' : 'Kaunos',
    introText: isTr
        ? 'Karya ve Likya sınırında, Dalyan Deltası\'nın kıyısında kurulan Kaunos, bir zamanlar önemli bir liman kentiydi. Yüksek kayalıklara oyulmuş tapınak cepheli kral mezarları ile ünlüdür. Heredot\'a göre halkı yerlidir ancak Likyalılar gibi yaşarlar.'
        : 'Founded on the shores of the Dalyan Delta at the border of Caria and Lycia, Kaunos was once an important port city. Famous for its temple-faced king tombs carved into high cliffs. According to Herodotus, its people were indigenous but lived like Lycians.',
    timeline: [
      TimelineData(label: isTr ? 'Karya' : 'Carian', targetBlockId: 'k1'),
      TimelineData(label: isTr ? 'Helenistik' : 'Hellenistic', targetBlockId: 'k2'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'Roma' : 'Roman', targetBlockId: 'k3'),
      TimelineData(label: isTr ? 'Limanın Dolması' : 'Siltation'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'k1',
            imagePath: 'assets/images/kaunos1.jpg',
            title: isTr ? 'I. Kral Kaya Mezarları' : 'I. Rock-Cut King Tombs',
            text: isTr
                ? 'MÖ 4. yüzyıla tarihlenen bu mezarlar, İyon tapınağı cephesi formunda kayalara oyulmuştur. Sarp yamaçtaki bu anıtlar, Kaunos aristokrasisinin gücünü ve ölümden sonraki hayata verdikleri önemi gösterir.'
                : 'Dating to the 4th century BC, these tombs were carved into rocks in the form of Ionic temple facades. These monuments on the steep slope show the power of Kaunos aristocracy and their emphasis on the afterlife.',
          ),
          ContentBlockModel(
            id: 'k2',
            imagePath: 'assets/images/kaunos2.jpg',
            title: isTr ? 'II. Antik Tiyatro' : 'II. Ancient Theater',
            text: isTr
                ? 'Akropolün yamacına inşa edilen 5000 kişilik tiyatro, hem kente hem de Dalyan deltasına hakim bir manzaraya sahiptir. Tiyatronun oturma sıraları (cavea) ve sahne binasının kalıntıları iyi durumdadır.'
                : 'Built on the slope of the acropolis, the 5,000-capacity theater commands a view of both the city and the Dalyan delta. The seating rows (cavea) and ruins of the stage building are in good condition.',
          ),
          ContentBlockModel(
            id: 'k3',
            imagePath: 'assets/images/kaunos3.jpg',
            title: isTr ? 'III. Ölçüm Platformu' : 'III. Measuring Platform',
            text: isTr
                ? 'Kaunos\'ta bulunan dairesel basamaklı yapı, rüzgar yönünü ve kent planlamasını hesaplamak için kullanılan nadir bir ölçüm platformudur. Antik mühendisliğin ve şehirciliğin bilimsel yönünü kanıtlar.'
                : 'The circular stepped structure found in Kaunos is a rare measuring platform used to calculate wind direction and city planning. It proves the scientific aspect of ancient engineering and urbanism.',
          ),
        ],
      ),
      SiteSection(
        title: isTr ? 'Stratigrafik Analiz' : 'Stratigraphic Analysis',
        content: [
          AnalysisSectionModel(
            title: isTr
                ? 'Delta Oluşumu ve Liman Kesiti'
                : 'Delta Formation and Harbor Section',
            mainImage: 'assets/images/kaunos_s.jpg',
            abstractText: isTr
                ? 'Kaunos kesiti, jeomorfolojik değişimin kenti nasıl etkilediğini gösterir. Bir zamanlar deniz kenarında olan liman (Sülüklü Göl), Dalaman Çayı\'nın taşıdığı alüvyonlarla denizden kilometrelerce uzaklaşmıştır. Stratigrafi, kaya mezarlarının yüksek kotu ile limanın bataklığa dönüşümünü analiz eder.'
                : 'The Kaunos section shows how geomorphological change affected the city. Once by the sea, the harbor (Sülüklü Lake) is now kilometers away due to silt from the Dalaman River. Stratigraphy analyzes the high elevation of rock tombs versus the harbor transforming into a swamp.',
            paragraphs: [
              AnalysisParagraph(
                title: isTr ? '1. Jeolojik Yükselti ve Mezarlar' : '1. Geological Elevation & Tombs',
                content: [
                  {
                    'bold': isTr ? 'Kireçtaşı Yamaç (Gri):' : 'Limestone Slope (Grey):',
                    'text': isTr
                        ? ' Kentin yaslandığı sarp dağ bloğu. Kaya mezarları (sol üst), ulaşılması zor bu dikey yüzeye oyulmuştur. Bu konum, mezarları hem korumuş hem de şehirden bakıldığında görkemli kılmıştır.'
                        : ' The steep mountain block the city leans against. Rock tombs (top left) were carved into this inaccessible vertical surface. This location protected the tombs and made them majestic when viewed from the city.'
                  },
                ],
              ),
              AnalysisParagraph(
                title: isTr ? '2. Alüvyal Dolgu ve Liman' : '2. Alluvial Fill & Harbor',
                content: [
                  {
                    'bold': isTr ? 'Eski Liman / Sülüklü Göl (Mavi/Yeşil):' : 'Old Harbor / Sülüklü Lake (Blue/Green):',
                    'text': isTr
                        ? ' Kesitin alt kısmındaki su birikintisi, antik limanın kalıntısıdır. Deniz seviyesinin değişimi ve alüvyon birikimi (sarı katman), burayı zamanla bir göle ve bataklığa dönüştürmüş, kentin ticari fonksiyonunu bitirmiştir.'
                        : ' The water body at the bottom of the section is the remnant of the ancient harbor. Sea level change and alluvial accumulation (yellow layer) turned this into a lake and swamp over time, ending the city\'s commercial function.'
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