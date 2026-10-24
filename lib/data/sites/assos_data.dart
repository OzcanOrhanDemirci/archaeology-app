import '../../core/models.dart';

SiteData getAssosData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'assos',
    title: isTr ? 'Assos (Behramkale)' : 'Assos',
    introText: isTr
        ? 'Edremit Körfezi\'ne hakim Andırın tepesine kurulu Assos, Asya Minör\'ün bilinen tek Arkaik Dor tapınağına ve Aristoteles\'in okuluna ev sahipliği yaptı. Aziz Pavlus\'un ziyaret ettiği kentin surları, tiyatrosu ve tepedeki Athena Tapınağı, Ege manzarasıyla birleşir.'
        : 'Set on the Andırın hill overlooking the Edremit Gulf, Assos hosted the only known Archaic Doric temple of Asia Minor and the school of Aristotle. The city visited by St. Paul combines its walls, theater and hilltop Temple of Athena with a panorama of the Aegean.',
    timeline: [
      TimelineData(label: isTr ? 'MÖ 1000' : '1000 BC', targetBlockId: 'as1'),
      TimelineData(label: isTr ? 'MÖ 540' : '540 BC', targetBlockId: 'as2'),
      TimelineData(label: isTr ? 'MÖ 347' : '347 BC', targetBlockId: 'as3'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'MS 1. Yüzyıl' : '1st c. AD', targetBlockId: 'as4'),
      TimelineData(label: '1881', targetBlockId: 'as5'),
      TimelineData(label: '1981', targetBlockId: 'as5'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'as1',
            title: isTr ? 'I. Eolya Kuruluşu' : 'I. An Aeolian Foundation',
            text: isTr
                ? 'Assos, MÖ 1. binyılın başında Midilli (Lesbos) adasından gelen Eolyalı Yunanlarca kuruldu. Limanı üzerinden zeytinyağı, şarap ve tahıl ticaretiyle zenginleşen kent, Karya ve Lidya güçleri ile Pers egemenliği dönemlerini üzerinden geçirdi.'
                : 'Assos was founded at the beginning of the 1st millennium BC by Aeolian Greeks coming from the island of Lesbos. Enriched through its harbor by the trade of olive oil, wine and grain, the city passed through the periods of Carian and Lydian powers and of Persian rule.',
          ),
          ContentBlockModel(
            id: 'as2',
            title: isTr ? 'II. Athena Tapınağı' : 'II. The Temple of Athena',
            text: isTr
                ? 'MÖ 540 civarında tamamlanan Athena Tapınağı, Asya Minör\'de bilinen tek Arkaik Dor düzeni tapınağıdır ve Dor tapınaklarına ender görülen bir kabartma friziyle donatılmıştır. Parçalar, İstanbul Arkeoloji Müzeleri ile Paris ve Boston müzelerindedir; tapınağın manzarası, Edremit Körfezi\'nden Midilli\'ye uzanır.'
                : 'The Temple of Athena, completed around 540 BC, is the only known Archaic Doric temple of Asia Minor, adorned with a relief frieze rarely seen on Doric buildings. Its fragments are in the Istanbul Archaeological Museums and in museums in Paris and Boston, and the temple\'s view reaches from the Edremit Gulf to Lesbos.',
          ),
          ContentBlockModel(
            id: 'as3',
            title: isTr ? 'III. Aristoteles ve Hermias' : 'III. Aristotle and Hermias',
            text: isTr
                ? 'Platon\'un öğrencisi filozof Hermias, Assos ile yakın Atarneus\'u yönetiyordu; Platon\'un ölümünden sonra (MÖ 347) Aristoteles\'i Assos\'a davet etti. Aristoteles burada bir okul önderliği üstlendi ve Hermias\'ın yakın akrabası Pythia ile evlendi. Hermias, MÖ 341\'de Perslerce ele geçirilerek öldürüldü; Aristoteles onu anan bir yazıt diktirmiştir.'
                : 'The philosopher Hermias, a pupil of Plato, ruled Assos and nearby Atarneus; after Plato\'s death (347 BC) he invited Aristotle to Assos. Aristotle led a school here and married Pythia, a close relative of Hermias. Hermias was captured and put to death by the Persians in 341 BC, and Aristotle raised an inscription in his memory.',
          ),
          ContentBlockModel(
            id: 'as4',
            title: isTr ? 'IV. Aziz Pavlus\'un Ziyareti' : 'IV. St. Paul\'s Visit',
            text: isTr
                ? 'Havarilerin İşleri kitabına göre (20:13-14), Aziz Pavlus üçüncü misyon yolculuğunda Truva\'dan Assos\'a yürümüş ve yol arkadaşlarıyla burada buluşmuştur. Kent, erken Hristiyanlık döneminde bir piskoposluk merkeziydi.'
                : 'According to the Acts of the Apostles (20:13-14), St. Paul walked from Troas to Assos on his third missionary journey and met his companions there. The city was a bishopric in the early Christian period.',
          ),
          ContentBlockModel(
            id: 'as5',
            title: isTr ? 'V. Kazı Tarihi ve Behramkale' : 'V. Excavation History and Behramkale',
            text: isTr
                ? 'Assos\'un ilk kazıları, 1881-1883 arasında Joseph Thacher Clarke yönetimindeki Amerikan ekibi tarafından yapıldı ve Osmanlı topraklarındaki ilk Amerikan kazılarından biri sayılır. Çanakkale Onsekiz Mart Üniversitesi\'nce yürütülen Türk kazıları 1981\'den bu yana sürmektedir; tepenin eteğindeki Behramkale köyü, 14. yüzyıl Osmanlı taş köprüsünü korur.'
                : 'The first excavations at Assos were carried out between 1881 and 1883 by the American team led by Joseph Thacher Clarke, counted among the first American digs in Ottoman lands. Turkish excavations led by Çanakkale Onsekiz Mart University have continued since 1981, and the village of Behramkale below the hill keeps its 14th-century Ottoman stone bridge.',
          ),
        ],
      ),
    ],
  );
}
