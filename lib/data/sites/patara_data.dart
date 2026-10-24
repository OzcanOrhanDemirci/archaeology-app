import '../../core/models.dart';

SiteData getPataraData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'patara',
    title: isTr ? 'Patara (Antalya)' : 'Patara',
    introText: isTr
        ? 'Xanthos vadisinin denize açıldığı noktadaki Patara, Likya Birliği\'nin başkentiydi: Birlik meclisi, kentin restore edilmiş meclis binasında toplanırdı. Apollon\'un kışlık kehanet merkezi olarak anılan kent, Aziz Nikolaos\'un doğum yeri olarak da anılır; kumullar altından çıkarılan limanı ve feneri, Likya kıyısının en etkileyici ören yerlerinden birini oluşturur.'
        : 'Patara, where the Xanthos valley opens to the sea, was the capital of the Lycian League: the League\'s assembly met in the city\'s restored parliament building. Reputed as the winter oracle seat of Apollo and remembered as the birthplace of St. Nicholas, the city — unearthed from beneath the dunes with its harbor and lighthouse — is one of the most striking sites of the Lycian coast.',
    timeline: [
      TimelineData(label: isTr ? 'MÖ 7. Yüzyıl' : '7th c. BC', targetBlockId: 'p1'),
      TimelineData(label: isTr ? 'MÖ 168' : '168 BC', targetBlockId: 'p2'),
      TimelineData(label: '0', isYearZero: true),
      TimelineData(label: isTr ? 'MS 64' : 'AD 64', targetBlockId: 'p3'),
      TimelineData(label: isTr ? 'MS 270' : 'AD 270', targetBlockId: 'p5'),
      TimelineData(label: '1988', targetBlockId: 'p6'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'p1',
            title: isTr ? 'I. Apollon\'un Kışlık Kehanet Merkezi' : 'I. Apollo\'s Winter Oracle',
            text: isTr
                ? 'Antik gelenek, Apollon\'un yazları Delos\'ta ve Delphi\'de kehanet ettiğini, kışları ise Patara\'da oturduğunu aktarır; bu yüzden kentin tapınağı, Likya\'nın dini merkezlerinden biri sayıldı. Kehanet geleneği, Patara\'nın çok eski bir kutsal geçmişe sahip olduğunu gösterir.'
                : 'Ancient tradition relates that Apollo delivered his oracles in summer at Delos and Delphi, but spent the winter at Patara; the temple of the city was therefore counted among the religious centres of Lycia. The oracular tradition points to a very old sacred past for Patara.',
          ),
          ContentBlockModel(
            id: 'p2',
            title: isTr ? 'II. Likya Birliğinin Başkenti' : 'II. Capital of the Lycian League',
            text: isTr
                ? 'MÖ 168\'de Roma\'nın izniyle kurulan Likya Birliği\'nin meclisi Patara\'da toplanırdı; restore edilen meclis binası (bouleuterion), antik çağın en iyi korunmuş parlamenter yapılarından biridir. Montesquieu, 1748\'de yazdığı "Kanunların Ruhu" adlı eserinde Likya federasyonunu federal cumhuriyetlere örnek göstermiştir.'
                : 'The assembly of the Lycian League, founded with Rome\'s consent in 168 BC, met at Patara; the restored parliament building (bouleuterion) is one of the best-preserved parliamentary structures of antiquity. In 1748 Montesquieu, in The Spirit of the Laws, held up the Lycian federation as a model for federal republics.',
          ),
          ContentBlockModel(
            id: 'p3',
            title: isTr ? 'III. Roma Limanı ve Fener' : 'III. The Roman Harbor and Lighthouse',
            text: isTr
                ? 'Xanthos (Eşen) Çayı\'nın taşıdığı alüvyon, Patara\'nın limanını yüzyıllar içinde doldurdu; kent, denizle ilişkisini kademeli olarak yitirdi. İmparator Neron döneminde (MS 1. yüzyıl) vali Sextus Marcius Priscus tarafından yaptırılan fener, dünyada ayakta kalan en eski deniz fenerlerinden biri olarak kabul edilir ve son yıllarda özgün taşlarıyla yeniden yükseltildi.'
                : 'The alluvium carried by the Xanthos (Esen) river filled Patara\'s harbor over the centuries, and the city gradually lost its link with the sea. The lighthouse built under Emperor Nero (1st century AD) by the governor Sextus Marcius Priscus is accepted as one of the oldest surviving lighthouses in the world, and in recent years it was raised again with its original stones.',
          ),
          ContentBlockModel(
            id: 'p4',
            title: isTr ? 'IV. Modestus Takı ve Anbar' : 'IV. The Arch of Modestus and the Granary',
            text: isTr
                ? 'MS 100 civarına tarihlenen Modestus Takı, kentin anıtsal giriş kapısıydı ve su dağıtım sistemine bağlı değildi — bu özelliğiyle Likya\'nın nadir örneklerinden biridir. Limanın yanındaki Hadrianus Anbarı (tahıl deposu), imparatorluk başkentine gıda tedarik eden limanların askeri ekonomisini gösterir.'
                : 'The Arch of Modestus, dated to around AD 100, was the monumental gateway of the city and was not part of the water system — a rare feature in Lycia. Hadrian\'s Granary beside the harbor reflects the military economy of ports that supplied grain to the imperial capital.',
          ),
          ContentBlockModel(
            id: 'p5',
            title: isTr ? 'V. Aziz Nikolaos\'un Doğum Yeri' : 'V. Birthplace of St. Nicholas',
            text: isTr
                ? 'Hristiyan geleneğinde Noel Baba olarak bilinen Aziz Nikolaos, MS 270 civarında Patara\'da doğdu; sonrasında Myra\'nın (Demre) piskoposu oldu. Patara bu nedenle hem Likya hem de Hristiyanlık tarihinin kesiştiği bir kenttir.'
                : 'In Christian tradition St. Nicholas, known as Santa Claus, was born in Patara around AD 270 and later became the bishop of Myra (Demre). Patara thus stands where Lycian and Christian history intersect.',
          ),
          ContentBlockModel(
            id: 'p6',
            title: isTr ? 'VI. Kumullar Altından Kazılar' : 'VI. Excavations from Beneath the Dunes',
            text: isTr
                ? 'Patara, 1988\'den bu yana Akdeniz Üniversitesi öncülüğünde sistemli olarak kazılmaktadır. Tiyatrosu, sütunlu caddeleri, hamamları ve terasları, kumulların altından katman katman çıkarılmış; kumul ekosistemiyle iç içe ören yeri Türkiye\'nin eşsiz doğa-kültür manzaralarından birini sunar.'
                : 'Patara has been excavated systematically since 1988 under the leadership of Akdeniz University. Its theater, colonnaded streets, baths and terraces have been brought out layer by layer from beneath the dunes, and a site interwoven with the dune ecosystem offers one of Turkey\'s singular nature-culture landscapes.',
          ),
        ],
      ),
    ],
  );
}
