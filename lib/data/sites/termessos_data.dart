import '../../core/models.dart';

SiteData getTermessosData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'termessos',
    title: isTr ? 'Termessos (Antalya)' : 'Termessos',
    introText: isTr
        ? 'Güllük Dağı\'nın (Solymos) 1050 metre yüksekliğindeki zirvesine kurulan Termessos, "Kartal Yuvası" olarak bilinir. Büyük İskender\'in kuşatıp da alamadığı ender kentlerden biridir. Doğal savunması ve vahşi doğasıyla Türkiye\'nin en etkileyici ören yerlerinden biridir.'
        : 'Built on the 1050-meter summit of Mount Güllük (Solymos), Termessos is known as the "Eagle\'s Nest." It is one of the rare cities Alexander the Great besieged but could not conquer. With its natural defenses and wild nature, it is one of Turkey\'s most impressive ruins.',
    timeline: [
      TimelineData(label: isTr ? 'Solymler' : 'Solyms', targetBlockId: 'tr1'),
      TimelineData(label: isTr ? 'Helenistik' : 'Hellenistic', targetBlockId: 'tr2'),
      TimelineData(label: isTr ? 'Roma' : 'Roman', targetBlockId: 'tr3'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'Terk Ediliş' : 'Abandonment'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'tr1',
            imagePath: 'assets/images/termessos1.jpg',
            title: isTr ? 'I. Gymnasium ve Hamam' : 'I. Gymnasium & Bath',
            text: isTr
                ? 'Kentin girişinde yer alan bu devasa kompleks, yerin altına gizlenmiş kemerli salonlarıyla dikkat çeker. Dağın zorlu koşullarında yaşayan savaşçı halkın fiziksel eğitimi burada yapılırdı.'
                : 'Located at the city entrance, this massive complex stands out with arched halls hidden underground. Physical training of the warrior people living in harsh mountain conditions took place here.',
          ),
          ContentBlockModel(
            id: 'tr2',
            imagePath: 'assets/images/termessos2.jpg',
            title: isTr ? 'II. Uçurumdaki Tiyatro' : 'II. Theater on the Cliff',
            text: isTr
                ? 'Helenistik dönemde inşa edilen 4200 kişilik tiyatro, uçurumun kenarına konumlanmıştır. Sahne binasının arkasındaki Pamphylia ovası manzarası nefes kesicidir. Dünyanın en dramatik konumlu tiyatrolarından biridir.'
                : 'Built in the Hellenistic period, the 4,200-person theater is positioned on the edge of a cliff. The view of the Pamphylia plain behind the stage building is breathtaking. It is one of the most dramatically located theaters in the world.',
          ),
          ContentBlockModel(
            id: 'tr3',
            imagePath: 'assets/images/termessos3.jpg',
            title: isTr ? 'III. Bouleuterion ve Sarnıçlar' : 'III. Bouleuterion & Cisterns',
            text: isTr
                ? 'Meclis binası duvarları çatı seviyesine kadar korunmuştur. Dağ başında su kaynağı olmadığı için, kent genelinde kayalara oyulmuş devasa sarnıçlar bulunur. Bu sarnıçlar yağmur suyunu depolamak için hayati öneme sahipti.'
                : 'The council house walls are preserved up to roof level. Since there are no water sources on the mountain, massive cisterns carved into rock are found throughout the city. These cisterns were vital for storing rainwater.',
          ),
        ],
      ),
      SiteSection(
        title: isTr ? 'Stratigrafik Analiz' : 'Stratigraphic Analysis',
        content: [
          AnalysisSectionModel(
            title: isTr
                ? 'Dağ Zirvesi Yerleşimi ve Su Yönetimi'
                : 'Mountain Peak Settlement & Water Management',
            mainImage: 'assets/images/termessos_s.jpg',
            abstractText: isTr
                ? 'Termessos kesiti, sarp kireçtaşı kayalıklar üzerine kurulu bir kentin jeolojik adaptasyonunu gösterir. Profil, uçurum kenarındaki yapıların (Tiyatro) statiğini ve yeraltına oyulan dev sarnıçların stratigrafik konumunu analiz eder.'
                : 'The Termessos section shows the geological adaptation of a city built on steep limestone cliffs. The profile analyzes the statics of cliff-edge structures (Theater) and the stratigraphic position of giant underground cisterns.',
            paragraphs: [
              AnalysisParagraph(
                title: isTr ? '1. Jeolojik Kale' : '1. Geological Fortress',
                content: [
                  {
                    'bold': isTr ? 'Sarp Anakaya (Gri):' : 'Steep Bedrock (Grey):',
                    'text': isTr
                        ? ' Kent, savunma duvarına ihtiyaç duymayacak kadar sarp doğal kayalıklarla çevrilidir. Kesitte görülen tiyatro, bu doğal kayalığın en ucuna, boşluğa bakacak şekilde yerleştirilmiştir.'
                        : ' The city is surrounded by natural rocks so steep that defense walls are unnecessary. The theater seen in the section is placed at the very edge of this natural rock, facing the void.'
                  },
                ],
              ),
              AnalysisParagraph(
                title: isTr ? '2. Yeraltı Mühendisliği' : '2. Underground Engineering',
                content: [
                  {
                    'bold': isTr ? 'Sarnıçlar (Mavi Boşluklar):' : 'Cisterns (Blue Voids):',
                    'text': isTr
                        ? ' Kesitin en çarpıcı detayı, kentin altına bir ağ gibi yayılan su sarnıçlarıdır. Anakayaya oyulan bu hazneler, geçirimsiz sıva ile kaplanarak yağmur suyunu tutmuş ve yaşamın devamını sağlamıştır.'
                        : ' The most striking detail of the section is the water cisterns spreading like a web under the city. Carved into bedrock and coated with impermeable plaster, these reservoirs held rainwater and sustained life.'
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