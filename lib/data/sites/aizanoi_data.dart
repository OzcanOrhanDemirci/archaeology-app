import '../../core/models.dart';

SiteData getAizanoiData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'aizanoi',
    title: isTr ? 'Aizanoi (Kütahya)' : 'Aizanoi',
    introText: isTr
        ? 'Penkalas (Kocaçay) vadisinde kurulu Aizanoi, tahıl, şarap ve yün ticaretiyle zenginleşen bir Frig kentiydi. 2. yüzyılda inşa edilen Zeus Tapınağı, stadyum-tiyatro kompleksi ve MS 301 tarihli fiyat listesi yazıtıyla kent, Anadolu Roma mirasının en iyi korunmuş örneklerinden birini sunar.'
        : 'Aizanoi, set in the valley of the Penkalas (Kocaçay), was a Phrygian city grown rich on the trade of grain, wine and wool. With its Zeus temple of the 2nd century, its combined stadium-theater and the price edict inscription of AD 301, the city presents one of the best-preserved examples of the Roman heritage of Anatolia.',
    timeline: [
      TimelineData(label: isTr ? 'MÖ 3. Binyıl' : '3rd mill. BC', targetBlockId: 'ai5'),
      TimelineData(label: isTr ? 'MÖ 133' : '133 BC', targetBlockId: 'ai1'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'MS 2. Yüzyıl' : '2nd c. AD', targetBlockId: 'ai1'),
      TimelineData(label: isTr ? 'MS 301' : 'AD 301', targetBlockId: 'ai3'),
      TimelineData(label: '1970', targetBlockId: 'ai5'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'ai1',
            title: isTr ? 'I. Zeus Tapınağı' : 'I. The Temple of Zeus',
            text: isTr
                ? 'MS 2. yüzyılda inşa edilen Zeus Tapınağı, ön cephesinde sekiz sütunu olan pseudodipteral plânıyla Anadolu\'nun en iyi korunmuş Roma tapınaklarından biridir. Kemerli bir podium alt yapısının üzerine oturan tapınağın tonozlu mahzenleri, kutsal alanla kentin günlük ekonomisini birleştirdi.'
                : 'Built in the 2nd century AD, the Temple of Zeus, pseudodipteral in plan with eight columns across its front, is among the best-preserved Roman temples of Anatolia. Standing on a vaulted podium substructure, the temple\'s crypt storerooms joined the sacred precinct with the daily economy of the city.',
          ),
          ContentBlockModel(
            id: 'ai2',
            title: isTr ? 'II. Stadyum-Tiyatro Kompleksi' : 'II. The Stadium-Theater Complex',
            text: isTr
                ? 'Aizanoi\'nin en özgün yapısı, tiyatronun stadyumun üzerine bağlandığı birleşik komplekstir: atletizm yarışmaları stadyumda, sahne gösterileri tiyatroda yapılır, ikisi kemerli tonozlarla birbirine geçer. Bu bütünleşik tasarım, antik dünyada benzeri az görülen bir kent ölçeği gösterisiydi.'
                : 'The most original structure of Aizanoi is its combined complex, where the theater is joined onto the stadium: athletic games were held in the stadium, stage performances in the theater, and the two are threaded together by vaulted substructures. Such an integrated design was a rare display of urban scale in the ancient world.',
          ),
          ContentBlockModel(
            id: 'ai3',
            title: isTr ? 'III. Diocletianus Fiyat Duvarı' : 'III. Diocletian\'s Price Wall',
            text: isTr
                ? 'Macellum (pazar binası) duvarındaki yazıt, İmparator Diocletianus\'un MS 301\'de yayımladığı "Azami Fiyat Fermanı"nın en iyi korunmuş kopyalarından biridir; ferman, enflasyonu durdurmak için binlerce malın üst fiyatını sabitledi. Aizanoi\'deki kopya, fermanın gündelik hayata nasıl indirildiğini gösteren nadir belgelerdendir.'
                : 'The inscription on the wall of the macellum (market building) is one of the best-preserved copies of the Edict on Maximum Prices issued by Emperor Diocletian in AD 301, which fixed ceiling prices for thousands of goods in an effort to stop inflation. The copy at Aizanoi is among the rare documents showing how the edict reached daily life.',
          ),
          ContentBlockModel(
            id: 'ai4',
            title: isTr ? 'IV. Penkalas Köprüsü ve Hamamlar' : 'IV. The Penkalas Bridge and the Baths',
            text: isTr
                ? 'Kent, Penkalas Çayı üzerindeki Roma köprüsüyle iki yakaya yayıldı; köprü, son yıllarda özgün malzemesiyle restore edilmiştir. İki büyük hamam-gymnasium kompleksi ve sütunlu caddeler, Aizanoi\'nin kent kalitesini taşır.'
                : 'The city spread over both banks of the Penkalas through its Roman bridge, restored in recent years with original material. Two large bath-gymnasium complexes and colonnaded streets carried the quality of urban life at Aizanoi.',
          ),
          ContentBlockModel(
            id: 'ai5',
            title: isTr ? 'V. Kazı Tarihi' : 'V. Excavation History',
            text: isTr
                ? 'Aizanoi\'de ilk buluntular 3. binyıl MÖ\'ye uzanır; kent 1970\'ten itibaren Alman Arkeoloji Enstitüsü (DAI) tarafından kazıldı, 2011\'den bu yana kazıları Türk ekipler yürütmektedir. Uzun soluklu araştırma, kentin dini ve ekonomik yapısını ayrıntılarıyla belgelemiştir.'
                : 'The earliest finds at Aizanoi reach back to the 3rd millennium BC; the city was excavated from 1970 onwards by the German Archaeological Institute (DAI), and since 2011 the excavations have been directed by Turkish teams. The long-running research has documented the religious and economic structure of the city in detail.',
          ),
        ],
      ),
    ],
  );
}
