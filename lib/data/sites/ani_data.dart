import '../../core/models.dart';

SiteData getAniData(String lang) {
  final isTr = lang == 'tr';

  return SiteData(
    id: 'ani',
    title: isTr ? 'Ani Ören Yeri (Kars)' : 'Ani',
    introText: isTr
        ? 'Arpaçay kanyonunun kenarındaki Ani, 10. yüzyılda Bagratlı Krallığı\'nın başkenti olarak altın çağını yaşadı ve İpek Yolu\'nun Anadolu kapısı oldu. "Bin Bir Kilise Şehri" olarak anılan kent, 1064\'te Selçukluların eline geçti. 2016 yılında UNESCO Dünya Mirası Listesi\'ne alınmıştır.'
        : 'On the edge of the Arpaçay gorge, Ani enjoyed its golden age in the 10th century as the capital of the Bagratid kingdom and the gateway of Anatolia on the Silk Road. Known as the "City of a Thousand and One Churches", it passed to the Seljuks in 1064. It was inscribed on the UNESCO World Heritage List in 2016.',
    timeline: [
      TimelineData(label: isTr ? '5. Yüzyıl' : '5th c.', targetBlockId: 'an5'),
      TimelineData(label: '961', targetBlockId: 'an1'),
      TimelineData(label: isTr ? 'Katedral' : 'Cathedral', targetBlockId: 'an2'),
      TimelineData(label: '1064', targetBlockId: 'an4'),
      TimelineData(label: '1892', targetBlockId: 'an6'),
      TimelineData(label: '2016', targetBlockId: 'an1'),
    ],
    sections: [
      SiteSection(
        title: isTr ? 'Genel Bilgiler' : 'General Info',
        content: [
          ContentBlockModel(
            id: 'an1',
            title: isTr ? 'I. Bin Bir Kilise Şehri' : 'I. City of a Thousand and One Churches',
            text: isTr
                ? 'Kral I. Aşot, 961\'de başkenti Kars\'tan Ani\'ye taşıdı; kent kısa sürede mimari bir atölyeye dönüştü. Kral II. Smbat döneminde (977-989) yapılan surlar, kanyonun kenarında uzanan anıtsal bir savunma hattı oluşturur. Kilise, manastır, köprü ve kervansaray kalıntıları, Orta Çağ kentinin yoğunluğunu gözler önüne serer.'
                : 'King Ashot III moved the capital from Kars to Ani in 961; the city quickly turned into an architectural workshop. The walls built in the reign of King Smbat II (977-989) form a monumental defensive line along the gorge. The remains of churches, monasteries, bridges and caravanserais reveal the density of the medieval city.',
          ),
          ContentBlockModel(
            id: 'an2',
            title: isTr ? 'II. Ani Katedrali' : 'II. The Cathedral of Ani',
            text: isTr
                ? '987-1010 arasında inşa edilen katedral, mimar Trdat tarafından tasarlanmıştır; aynı mimar, 989 depreminden sonra Konstantinopolis Ayasofya\'sının kubbesinin onarımıyla da anılır. Kesik konik kubbesi ve zarif oranlarıyla Ani Katedrali, Orta Çağ Ermeni mimarisinin başyapıtı sayılır; 1064 sonrasında Fethiye Camii\'ne dönüştürülmüştür.'
                : 'Built between 987 and 1010, the cathedral was designed by the architect Trdat, who is also credited with repairing the dome of Hagia Sophia in Constantinople after the earthquake of 989. With its truncated conical dome and elegant proportions, Ani Cathedral is regarded as a masterpiece of medieval Armenian architecture; after 1064 it was converted into the Fethiye Mosque.',
          ),
          ContentBlockModel(
            id: 'an3',
            title: isTr ? 'III. Tigran Honents Kilisesi' : 'III. The Church of St. Gregory of Tigran Honents',
            text: isTr
                ? '1215 tarihli bu kilise, Aziz Grigorios\'un yaşamını anlatan fresk dizisiyle Ani\'nin en zengin iç süslemesine sahiptir. Tigran Honents tarafından yaptırılan yapı, kentin Bagratlılardan sonra da canlı bir inanç merkezi olduğunu gösterir.'
                : 'Dated to 1215, this church holds the richest interior decoration in Ani, with a fresco cycle narrating the life of St. Gregory. Commissioned by Tigran Honents, the building shows that the city remained a living centre of faith long after the Bagratids.',
          ),
          ContentBlockModel(
            id: 'an4',
            title: isTr ? 'IV. Selçuklu Ani\'si' : 'IV. Seljuk Ani',
            text: isTr
                ? '1064\'te Alp Arslan önderliğindeki Selçuklu ordusu kenti fethetti; bu fetih, Anadolu\'ya ilk Selçuklu kapılarının açılışından biridir. 1072 tarihli Ebul Manucehr Camii, Anadolu\'da ayakta kalan en eski camiler arasındadır. Kent, daha sonra Gürcü ve Moğol hakimiyetine girdi; 1319 depremi ile ticaret yollarının değişmesi çöküşünü hızlandırdı.'
                : 'In 1064 the Seljuk army under Alp Arslan conquered the city — one of the first openings of Anatolia to the Seljuks. The Manuchihr Mosque, dated to 1072, stands among the earliest mosques surviving in Anatolia. The city later passed under Georgian and Mongol rule; the earthquake of 1319 and the shifting trade routes accelerated its decline.',
          ),
          ContentBlockModel(
            id: 'an5',
            title: isTr ? 'V. Kanyon ve Strateji' : 'V. The Gorge and Strategy',
            text: isTr
                ? 'Ani, Arpaçay (Akhouryan) kanyonunun dik yamacına yaslanır; batıdan gelen tek erişim, kalın surlarla kapatılmıştır. 5. yüzyıldan itibaren kale olarak bilinen yerleşim, coğrafyası sayesinde yüzyıllar boyunca zor ele geçirilen bir sınır kenti oldu.'
                : 'Ani leans on the sheer cliffs of the Arpaçay (Akhourian) gorge; the only approach from the west was closed by thick walls. Known as a fortress from the 5th century onwards, its geography made it a frontier city that was hard to take for centuries.',
          ),
          ContentBlockModel(
            id: 'an6',
            title: isTr ? 'VI. Kazı Tarihi' : 'VI. Excavation History',
            text: isTr
                ? 'Ani\'de ilk sistematik kazılar, Rus bilgini Nicholas Marr yönetiminde 1892-1917 arasında yapıldı. Yenilenen Türk kazıları 2006\'dan bu yana Kültür ve Turizm Bakanlığı öncülüğünde sürmektedir; kent, Türkiye\'nin en görkemli Orta Çağ ören yerlerinden biridir.'
                : 'The first systematic excavations at Ani were carried out between 1892 and 1917 under the Russian scholar Nicholas Marr. Renewed Turkish excavations have continued since 2006 under the Ministry of Culture and Tourism; the city is one of Turkey\'s grandest medieval sites.',
          ),
        ],
      ),
    ],
  );
}
