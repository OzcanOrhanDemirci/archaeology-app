import '../core/models.dart';
import 'sites/ephesus_data.dart';
import 'sites/pergamon_data.dart';
import 'sites/troy_data.dart';
import 'sites/hierapolis_data.dart';
import 'sites/aspendos_data.dart';
import 'sites/perge_data.dart';
import 'sites/aphrodisias_data.dart';
import 'sites/hattusa_data.dart';
import 'sites/nemrut_data.dart';
import 'sites/xanthos_data.dart';
import 'sites/miletus_data.dart';
import 'sites/gobeklitepe_data.dart';
import 'sites/priene_data.dart';
import 'sites/sagalassos_data.dart';
import 'sites/side_data.dart';
import 'sites/didyma_data.dart';
import 'sites/sardis_data.dart';
import 'sites/kaunos_data.dart';
import 'sites/myra_data.dart';
import 'sites/laodicea_data.dart';
import 'sites/termessos_data.dart';
import 'sites/catalhoyuk_data.dart';
import 'sites/gordion_data.dart';
import 'sites/arslantepe_data.dart';
import 'sites/ani_data.dart';
import 'sites/zeugma_data.dart';
import 'sites/halikarnassos_data.dart';
import 'sites/patara_data.dart';
import 'sites/aizanoi_data.dart';
import 'sites/assos_data.dart';


typedef SiteDataFetcher = SiteData Function(String lang);

final Map<String, SiteDataFetcher> siteRegistry = {
  'ephesus': getEphesusData,
  'pergamon': getPergamonData,
  'troy': getTroyData,
  'hierapolis': getHierapolisData,
  'aspendos': getAspendosData,
  'perge': getPergeData,
  'aphrodisias': getAphrodisiasData,
  'hattusa': getHattusaData,
  'nemrut': getNemrutData,
  'xanthos': getXanthosData,
  'miletus': getMiletusData,
  'gobeklitepe': getGobeklitepeData,
  'priene': getPrieneData,
  'sagalassos': getSagalassosData,
  'side': getSideData,
  'didyma': getDidymaData,
  'sardis': getSardisData,
  'kaunos': getKaunosData,
  'myra': getMyraData,
  'laodicea': getLaodiceaData,
  'termessos': getTermessosData,
  'catalhoyuk': getCatalhoyukData,
  'gordion': getGordionData,
  'arslantepe': getArslantepeData,
  'ani': getAniData,
  'zeugma': getZeugmaData,
  'halikarnassos': getHalikarnassosData,
  'patara': getPataraData,
  'aizanoi': getAizanoiData,
  'assos': getAssosData,
};


SiteData getSiteDataById(String id, String lang) {
  final fetcher = siteRegistry[id];
  if (fetcher != null) {
    return fetcher(lang);
  }

  return SiteData(id: 'error', title: 'Error', introText: 'Site not found', timeline: [], sections: []);
}