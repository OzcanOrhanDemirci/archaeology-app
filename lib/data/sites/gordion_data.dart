import '../../core/models.dart';

SiteData getGordionData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'gordion',
    title: isTr ? 'Gordion (Ankara)' : 'Gordion',
    introText: isTr
        ? 'Sakarya (antik Sangarios) Ovası\'ndaki Yassıhöyük\'te yükselen Gordion, Frig Krallığı\'nın başkentiydi. Kral Midasın kenti, efsanevi Gordyon Düğümü\'ne ve Anadolu\'nun en büyük tümülüsüne ev sahipliği yapar. 2023 yılında UNESCO Dünya Mirası Listesi\'ne alınmıştır.'
        : 'Rising above Yassıhöyük on the plain of the Sakarya (ancient Sangarios) river, Gordion was the capital of the Phrygian kingdom. The city of King Midas is home to the legendary Gordian Knot and the largest burial mound in Anatolia. It was inscribed on the UNESCO World Heritage List in 2023.',
    timeline: [
      TimelineData(label: isTr ? 'MÖ 1200' : '1200 BC', targetBlockId: 'g1'),
      TimelineData(label: isTr ? 'MÖ 800' : '800 BC', targetBlockId: 'g4'),
      TimelineData(label: isTr ? 'MÖ 740' : '740 BC', targetBlockId: 'g2'),
      TimelineData(label: isTr ? 'MÖ 333' : '333 BC', targetBlockId: 'g3'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: '1950', targetBlockId: 'g5'),
      TimelineData(label: '2023', targetBlockId: 'g2'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'g1',
            title: isTr ? 'I. Frig Başkenti' : 'I. The Phrygian Capital',
            text: isTr
                ? 'Bronz Çağı\'nın çöküşü sonrası Anadolu\'ya yerleşen Frigler, MÖ 1. binyılda Gordion\'u başkentleri yaptılar. Asur kaynaklarında "Muşki ülkesinin Mitası" olarak anılan Kral Midas döneminde (MÖ 8. yüzyıl) kent, tarım, tekstil ve ticaretle zenginleşti. Kale höyüğündeki megaron planlı yapılar, Frig mimarisinin karakterini taşır.'
                : 'The Phrygians, who settled in Anatolia after the collapse of the Bronze Age, made Gordion their capital in the 1st millennium BC. In the reign of King Midas — recorded as "Mita of the land of the Mushki" in Assyrian sources — in the 8th century BC the city grew wealthy on agriculture, textiles and trade. The megaron-plan buildings on the citadel mound carry the character of Phrygian architecture.',
          ),
          ContentBlockModel(
            id: 'g2',
            title: isTr ? 'II. Midas Tümülüsü' : 'II. The Midas Mound',
            text: isTr
                ? 'Yaklaşık MÖ 740\'a tarihlenen Midas Tümülüsü (MM Tümülüsü), 53 metre yüksekliğiyle Anadolu\'nun en büyük yapay tepesidir. Çam kütüklerinden oluşturulan mezar odası, ayakta kalmış en eski ahşap yapı olarak kabul edilir. Oda; tunç kaplar, ahşap mobilyalar ve dokumalarla donatılmış bir Frig soylusunun son yolculuğunu korur.'
                : 'The Midas Mound (Tumulus MM), dated to about 740 BC, is the largest artificial mound in Anatolia at 53 metres high. Its burial chamber of pine logs is regarded as the oldest surviving wooden structure in the world. The chamber preserves the last journey of a Phrygian noble furnished with bronze vessels, wooden furniture and textiles.',
          ),
          ContentBlockModel(
            id: 'g3',
            title: isTr ? 'III. Gordyon Düğümü' : 'III. The Gordian Knot',
            text: isTr
                ? 'Efsaneye göre kentin kurucusu Gordios, kaledaki arabasının direğini çözmeyi kimsenin başaramayacağı bir düğümle bağlamıştı; düğümü çözecek kişinin Asya\'nın hükümdarı olacağı öne sürülmüştü. Büyük İskender, MÖ 333\'te Gordion\'a geldiğinde düğümü çözmek yerine kılıcıyla kesti — ve kısa sürede Asya\'nın hâkimi oldu.'
                : 'According to legend, Gordios, the city\'s founder, tied the yoke of his wagon on the citadel with a knot no one could undo, and it was claimed that whoever undid it would rule Asia. When Alexander the Great reached Gordion in 333 BC, instead of untying the knot he cut it with his sword — and shortly afterwards ruled Asia.',
          ),
          ContentBlockModel(
            id: 'g4',
            title: isTr ? 'IV. Kaya Mozaiği ve Depolar' : 'IV. The Pebble Mosaic and Storerooms',
            text: isTr
                ? 'Erken Frig kalesinin MÖ 800 civarında yanan ve yıkılan katmanları, ahşap mimarinin ve gündelik eşyaların şaşırtıcı biçimde korunmasını sağlamıştır. Bu katmanda, bilinen en eski renkli çakıl taşı mozaik döşeme ile devasa kulpları ve tahıl ambarları bulunan depo kompleksi yer alır.'
                : 'The layer of the Early Phrygian citadel that burned and collapsed around 800 BC preserved wooden architecture and everyday objects in remarkable condition. It contains the earliest known pebble mosaic floor and a storage complex with giant pithoi and grain bins.',
          ),
          ContentBlockModel(
            id: 'g5',
            title: isTr ? 'V. Kazı Tarihi' : 'V. Excavation History',
            text: isTr
                ? 'Gordion\'u ilk kez sistematik olarak kazıyan ekip, Pennsylvania Üniversitesi Müzesi\'nden Rodney Young yönetimindeki ekip olmuştur (1950\'den itibaren). Araştırma ve koruma çalışmaları günümüzde de sürmektedir; buluntular Ankara Anadolu Medeniyetleri Müzesi ile yerel Gordion Müzesi\'nde sergilenir.'
                : 'The first systematic excavations at Gordion were carried out by the University of Pennsylvania Museum under Rodney Young, from 1950 onwards. Research and conservation continue today; finds are displayed in the Museum of Anatolian Civilizations in Ankara and the local Gordion Museum.',
          ),
        ],
      ),
    ],
  );
}
