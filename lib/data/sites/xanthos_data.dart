import '../../core/models.dart';

SiteData getXanthosData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'xanthos',
    title: isTr ? 'Xanthos (Ksantos)' : 'Xanthos',
    introText: isTr
        ? 'Eşen Çayı kenarındaki tepelere kurulan Xanthos, Likya Birliği\'nin idari ve dini başkentidir. Tarihi boyunca bağımsızlığı uğruna yaptığı toplu intiharlarla tanınan "kahramanlar kenti"dir. UNESCO Dünya Mirası Listesi\'ndedir.'
        : 'Built on hills by the Esen River, Xanthos is the administrative and religious capital of the Lycian League. Known as the "city of heroes" for its mass suicides committed for independence throughout history. It is on the UNESCO World Heritage List.',
    timeline: [
      TimelineData(label: isTr ? 'Arkaik' : 'Archaic', targetBlockId: 'x1'),
      TimelineData(label: isTr ? 'Likya' : 'Lycian', targetBlockId: 'x2'),
      TimelineData(label: isTr ? 'Roma' : 'Roman', targetBlockId: 'x3'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'Bizans' : 'Byzantine'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'x1',
            imagePath: 'assets/images/xanthos1.jpg',
            title: isTr ? 'I. Nereidler Anıtı' : 'I. Nereid Monument',
            text: isTr
                ? 'MÖ 4. yüzyıla ait, İyon tapınağı formundaki bu mezar anıtı, Likya sivil mimarisinin en zarif örneğidir. Sütunların arasındaki su perileri (Nereidler) heykelleriyle ünlüdür. Orijinali British Museum\'dadır.'
                : 'Dating to the 4th century BC, this tomb monument in the form of an Ionic temple is the finest example of Lycian civil architecture. Famous for its statues of water nymphs (Nereids) between columns. The original is in the British Museum.',
          ),
          ContentBlockModel(
            id: 'x2',
            imagePath: 'assets/images/xanthos2.jpg',
            title: isTr ? 'II. Harpy Anıtı ve Dikilitaş' : 'II. Harpy Tomb & Obelisk',
            text: isTr
                ? 'MÖ 480\'e tarihlenen Harpy Anıtı, kule tipi bir Likya mezarıdır. Yanındaki Xanthos Dikilitaşı ise Likçe ve Yunanca yazıtlarıyla Likya dilinin çözülmesinde kilit rol oynamış, tarihin en uzun Likçe metnini barındıran yazıttır.'
                : 'The Harpy Tomb, dating to 480 BC, is a tower-type Lycian tomb. The adjacent Xanthos Obelisk, with its Lycian and Greek inscriptions, played a key role in deciphering the Lycian language and contains the longest known Lycian text.',
          ),
          ContentBlockModel(
            id: 'x3',
            imagePath: 'assets/images/xanthos3.jpg',
            title: isTr ? 'III. Roma Tiyatrosu' : 'III. Roman Theater',
            text: isTr
                ? 'Likya akropolünün kuzey yamacına inşa edilen tiyatro, Roma döneminde yenilenmiştir. Tiyatronun orkestrasının hemen arkasında yer alan Likya kaya mezarları, tiyatro ile mezar mimarisinin iç içe geçtiği nadir bir manzaradır.'
                : 'Built on the northern slope of the Lycian acropolis, the theater was renovated in the Roman period. The Lycian rock tombs situated right behind the orchestra present a rare scene where theater and tomb architecture intertwine.',
          ),
        ],
      ),
      SiteSection(
        title: isTr ? 'Stratigrafik Analiz' : 'Stratigraphic Analysis',
        content: [
          AnalysisSectionModel(
            title: isTr
                ? 'Likya Akropolü ve Mezar Mimarisi Kesiti'
                : 'Section of Lycian Acropolis and Tomb Architecture',
            mainImage: 'assets/images/xanthos_s.jpg',
            abstractText: isTr
                ? 'Xanthos kesiti, kentin en karakteristik özelliği olan "Kaya Mezarı - Kule Mezar - Lahit - Tapınak Mezar" evrimini ve bu yapıların doğal kayalık tepe üzerindeki yerleşimini gösterir. Stratigrafi, Arkaik Likya katmanından Roma dönemine uzanan süreci belgeler.'
                : 'The Xanthos section demonstrates the city\'s most characteristic feature: the evolution of "Rock Tomb - Pillar Tomb - Sarcophagus - Temple Tomb" and their settlement on the natural rocky hill. Stratigraphy documents the process from the Archaic Lycian layer to the Roman period.',
            paragraphs: [
              AnalysisParagraph(
                title: isTr ? '1. Doğal Kaya ve Arkaik Katman' : '1. Natural Rock & Archaic Layer',
                content: [
                  {
                    'bold': isTr ? 'Anakaya (Gri):' : 'Bedrock (Grey):',
                    'text': isTr
                        ? ' Ksantos\'un üzerine kurulduğu sarp kayalık. Likyalılar bu kayayı oyarak hem yaşam alanları hem de kaya mezarları oluşturmuştur. Kesitin sağındaki sur duvarları doğrudan bu anakaya üzerine oturur.'
                        : ' The steep rock on which Xanthos is built. Lycians carved this rock to create both living spaces and rock tombs. The fortification walls on the right of the section sit directly on this bedrock.'
                  },
                  {
                    'bold': isTr ? 'Arkaik Seviye (Koyu Kahve):' : 'Archaic Level (Dark Brown):',
                    'text': isTr
                        ? ' Kentin en eski yerleşim katmanıdır. Harpy Anıtı gibi erken dönem kule mezarların temelleri bu katmanda bulunur.'
                        : ' The oldest settlement layer of the city. Foundations of early period pillar tombs like the Harpy Tomb are found in this layer.'
                  },
                ],
              ),
              AnalysisParagraph(
                title: isTr ? '2. Likya Mezar Anıtları' : '2. Lycian Tomb Monuments',
                content: [
                  {
                    'bold': isTr ? 'Dikilitaş ve Harpy Anıtı (Orta):' : 'Obelisk & Harpy Tomb (Center):',
                    'text': isTr
                        ? ' Kesitin zirvesinde yükselen kule tipi mezarlar. "Pillar Tomb" olarak bilinen bu yapılar, Likya soyluları için yapılmış yekpare taş anıtlardır. Şehrin siluetini belirleyen dikey öğelerdir.'
                        : ' Tower-type tombs rising at the summit of the section. Known as "Pillar Tombs," these are monolithic stone monuments built for Lycian nobles. They are vertical elements defining the city\'s silhouette.'
                  },
                  {
                    'bold': isTr ? 'Nereid Anıtı (Sağ):' : 'Nereid Monument (Right):',
                    'text': isTr
                        ? ' Klasik dönemde inşa edilen tapınak görünümlü anıt mezar. Kesitte görüldüğü gibi, kentin en hakim noktasına, bir podyum üzerine inşa edilmiştir.'
                        : ' A temple-like monumental tomb built in the Classical period. As seen in the section, it was built on a podium at the city\'s most dominant point.'
                  },
                ],
              ),
              AnalysisParagraph(
                title: isTr ? '3. Roma Etkisi' : '3. Roman Impact',
                content: [
                  {
                    'bold': isTr ? 'Tiyatro (Sol):' : 'Theater (Left):',
                    'text': isTr
                        ? ' Yamaçtaki doğal eğime oturtulmuş Roma tiyatrosu. İlginç bir şekilde, tiyatronun inşası sırasında eski Likya mezarları korunmuş ve tiyatro ile bütünleşmiştir.'
                        : ' The Roman theater seated on the natural slope. Interestingly, ancient Lycian tombs were preserved during the theater\'s construction and integrated with it.'
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