import '../../core/models.dart';

SiteData getDidymaData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'didyma',
    title: isTr ? 'Didyma (Aydın)' : 'Didyma',
    introText: isTr
        ? 'Didyma bir kent değil, Milet\'e bağlı kutsal bir alandır (Sanctuary). Antik dünyanın en büyük kehanet merkezlerinden biri olan Apollon Tapınağı buradadır. Devasa sütunları ve tamamlanamamış mimarisiyle büyüleyicidir.'
        : 'Didyma is not a city but a sanctuary connected to Miletus. It houses the Temple of Apollo, one of the largest oracle centers of the ancient world. It is fascinating with its massive columns and unfinished architecture.',
    timeline: [
      TimelineData(label: isTr ? 'Arkaik' : 'Archaic', targetBlockId: 'd1'),
      TimelineData(label: isTr ? 'Pers Yıkımı' : 'Persian Destr.', targetBlockId: 'd2'),
      TimelineData(label: isTr ? 'Helenistik' : 'Hellenistic', targetBlockId: 'd3'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'Roma' : 'Roman', targetBlockId: 'd3'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'd1',
            imagePath: 'assets/images/didyma1.jpg',
            title: isTr ? 'I. Kehanet Merkezi (Oracle)' : 'I. Oracle Center',
            text: isTr
                ? 'Antik çağda krallar ve komutanlar, savaşa gitmeden veya önemli kararlar almadan önce buradaki kahinlere danışırdı. Tapınak, Delphi\'den sonra en önemli ikinci kehanet merkeziydi.'
                : 'In ancient times, kings and commanders consulted the oracles here before going to war or making important decisions. The temple was the second most important oracle center after Delphi.',
          ),
          ContentBlockModel(
            id: 'd2',
            imagePath: 'assets/images/didyma2.jpg',
            title: isTr ? 'II. Devasa Sütunlar' : 'II. Massive Columns',
            text: isTr
                ? 'Tapınak hiçbir zaman tamamlanamamıştır ancak planlanan boyutları 120x50 metredir. 20 metre yüksekliğindeki 122 sütundan sadece 3 tanesi ayaktadır, ancak yıkılan sütun parçaları bile yapının muazzam ölçeğini gösterir.'
                : 'The temple was never finished, but its planned dimensions were 120x50 meters. Only 3 of the 122 columns, 20 meters high, are standing, but even the fallen column fragments show the immense scale of the structure.',
          ),
          ContentBlockModel(
            id: 'd3',
            imagePath: 'assets/images/didyma3.jpg',
            title: isTr ? 'III. Medusa Başı' : 'III. Head of Medusa',
            text: isTr
                ? 'Tapınağın arşitrav frizlerinden düşmüş olan Medusa kabartması, Didyma\'nın sembollerinden biridir. Medusa\'nın bakışlarıyla tapınağı kötü niyetli kişilerden koruduğuna inanılırdı.'
                : 'The relief of Medusa, fallen from the architrave friezes of the temple, is one of the symbols of Didyma. It was believed that Medusa protected the temple from malicious people with her gaze.',
          ),
        ],
      ),
      SiteSection(
        title: isTr ? 'Stratigrafik Analiz' : 'Stratigraphic Analysis',
        content: [
          AnalysisSectionModel(
            title: isTr
                ? 'Dipteros Plan ve Adyton Kesiti'
                : 'Dipteros Plan and Adyton Section',
            mainImage: 'assets/images/didyma_s.jpg',
            abstractText: isTr
                ? 'Didyma kesiti, tapınağın sıradışı "üstü açık" mimarisini gösterir. Klasik tapınakların aksine, çatısı olmayan bir iç avluya (Adyton) sahiptir. Stratigrafi, Arkaik dönem temelleri üzerine inşa edilen Helenistik dev yapıyı analiz eder.'
                : 'The Didyma section shows the temple\'s unusual "open-air" architecture. Unlike classical temples, it has a roofless inner courtyard (Adyton). Stratigraphy analyzes the Hellenistic giant structure built upon Archaic foundations.',
            paragraphs: [
              AnalysisParagraph(
                title: isTr ? '1. Kutsal Kaynak ve Temel' : '1. Sacred Spring & Foundation',
                content: [
                  {
                    'bold': isTr ? 'Kutsal Su Kaynağı (Mavi):' : 'Sacred Water Spring (Blue):',
                    'text': isTr
                        ? ' Tapınağın tam kalbinde, kahinlerin kehanette bulunmadan önce içtikleri veya yıkandıkları kutsal su kaynağı bulunur. Kesitin en derin noktası burasıdır.'
                        : ' At the very heart of the temple lies the sacred spring where oracles drank or bathed before prophesying. This is the deepest point of the section.'
                  },
                ],
              ),
              AnalysisParagraph(
                title: isTr ? '2. Adyton (İç Avlu)' : '2. Adyton (Inner Courtyard)',
                content: [
                  {
                    'bold': isTr ? 'Çukur Avlu Seviyesi:' : 'Sunken Courtyard Level:',
                    'text': isTr
                        ? ' Kesitte görüldüğü gibi, tapınağın dış zemininden merdivenlerle inilen geniş bir iç avlu vardır. Burası, gökyüzüne açık bırakılmıştır ve içinde daha küçük bir tapınak (Naiskos) barındırır.'
                        : ' As seen in the section, there is a wide inner courtyard reached by stairs descending from the temple\'s outer ground. This area was left open to the sky and housed a smaller temple (Naiskos) inside.'
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