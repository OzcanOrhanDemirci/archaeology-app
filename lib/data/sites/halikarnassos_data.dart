import '../../core/models.dart';

SiteData getHalikarnassosData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'halikarnassos',
    title: isTr ? 'Halikarnassos (Bodrum)' : 'Halicarnassus',
    introText: isTr
        ? 'Karya kıyısındaki Halikarnassos, tarihin babası Herodotosun doğduğu, Karya kralı Mausolos için yükselen Mozole\'nin — dünyanın yedi harikasından birinin — kentiydi. Şövalyeler Kalesi ve antik tiyatrosuyla kent, katmanlı bir kıyı yerleşiminin canlı örneğidir.'
        : 'On the Carian coast, Halicarnassus is the city of Herodotus, the father of history, and of the Mausoleum — one of the seven wonders of the ancient world — raised for the Carian king Mausolus. With the Knights\' Castle and its ancient theater, the city remains a living example of a layered coastal settlement.',
    timeline: [
      TimelineData(label: isTr ? 'MÖ 484' : '484 BC', targetBlockId: 'h1'),
      TimelineData(label: isTr ? 'MÖ 350' : '350 BC', targetBlockId: 'h2'),
      TimelineData(label: isTr ? 'MÖ 334' : '334 BC', targetBlockId: 'h3'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: '1402', targetBlockId: 'h5'),
      TimelineData(label: '1857', targetBlockId: 'h2'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'h1',
            title: isTr ? 'I. Herodotosun Kenti' : 'I. The City of Herodotus',
            text: isTr
                ? 'Halikarnassos, Karya yerleşimi üzerine kurulmuş bir Dor-Yunan kentiydi; MÖ 484 civarında doğan Herodotos, tarihin ilk kapsamlı anlatılarını bu kentin limanı ve efsaneleriyle örülü dünyasında yazdı. Kenti yöneten hanedandan çıkan Artemisia I, MÖ 480\'de Salamis deniz savaşında Pers donanması tarafında savaştı.'
                : 'Halicarnassus was a Dorian-Greek city built over a Carian settlement; Herodotus, born around 484 BC, wrote the first comprehensive narratives of history in a world woven from this city\'s harbor and legends. The Carian dynasts connected to its court included Artemisia I, who fought on the Persian side at the naval battle of Salamis in 480 BC.',
          ),
          ContentBlockModel(
            id: 'h2',
            title: isTr ? 'II. Mozole' : 'II. The Mausoleum',
            text: isTr
                ? 'Karya hükümdarı Mausolos için eşi-kardeşi II. Artemisia tarafından MÖ 350 civarında tamamlanan Mozole; Pytheos ve Satyros gibi mimarların, Skopas, Bryaxis, Leochares ve Timotheos gibi heykeltıraşların ortak eseridir. Yaklaşık 45 metre yüksekliğiyle yapı, antik dünyanın yedi harikasından biri sayıldı. Sonraki yüzyıllardaki depremlerle yıkıldı; taşları Şövalyeler Kalesi\'nde yeniden kullanıldı, kabartmaları bugün British Museum\'dadır. Kalıntılar 1857\'de Charles Newton tarafından kazılmıştır.'
                : 'The Mausoleum, completed around 350 BC by Artemisia II for her husband and brother Mausolus, was the joint work of architects such as Pytheos and Satyros and sculptors such as Scopas, Bryaxis, Leochares and Timotheus. At about 45 metres high, it was counted among the seven wonders of the ancient world. Earthquakes toppled it in later centuries; its stones were reused in the Knights\' Castle, its reliefs are in the British Museum today, and the remains were excavated by Charles Newton in 1857.',
          ),
          ContentBlockModel(
            id: 'h3',
            title: isTr ? 'III. Myndos Kapısı' : 'III. The Myndos Gate',
            text: isTr
                ? 'Kentin batı kapısı Myndos Kapısı, MÖ 334\'te Büyük İskender\'in kuşatmasının ana sahnesiydi; Rodoslu Memnon\'un paralı birlikleri kenti savunmuştu. Kuvvetli direnişe rağmen kent düştü ve Karya, İskender\'in yolunda Anadolu\'nun son duraklarından biri oldu.'
                : 'The Myndos Gate, the western gate of the city, was the main scene of Alexander the Great\'s siege in 334 BC, defended by the mercenaries of Memnon of Rhodes. Despite fierce resistance the city fell, and Caria became one of the last stops of Alexander\'s road through Anatolia.',
          ),
          ContentBlockModel(
            id: 'h4',
            title: isTr ? 'IV. Antik Tiyatro' : 'IV. The Ancient Theater',
            text: isTr
                ? 'Kent tepesinin yamacına yaslanan tiyatro, Helenistik kökenli ve Roma döneminde onarılmış bir yapıdır; manzarası Ege\'ye açılır. Günümüzde de yaz konserleri ve etkinliklerle kullanılan tiyatro, Anadolu\'nun en eski sahne yapılarından biridir.'
                : 'Leaning on the slope of the city hill, the theater is a structure of Hellenistic origin repaired in the Roman period, its view opening onto the Aegean. Still used for summer concerts and events, it is among the oldest theater buildings of Anatolia.',
          ),
          ContentBlockModel(
            id: 'h5',
            title: isTr ? 'V. Şövalyeler Kalesi' : 'V. The Knights\' Castle',
            text: isTr
                ? 'Saint Jean Şövalyeleri, 1402\'de Saint Peter Kalesi\'nin inşasına başladı; yapıda çevredeki yeşil volkanik taş ile Mozole kalıntılarından devşirme mermer bloklar kullanıldı. Kale, günümüzde Sualtı Arkeolojisi Müzesi\'ne ev sahipliği yapar ve Bodrum\'un siluetini belirler.'
                : 'The Knights of St. John began the Castle of St. Peter in 1402; the structure combines the green volcanic stone of the region with marble blocks taken from the ruins of the Mausoleum. The castle now hosts the Museum of Underwater Archaeology and defines the silhouette of Bodrum.',
          ),
        ],
      ),
    ],
  );
}
