import '../../core/models.dart';

SiteData getSardisData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'sardis',
    title: isTr ? 'Sardes (Manisa)' : 'Sardis',
    introText: isTr
        ? 'Lidya Krallığı\'nın başkenti olan Sardes, paranın (sikke) icat edildiği yerdir. Paktolos (Sart) Çayı\'ndan çıkarılan altınla zenginleşen kent, Kral Karun\'un (Croesus) vatanıdır. Roma döneminde de önemini korumuş, Batı Anadolu\'nun yedi kilisesinden birine ev sahipliği yapmıştır.'
        : 'Capital of the Lydian Kingdom, Sardis is where money (coins) was invented. Enriched by gold extracted from the Pactolus (Sart) River, it is the homeland of King Croesus. It retained its importance in the Roman period, hosting one of the Seven Churches of Western Anatolia.',
    timeline: [
      TimelineData(label: isTr ? 'Lidya' : 'Lydian', targetBlockId: 'sr1'),
      TimelineData(label: isTr ? 'Pers' : 'Persian', targetBlockId: 'sr2'),
      TimelineData(label: isTr ? 'Helenistik' : 'Hellenistic', targetBlockId: 'sr3'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'Roma/Bizans' : 'Roman/Byz.', targetBlockId: 'sr1'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'sr1',
            imagePath: 'assets/images/sardis1.jpg',
            title: isTr ? 'I. Gymnasium ve Sinagog Kompleksi' : 'I. Gymnasium & Synagogue Complex',
            text: isTr
                ? 'MS 3. yüzyılda inşa edilen bu anıtsal kompleks, hamam ve spor alanlarını içerir. Bitişiğindeki Sinagog, antik dünyada bilinen en büyük ve en görkemli Yahudi ibadethanelerinden biridir.'
                : 'Built in the 3rd century AD, this monumental complex includes baths and sports areas. The adjacent Synagogue is one of the largest and most magnificent Jewish places of worship known in the ancient world.',
          ),
          ContentBlockModel(
            id: 'sr2',
            imagePath: 'assets/images/sardis2.jpg',
            title: isTr ? 'II. Artemis Tapınağı' : 'II. Temple of Artemis',
            text: isTr
                ? 'Akropolün eteğinde yer alan tapınak, İyon düzenindeki en büyük tapınaklardan biridir. İlginç bir şekilde, Hristiyanlık döneminde tapınağın arka kısmına küçük bir kilise (Şapel M) eklenmiştir.'
                : 'Located at the foot of the Acropolis, the temple is one of the largest in the Ionic order. Interestingly, a small church (Chapel M) was added to the back of the temple during the Christian era.',
          ),
          ContentBlockModel(
            id: 'sr3',
            imagePath: 'assets/images/sardis3.jpg',
            title: isTr ? 'III. Altın Rafinerisi' : 'III. Gold Refinery',
            text: isTr
                ? 'Paktolos Çayı kenarında yapılan kazılarda, MÖ 6. yüzyıla ait altın işleme atölyeleri bulunmuştur. Burası, tarihte elektrumdan (altın-gümüş alaşımı) saf altının ayrıştırıldığı ilk endüstriyel alandır.'
                : 'Excavations along the Pactolus River revealed gold processing workshops from the 6th century BC. This is the first industrial site in history where pure gold was separated from electrum (gold-silver alloy).',
          ),
        ],
      ),
      SiteSection(
        title: isTr ? 'Stratigrafik Analiz' : 'Stratigraphic Analysis',
        content: [
          AnalysisSectionModel(
            title: isTr
                ? 'Alüvyal Dolgu ve Kentsel Katmanlaşma'
                : 'Alluvial Fill and Urban Stratification',
            mainImage: 'assets/images/sardis_s.jpg',
            abstractText: isTr
                ? 'Sardes kesiti, Paktolos Çayı ve Hermos Ovası\'nın oluşturduğu alüvyal zemindeki derin katmanlaşmayı gösterir. Lidya dönemi surlarının ve evlerinin, Roma dönemi dolgularının metrelerce altında nasıl korunduğunu analiz eder.'
                : 'The Sardis section shows deep stratification in the alluvial ground formed by the Pactolus River and Hermos Plain. It analyzes how Lydian period walls and houses were preserved meters below Roman period fills.',
            paragraphs: [
              AnalysisParagraph(
                title: isTr ? '1. Lidya Katmanı (MÖ 7.-6. yy)' : '1. Lydian Layer (7th-6th c. BC)',
                content: [
                  {
                    'bold': isTr ? 'Kerpiç Surlar (Kırmızı/Kahve):' : 'Mudbrick Walls (Red/Brown):',
                    'text': isTr
                        ? ' Kesitin alt kısımlarında, Lidya Krallığı\'nın devasa kerpiç savunma duvarları bulunur. Bu katman, Pers kralı Kyros\'un kenti yakıp yıktığı MÖ 546 tarihli yangın tabakasıyla son bulur.'
                        : ' Huge mudbrick defensive walls of the Lydian Kingdom are found in the lower parts of the section. This layer ends with the fire layer dated 546 BC, when Persian King Cyrus burned down the city.'
                  },
                ],
              ),
              AnalysisParagraph(
                title: isTr ? '2. Roma Üstyapısı' : '2. Roman Superstructure',
                content: [
                  {
                    'bold': isTr ? 'Gymnasium ve Sinagog (Sarı/Gri):' : 'Gymnasium & Synagogue (Yellow/Grey):',
                    'text': isTr
                        ? ' Lidya yıkıntılarının üzerine gelen kalın dolgu tabakası üzerine inşa edilmiş mermer yapılardır. Kesitte görülen mozaik tabanlar, bu üst katmana aittir.'
                        : ' Marble structures built on a thick fill layer over Lydian ruins. The mosaic floors seen in the section belong to this upper layer.'
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