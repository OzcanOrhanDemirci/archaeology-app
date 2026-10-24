import '../../core/models.dart';

SiteData getArslantepeData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'arslantepe',
    title: isTr ? 'Arslantepe Höyüğü (Malatya)' : 'Arslantepe Mound',
    introText: isTr
        ? 'Malatya Ovası\'nda, Fırat\'ın kollarına yakın konumdaki 30 metrelik Arslantepe Höyüğü, 4. binyıl MÖ\'ye tarihlenen anıtsal saray kompleksiyle bölgesel devletleşmenin en erken aşamalarını belgeler. Höyük 2021 yılında UNESCO Dünya Mirası Listesi\'ne alınmıştır.'
        : 'The 30-metre mound of Arslantepe, near the tributaries of the Euphrates on the Malatya plain, documents the earliest stages of state formation in the region with its monumental palace complex of the 4th millennium BC. The mound was inscribed on the UNESCO World Heritage List in 2021.',
    timeline: [
      TimelineData(label: isTr ? 'MÖ 3600' : '3600 BC', targetBlockId: 'ar1'),
      TimelineData(label: isTr ? 'MÖ 3000' : '3000 BC', targetBlockId: 'ar2'),
      TimelineData(label: isTr ? 'MÖ 1200' : '1200 BC', targetBlockId: 'ar4'),
      TimelineData(label: isTr ? 'MÖ 712' : '712 BC', targetBlockId: 'ar4'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: '1961', targetBlockId: 'ar5'),
      TimelineData(label: '2021', targetBlockId: 'ar1'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'ar1',
            title: isTr ? 'I. Anıtsal Saray Kompleksi' : 'I. The Monumental Palace Complex',
            text: isTr
                ? 'Geç Kalkolitik döneme (MÖ 4. binyıl) ait saray; koridorlar, avlular, depo ve tapınak mekânlarıyla uzun yıllar boyunca yeniden inşa edilen çamur tuğla bir yönetim merkezidir. Duvar resimleriyle süslü bu yapı kümesi, bölgede merkezi gücün ve bürokrasinin ilk somut göstergelerinden biri kabul edilir.'
                : 'The palace of the Late Chalcolithic period (4th millennium BC) is an administrative centre of mudbrick, repeatedly rebuilt, with corridors, courtyards, storerooms and temples. Decorated with wall paintings, this building complex is accepted as one of the first concrete manifestations of central power and bureaucracy in the region.',
          ),
          ContentBlockModel(
            id: 'ar2',
            title: isTr ? 'II. Bilinen En Eski Kılıçlar' : 'II. Among the Earliest Known Swords',
            text: isTr
                ? 'Saray kompleksinde bulunan, MÖ 3000 civarına tarihlenen arsenikli bakırdan kılıçlar, bugüne kadar ortaya çıkarılmış en eski kılıç örnekleri arasında sayılır. Anadolu Medeniyetleri Müzesi\'nde sergilenen kılıçların pratikten çok törensel işlev taşıdığı düşünülmektedir.'
                : 'The arsenical copper swords found in the palace complex, dated to around 3000 BC, are counted among the earliest known swords ever brought to light. Displayed in the Museum of Anatolian Civilizations, they are thought to have served ceremonial rather than practical purposes.',
          ),
          ContentBlockModel(
            id: 'ar3',
            title: isTr ? 'III. Erken Tunç Çağı Kral Mezarı' : 'III. The Early Bronze Age Royal Tomb',
            text: isTr
                ? 'MÖ 3. binyılın başına tarihlenen, zengin armağanlarla donatılmış kral mezarı, bölgede yeni bir elitin ve siyasi gücün yükselişini belgeler. Mezar buluntuları — silahlar, kaplar ve süs eşyaları — kuzey Mezopotamya ile Fırat havzası arasındaki etkileşimi gösterir.'
                : 'A richly furnished royal tomb dated to the beginning of the 3rd millennium BC documents the rise of a new elite and political power in the region. Its grave goods — weapons, vessels and ornaments — reveal interaction between northern Mesopotamia and the Euphrates basin.',
          ),
          ContentBlockModel(
            id: 'ar4',
            title: isTr ? 'IV. Geç Hitit Melid Kenti' : 'IV. The Neo-Hittite City of Melid',
            text: isTr
                ? 'Hitit İmparatorluğu\'nun çöküşünden sonra Arslantepe, Geç Hitit (Luwi) Melid kentinin merkezi oldu (MÖ yaklaşık 1200-712). Aslan kapı orthostatları ve kabartmalı taş bloklarla donatılmış kent, MÖ 712\'de Asur Kralı II. Sargon tarafından ele geçirildi.'
                : 'After the collapse of the Hittite Empire, Arslantepe became the seat of the Neo-Hittite (Luwian) city of Melid (c. 1200-712 BC). Adorned with lion-gate orthostats and sculpted stone blocks, the city was taken by the Assyrian king Sargon II in 712 BC.',
          ),
          ContentBlockModel(
            id: 'ar5',
            title: isTr ? 'V. İtalyan Kazıları' : 'V. The Italian Excavations',
            text: isTr
                ? 'Arslantepe\'de kazılar, 1961\'den bu yana Roma Sapienza Üniversitesi\'nin misyonu tarafından yürütülmektedir; uzun süreli kampanyalar Alba Palmieri ve Marcella Frangipane gibi araştırmacıların öncülüğünde şekillenmiştir. Höyük, Anadolu\'nun en kesintisiz kazı geçmişine sahip sitelerinden biridir.'
                : 'Excavations at Arslantepe have been conducted since 1961 by the mission of Sapienza University of Rome, with long campaigns shaped by researchers such as Alba Palmieri and Marcella Frangipane. The mound is one of the sites of Anatolia with the longest unbroken record of excavation.',
          ),
        ],
      ),
    ],
  );
}
