import '../../core/models.dart';

SiteData getZeugmaData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'zeugma',
    title: isTr ? 'Zeugma (Gaziantep)' : 'Zeugma',
    introText: isTr
        ? 'Fırat\'ın en kolay geçit verdiği noktada kurulan Zeugma, Selevkos İmparatorluğu\'nun sınır kentinden Roma\'nın lejyon garnizonuna dönüştü. Villalarında döşenen polikrom mozaikler, 2000 yılında Birecik Barajı\'nın suları altında kalmadan önce kurtarıldı ve Gaziantep Zeugma Mozaik Müzesi\'nde sergileniyor.'
        : 'Founded at the easiest crossing of the Euphrates, Zeugma turned from a frontier city of the Seleucid empire into a Roman legionary garrison. The polychrome mosaics laid in its villas were rescued just before the site was flooded by the Birecik Dam in 2000, and are displayed in the Zeugma Mosaic Museum in Gaziantep.',
    timeline: [
      TimelineData(label: isTr ? 'MÖ 300' : '300 BC', targetBlockId: 'z1'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'MS 72' : 'AD 72', targetBlockId: 'z2'),
      TimelineData(label: isTr ? 'Mozaikler' : 'Mosaics', targetBlockId: 'z3'),
      TimelineData(label: isTr ? 'MS 253' : 'AD 253', targetBlockId: 'z4'),
      TimelineData(label: '2000', targetBlockId: 'z5'),
      TimelineData(label: '2011', targetBlockId: 'z3'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'z1',
            title: isTr ? 'I. Selevkos Kuruluşu ve Köprü' : 'I. Seleucid Foundation and the Bridge',
            text: isTr
                ? 'Kent, MÖ 300 civarında I. Selevkos Nikator tarafından "Fırat üzerindeki Seleukeia" olarak kuruldu. Yunanca "bağ/köprü" anlamına gelen Zeugma adı, nehir üzerindeki kayık köprüsünden gelir; geçiş noktası, doğu sınırının gümrük ve ticaret istasyonu işlevini gördü.'
                : 'The city was founded around 300 BC by Seleucus I Nicator as "Seleukeia on the Euphrates". Its Greek name Zeugma, meaning "bond/bridge", refers to the pontoon bridge over the river; the crossing served as the customs and trade station of the eastern frontier.',
          ),
          ContentBlockModel(
            id: 'z2',
            title: isTr ? 'II. Roma Lejyonu ve Kentsel Zenginlik' : 'II. The Roman Legion and Urban Wealth',
            text: isTr
                ? 'Roma, MÖ 1. yüzyılda Suriye eyaletini kurunca Zeugma sınır kentine dönüştü; Kommagene krallığının MS 72\'de ilhakından sonra IV. Scythica Lejyonu buraya yerleştirildi. Lejyon subayları ve ticaretten zenginleşen aileler, peristylli villalar, hamamlar ve fresklerle bezeli konutlar inşa etti.'
                : 'When Rome organized the province of Syria in the 1st century BC, Zeugma became a frontier city; after the annexation of the kingdom of Commagene in AD 72, the Fourth Scythian Legion was stationed here. Legion officers and families enriched by trade built peristyle villas, baths and houses decorated with frescoes.',
          ),
          ContentBlockModel(
            id: 'z3',
            title: isTr ? 'III. Mozaikler ve Çingene Kızı' : 'III. The Mosaics and the Gypsy Girl',
            text: isTr
                ? 'MS 2-3. yüzyıllara ait taban mozaikleri, Yunan mitolojisinin Okeanos, Tethys, Poseidon ve Danaë gibi sahnelerini işler. "Çingene Kızı" olarak bilinen Menad başlı mozaik, Gaziantep Zeugma Mozaik Müzesi\'nin simgesidir; müze, dünyanın en büyük mozaik müzeleri arasındadır.'
                : 'The floor mosaics of the 2nd and 3rd centuries AD depict scenes of Greek mythology such as Oceanus, Tethys, Poseidon and Danaë. The mosaic of a maenad known as the "Gypsy Girl" is the emblem of the Zeugma Mosaic Museum in Gaziantep, one of the largest mosaic museums in the world.',
          ),
          ContentBlockModel(
            id: 'z4',
            title: isTr ? 'IV. Sasani Yağması ve Çöküş' : 'IV. Sasanian Sack and Decline',
            text: isTr
                ? 'Kentin MS 252-253 civarındaki geniş çöküş katmanı, I. Şapur önderliğindeki Sasani akınlarına atfedilir. Zeugma bu yıkımdan tam olarak toparlanamadı; Bizans ve Osmanlı dönemlerinde yerleşim, eski kentin üzerinde küçük bir köy ölçeğine indi.'
                : 'The extensive destruction layer of around AD 252-253 is attributed to the Sasanian raids led by Shapur I. Zeugma never fully recovered from this blow; in the Byzantine and Ottoman periods settlement shrank to the scale of a small village over the old city.',
          ),
          ContentBlockModel(
            id: 'z5',
            title: isTr ? 'V. Kurtarma Kazıları' : 'V. The Rescue Excavations',
            text: isTr
                ? 'Birecik Barajı 2000\'de dolduğunda alanın yaklaşık üçte biri sular altında kaldı; uluslararası bir kampanya kapsamında yoğun kurtarma kazıları yapıldı ve binlerce eser — başta mozaikler ve freskler — belgelenip taşındı. Zeugma, kültürel mirasın baraj tehdidine karşı verilen mücadelenin simge alanlarından biridir.'
                : 'When the Birecik Dam filled in 2000, about a third of the site was submerged; an international campaign carried out intensive rescue excavations, and thousands of objects — above all the mosaics and frescoes — were documented and moved. Zeugma has become one of the emblematic cases of heritage threatened by dam waters.',
          ),
        ],
      ),
    ],
  );
}
