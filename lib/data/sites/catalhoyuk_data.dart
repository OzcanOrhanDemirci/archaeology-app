import '../../core/models.dart';

SiteData getCatalhoyukData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'catalhoyuk',
    title: isTr ? 'Çatalhöyük (Konya)' : 'Çatalhöyük',
    introText: isTr
        ? 'Konya Ovası\'nın güneyinde, birbirine bitişik çamur tuğla evlerden oluşan bu Neolitik proto-kent, insanlığın ilk kentleşme deneylerinden biridir. Sokak kavramının olmadığı yerleşimde yaşantı çatılar üzerinden yürütülmüş, ölüler ev tabanlarının altına gömülmüştür. Doğu Höyüğü 2012 yılında UNESCO Dünya Mirası Listesi\'ne alınmıştır.'
        : 'On the southern Konya Plain, this Neolithic proto-city of contiguous mudbrick houses is one of humanity\'s first experiments in urban living. With no streets, life was carried out across the rooftops, and the dead were buried beneath the house floors. The East Mound was inscribed on the UNESCO World Heritage List in 2012.',
    timeline: [
      TimelineData(label: isTr ? 'MÖ 7100' : '7100 BC', targetBlockId: 'ch1'),
      TimelineData(label: isTr ? 'Zirve' : 'Peak', targetBlockId: 'ch2'),
      TimelineData(label: isTr ? 'MÖ 6000' : '6000 BC', targetBlockId: 'ch3'),
      TimelineData(label: '1961', targetBlockId: 'ch4'),
      TimelineData(label: '1993', targetBlockId: 'ch5'),
      TimelineData(label: '2012', targetBlockId: 'ch3'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'ch1',
            title: isTr ? 'I. Çatıdan Girişli Yerleşim' : 'I. A Settlement Entered from the Roof',
            text: isTr
                ? 'Doğu Höyüğü\'ndeki ana yerleşim, günümüz takviminden yaklaşık MÖ 7100\'e kadar uzanan radyokarbon tarihleriyle dünyanın bilinen en eski proto-kentlerinden biridir. Evler birbirine bitişiktir; sokak yoktur. Her evin çatısındaki açıklığa merdivenle çıkılır ve kent yaşantısı, atıkların ve günlük işlerin yürütüldüğü çatı düzeyinde akar.'
                : 'The main occupation on the East Mound, with radiocarbon dates reaching back to about 7100 BC, is among the earliest known proto-cities in the world. The houses were built wall to wall with no streets. Each house was entered by ladder through an opening in its roof, and daily life flowed across the rooftop level where waste and much of the daily work were handled.',
          ),
          ContentBlockModel(
            id: 'ch2',
            title: isTr ? 'II. Ev Tabanlarının Altındaki Ölüler' : 'II. The Dead Beneath the Floors',
            text: isTr
                ? 'Çatalhöyük\'te ölüler, yaşadıkları evin tabanındaki platformların altına gömülürdü; iskeletler sıkışık pozisyonda, bazen bilezik ve boncuk gibi takılarla bulunur. Bu pratik, atalarla süren bir bağın evleri kutsallaştırdığını ve nesiller arası sürekliliği fiziksel hale getirdiğini gösterir.'
                : 'At Çatalhöyük the dead were buried beneath the platforms inside the houses they had lived in; skeletons lie tightly flexed, sometimes adorned with beads and rings. The practice points to a continuing bond with ancestors that sanctified the house and made continuity between generations physical.',
          ),
          ContentBlockModel(
            id: 'ch3',
            title: isTr ? 'III. Duvar Resimleri ve Boğa Boynuzları' : 'III. Wall Paintings and Bull Horns',
            text: isTr
                ? 'Evlerin kireç sıvalı duvarları katman katman yeniden sıvanmış ve bazılarına av sahneleri, akbabaların cesetlere konduğu sahneler ile geometrik desenler işlenmiştir. Ölümden sonraki işlemlere işaret eden akbaba sahneleri, bu yerleşimi Anadolu\'nun en ilginç Neolitik sitelerinden biri yapar. Bazı iç mekânlarda boğa başları (bukranion) ve boynuzlu direkler yer alır.'
                : 'The lime-plastered walls of the houses were replastered layer upon layer, and some carry hunting scenes, images of vultures descending on corpses, and geometric patterns. The vulture scenes, linked to funerary treatment of the body, make the settlement one of the most remarkable Neolithic sites in Anatolia. Bull skulls (bucrania) and horned posts appear inside some rooms.',
          ),
          ContentBlockModel(
            id: 'ch4',
            title: isTr ? 'IV. Mermer Tanrıça Figürü' : 'IV. The Marble Mother Goddess',
            text: isTr
                ? 'James Mellaart\'ın 1961-1965 arasındaki kazılarında ortaya çıkarılan, oturur konumdaki mermer kadın figürü, Anadolu Medeniyetleri Müzesi\'nin en tanınmış eserlerinden biridir. Bereket ve ana tanrıça inancının simgesi kabul edilen figür, Neolitik sanatının inceliğini gösterir. Kazıları sonrasında Ian Hodder yönetimindeki Çatalhöyük Araştırma Projesi 1993\'te başlamıştır.'
                : 'The seated marble female figurine uncovered during James Mellaart\'s excavations between 1961 and 1965 is one of the best-known pieces of the Museum of Anatolian Civilizations. Accepted as a symbol of fertility and the mother goddess, it shows the refinement of Neolithic art. Research resumed in 1993 under Ian Hodder with the Çatalhöyük Research Project.',
          ),
          ContentBlockModel(
            id: 'ch5',
            title: isTr ? 'V. Obsidyen Ticareti' : 'V. The Obsidian Trade',
            text: isTr
                ? 'Yerleşimin ekonomisinde Kapadokya kaynaklarından gelen obsidyen (volkanik cam) merkezi bir yer tutar; aletler, aynalar ve takılar bu ham maddeden üretilmiştir. Obsidyenin yaygın kullanımı, Çatalhöyük\'ün geniş mesafeli ticaret ağlarının bir düğüm noktası olduğunu kanıtlar.'
                : 'Obsidian, the volcanic glass brought from the Cappadocian sources, held a central place in the settlement\'s economy; tools, mirrors and ornaments were produced from it. Its widespread use proves that Çatalhöyük was a node in long-distance exchange networks.',
          ),
        ],
      ),
    ],
  );
}
