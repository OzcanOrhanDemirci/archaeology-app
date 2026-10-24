import '../../core/models.dart';

SiteData getAspendosData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'aspendos',
    title: isTr ? 'Aspendos (Antalya)' : 'Aspendos',
    introText: isTr
        ? 'Köprüçay (Eurymedon) kenarında kurulan Aspendos, antik dünyanın en iyi korunmuş tiyatrosuna ev sahipliği yapar. Su mühendisliği harikası olan kemerleri ve görkemli tiyatrosu, Roma mimarisinin dayanıklılığının en büyük kanıtıdır.'
        : 'Established on the banks of the Eurymedon River, Aspendos hosts the best-preserved theater of the ancient world. Its aqueducts, a marvel of water engineering, and its magnificent theater are the greatest proof of Roman architectural durability.',
    timeline: [
      TimelineData(label: isTr ? 'Klasik' : 'Classical', targetBlockId: 'a2'),
      TimelineData(label: isTr ? 'Helenistik' : 'Hellenistic', targetBlockId: 'a2'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'Roma' : 'Roman', targetBlockId: 'a1'),
      TimelineData(label: isTr ? 'Su Yolları' : 'Aqueducts', targetBlockId: 'a3'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'a1',
            imagePath: 'assets/images/aspendos1.jpg',
            title: isTr ? 'I. Dünyanın En İyi Korunmuş Tiyatrosu' : 'I. World\'s Best Preserved Theater',
            text: isTr
                ? 'MS 155 yılında Mimar Zenon tarafından inşa edilen tiyatro, 15.000 kişilik kapasiteye sahiptir. Sahne binası (scaenae frons) çatı seviyesine kadar ayakta kalmıştır. Mükemmel akustiği sayesinde günümüzde bile konserler için kullanılmaktadır.'
                : 'Built by Architect Zenon in 155 AD, the theater has a capacity of 15,000 people. The stage building (scaenae frons) stands intact up to roof level. Thanks to its perfect acoustics, it is used for concerts even today.',
          ),
          ContentBlockModel(
            id: 'a2',
            imagePath: 'assets/images/aspendos2.jpg',
            title: isTr ? 'II. Akropol ve Kamusal Alanlar' : 'II. Acropolis & Public Spaces',
            text: isTr
                ? 'Tiyatronun yaslandığı tepenin üzerinde kentin idari merkezi olan Akropol bulunur. Burada Agora, Bazilika, Nymphaeum (çeşme) ve Bouleuterion (meclis) kalıntıları yer alır ve kentin günlük yaşamına ışık tutar.'
                : 'On the hill against which the theater leans lies the Acropolis, the city\'s administrative center. Remains of the Agora, Basilica, Nymphaeum (fountain), and Bouleuterion (council) are located here, shedding light on daily life.',
          ),
          ContentBlockModel(
            id: 'a3',
            imagePath: 'assets/images/aspendos3.jpg',
            title: isTr ? 'III. Su Mühendisliği Harikası' : 'III. Marvel of Water Engineering',
            text: isTr
                ? 'Kente 15 km uzaktan su getiren kemerler, Roma hidrolik mühendisliğinin başyapıtıdır. Özellikle vadileri aşmak için kullanılan "ters sifon" sistemi, basınçlı su iletiminin antik çağdaki en sofistike örneğidir.'
                : 'The aqueducts bringing water from 15 km away are a masterpiece of Roman hydraulic engineering. Especially the "inverted siphon" system used to cross valleys is the most sophisticated example of pressurized water transmission in antiquity.',
          ),
        ],
      ),
      SiteSection(
        title: isTr ? 'Stratigrafik Analiz' : 'Stratigraphic Analysis',
        content: [
          AnalysisSectionModel(
            title: isTr
                ? 'Akropol ve Aşağı Şehir İlişkisi'
                : 'Relationship Between Acropolis and Lower City',
            mainImage: 'assets/images/aspendos_s.jpg',
            abstractText: isTr
                ? 'Aspendos kesiti, kentin Eurymedon (Köprüçay) nehri seviyesinden Akropol tepesine uzanan dikey gelişimini gösterir. Profil, Roma dönemi yapılarının (Tiyatro ve Bazilika) doğal konglomera kayaç yapısına nasıl entegre edildiğini ve su iletim hatlarının kot farkını nasıl aştığını analiz eder.'
                : 'The Aspendos section shows the vertical development of the city from the Eurymedon River level to the Acropolis hill. The profile analyzes how Roman structures (Theater and Basilica) were integrated into the natural conglomerate rock structure and how water transmission lines overcame elevation differences.',
            paragraphs: [
              AnalysisParagraph(
                title: isTr ? '1. Jeolojik Zemin ve Nehir' : '1. Geological Ground and River',
                content: [
                  {
                    'bold': isTr ? 'Konglomera Anakaya (Gri):' : 'Conglomerate Bedrock (Grey):',
                    'text': isTr
                        ? ' Aspendos, nehir kenarındaki alüvyal düzlükten yükselen doğal bir tepe üzerine kuruludur. Tiyatronun caveası (oturma sıraları), kısmen bu doğal kayaç oyularak, kısmen de tonozlu altyapı (Roma betonu) üzerine inşa edilmiştir.'
                        : ' Aspendos is built on a natural hill rising from the alluvial plain by the river. The theater\'s cavea (seating rows) was constructed partly by carving this natural rock and partly on vaulted infrastructure (Roman concrete).'
                  },
                  {
                    'bold': isTr ? 'Eurymedon Nehri (Mavi):' : 'Eurymedon River (Blue):',
                    'text': isTr
                        ? ' Antik dönemde gemilerin seyrüseferine uygun olan nehir, kentin ticaret limanı işlevini görmesini sağlamış ve alüvyal dolgu ile kıyı şeridini zamanla değiştirmiştir.'
                        : ' Navigable for ships in ancient times, the river allowed the city to function as a trade port and altered the coastline over time with alluvial fill.'
                  },
                ],
              ),
              AnalysisParagraph(
                title: isTr ? '2. Anıtsal Kamu Yapıları' : '2. Monumental Public Structures',
                content: [
                  {
                    'bold': isTr ? 'Tiyatro ve Bazilika:' : 'Theater and Basilica:',
                    'text': isTr
                        ? ' Kesitte sol tarafta görülen Tiyatro, yamaca yaslanırken; sağ taraftaki Bazilika ve Nymphaeum, tepenin düzlenen zirvesine (Akropol) yerleştirilmiştir. Bu, Roma şehir planlamasındaki "yukarı şehir" (yönetim) ve "aşağı şehir" (sosyal) ayrımını yansıtır.'
                        : ' The Theater seen on the left leans against the slope, while the Basilica and Nymphaeum on the right are placed on the flattened summit (Acropolis). This reflects the "upper city" (administration) and "lower city" (social) distinction in Roman urban planning.'
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