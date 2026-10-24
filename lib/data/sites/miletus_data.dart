import '../../core/models.dart';

SiteData getMiletusData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'miletus',
    title: isTr ? 'Miletus (Milet)' : 'Miletus',
    introText: isTr
        ? 'Bilim ve felsefenin doğduğu kent olarak bilinen Milet, Thales, Anaksimandros ve Anaksimenes gibi filozofların evidir. Izgara şehir planının (Hippodamos Planı) uygulandığı ilk yerlerden biridir. Antik çağda bir liman kentiyken, Büyük Menderes\'in alüvyonlarıyla bugün denizden içeride kalmıştır.'
        : 'Known as the birthplace of science and philosophy, Miletus is the home of philosophers like Thales, Anaximander, and Anaximenes. It is one of the first places where the grid city plan (Hippodamian Plan) was applied. Once a port city, it is now inland due to the silt of the Meander River.',
    timeline: [
      TimelineData(label: isTr ? 'Arkaik' : 'Archaic', targetBlockId: 'm1'),
      TimelineData(label: isTr ? 'Klasik' : 'Classical', targetBlockId: 'm2'),
      TimelineData(label: isTr ? 'Helenistik' : 'Hellenistic', targetBlockId: 'm3'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'Roma' : 'Roman', targetBlockId: 'm2'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'm1',
            imagePath: 'assets/images/miletus1.jpg',
            title: isTr ? 'I. Milet Tiyatrosu' : 'I. Theater of Miletus',
            text: isTr
                ? '15.000 kişilik kapasitesiyle kentin en görkemli yapısıdır. Helenistik dönemde inşa edilmiş, Roma döneminde büyütülmüştür. Tiyatronun ön cephesi, bir zamanlar denizin (Limanın) tam kıyısındaydı.'
                : 'With a capacity of 15,000, it is the city\'s most magnificent structure. Built in the Hellenistic era, enlarged in the Roman era. The theater\'s facade was once right on the shore of the sea (Harbor).',
          ),
          ContentBlockModel(
            id: 'm2',
            imagePath: 'assets/images/miletus2.jpg',
            title: isTr ? 'II. Faustina Hamamları' : 'II. Faustina Baths',
            text: isTr
                ? 'Roma İmparatoru Marcus Aurelius\'un eşi Faustina adına yaptırılmıştır. Anadolu\'daki en büyük Roma hamamlarından biridir. Soğukluk (Frigidarium) ve sıcaklık (Caldarium) bölümleri ile nehir tanrısı Meandros\'un heykeli burada bulunmuştur.'
                : 'Built for Faustina, wife of Roman Emperor Marcus Aurelius. One of the largest Roman baths in Anatolia. Sections like Frigidarium and Caldarium, and the statue of river god Meandros were found here.',
          ),
          ContentBlockModel(
            id: 'm3',
            imagePath: 'assets/images/miletus3.jpg',
            title: isTr ? 'III. Liman Anıtı ve Kutsal Yol' : 'III. Harbor Monument & Sacred Way',
            text: isTr
                ? 'Milet, Didyma\'daki Apollon Tapınağı\'na giden "Kutsal Yol"un başlangıç noktasıdır. Liman Anıtı, kentin deniz ticaretindeki gücünü simgeler. Bugün ova olan alan, antik çağda gemilerin demirlediği "Aslanlı Liman"dı.'
                : 'Miletus is the starting point of the "Sacred Way" leading to the Temple of Apollo in Didyma. The Harbor Monument symbolizes the city\'s power in maritime trade. The area, now a plain, was the "Lion Harbor" where ships anchored in antiquity.',
          ),
        ],
      ),
      SiteSection(
        title: isTr ? 'Stratigrafik Analiz' : 'Stratigraphic Analysis',
        content: [
          AnalysisSectionModel(
            title: isTr
                ? 'Liman ve Tiyatro İlişkili Stratigrafi'
                : 'Stratigraphy Related to Harbor and Theater',
            mainImage: 'assets/images/miletus_s.jpg',
            abstractText: isTr
                ? 'Miletus kesiti, bir liman kentinin nasıl karasal bir kente dönüştüğünü gösteren dramatik bir örnektir. Profil, deniz seviyesinden (Aslanlı Liman) yükselen tiyatro yapısını ve Büyük Menderes\'in (Maeander) getirdiği alüvyonlarla dolan eski deniz tabanını analiz eder.'
                : 'The Miletus section is a dramatic example showing how a port city transformed into an inland city. The profile analyzes the theater structure rising from sea level (Lion Harbor) and the ancient sea floor filled with silt brought by the Maeander River.',
            paragraphs: [
              AnalysisParagraph(
                title: isTr ? '1. Antik Deniz Tabanı ve Liman' : '1. Ancient Sea Floor & Harbor',
                content: [
                  {
                    'bold': isTr ? 'Antik Deniz/Liman Tabanı (Mavi):' : 'Ancient Sea/Harbor Floor (Blue):',
                    'text': isTr
                        ? ' Kesitin en altındaki mavi alan, Milet\'in bir zamanlar Ege Denizi kıyısında olduğunu kanıtlar. "Aslanlı Liman" (Lion Harbor), gemilerin doğrudan şehrin kalbine girdiği bir iç limandı.'
                        : ' The blue area at the bottom of the section proves Miletus was once on the Aegean coast. "Lion Harbor" was an inner harbor where ships entered directly into the heart of the city.'
                  },
                  {
                    'bold': isTr ? 'Liman Kapısı (Orta):' : 'Harbor Gate (Center):',
                    'text': isTr
                        ? ' Deniz ile şehri ayıran anıtsal giriş. Bugün tamamen toprak altında kalmış olsa da, kesitte suyun hemen kıyısındaki konumu nettir.'
                        : ' The monumental entrance separating the sea from the city. Although now completely buried, its position right by the water is clear in the section.'
                  },
                ],
              ),
              AnalysisParagraph(
                title: isTr ? '2. Alüvyal Dolgu ve Değişim' : '2. Alluvial Fill & Change',
                content: [
                  {
                    'bold': isTr ? 'Bronz ve Arkaik Yerleşim Katmanları (Kahverengi):' : 'Bronze & Archaic Settlement Layers (Brown):',
                    'text': isTr
                        ? ' Limanın solundaki (güney) yükselti, kentin en eski yerleşim alanıdır. Tiyatro bu eski höyüğün yamacına yaslanmıştır.'
                        : ' The elevation to the left (south) of the harbor is the oldest settlement area. The theater leans against the slope of this old mound.'
                  },
                ],
              ),
              AnalysisParagraph(
                title: isTr ? '3. Anıtsal Roma Yapıları' : '3. Monumental Roman Structures',
                content: [
                  {
                    'bold': isTr ? 'Tiyatro (Sol):' : 'Theater (Left):',
                    'text': isTr
                        ? ' Limana hakim bir konumda inşa edilmiştir. Seyirciler, oyunları izlerken arkada limana giren gemileri görebiliyorlardı. Bu, kentin denizle olan organik bağını gösterir.'
                        : ' Built in a position overlooking the harbor. Spectators could see ships entering the harbor while watching plays. This shows the city\'s organic link with the sea.'
                  },
                  {
                    'bold': isTr ? 'Faustina Hamamları (Sağ):' : 'Faustina Baths (Right):',
                    'text': isTr
                        ? ' Limanın diğer tarafında, dolgu zemin üzerine inşa edilmiş geniş bir komplekstir. Roma mühendisliği, bataklık zemini ıslah ederek bu büyük yapıyı inşa etmiştir.'
                        : ' A large complex built on fill ground on the other side of the harbor. Roman engineering reclaimed the swampy ground to build this massive structure.'
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