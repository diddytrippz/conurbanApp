import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['en', 'af', 'zu'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String enText = '',
    String afText = '',
    String zuText = '',
  }) =>
      [enText, afText, zuText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // onboarding
  {
    'nj0trxtc': {
      'en': 'Consolidated Urban ',
      'af': 'Gekonsolideerde Stedelike',
      'zu': 'I-Consolidated Urban',
    },
  },
  // loginPage
  {
    'u7vmnj8a': {
      'en': 'Sign In',
      'af': 'Meld aan',
      'zu': 'Ngena ngemvume',
    },
    'x622u3gc': {
      'en': 'Enter Student Your Email',
      'af': 'Voer Student Jou E-pos in',
      'zu': 'Faka I-imeyili Yakho Yomfundi',
    },
    '5ogj9pc4': {
      'en': 'Enter Student Your Email',
      'af': 'Voer Student Jou E-pos in',
      'zu': 'Faka I-imeyili Yakho Yomfundi',
    },
    'xy7pklso': {
      'en': 'Enter Your Password',
      'af': 'Sleutel jou wagwoord in',
      'zu': 'Faka Iphasiwedi Yakho',
    },
    '1ov9dee0': {
      'en': 'Enter Your Password',
      'af': 'Sleutel jou wagwoord in',
      'zu': 'Faka Iphasiwedi Yakho',
    },
    'hvms4lhd': {
      'en': 'Sign In',
      'af': 'Meld aan',
      'zu': 'Ngena ngemvume',
    },
    '8hj2kqou': {
      'en': 'Forgot Password?',
      'af': 'Wagwoord vergeet?',
      'zu': 'Ukhohlwe iphasiwedi?',
    },
    '8jvjimcm': {
      'en': 'Sign Up',
      'af': 'Teken aan',
      'zu': 'Bhalisela',
    },
    '79xzjtu0': {
      'en': 'Enter Student Your Email',
      'af': 'Voer Student Jou E-pos in',
      'zu': 'Faka I-imeyili Yakho Yomfundi',
    },
    'tsswo6fw': {
      'en': 'Enter Student Your Email',
      'af': 'Voer Student Jou E-pos in',
      'zu': 'Faka I-imeyili Yakho Yomfundi',
    },
    'vm9mkveh': {
      'en': 'Create account',
      'af': 'Skep rekening',
      'zu': 'Yenza i-akhawunti',
    },
    '1chpw2lk': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // homePage
  {
    '08etjnuk': {
      'en': '49 Jorissen',
      'af': '49 Jorissen',
      'zu': '49 Jorissen',
    },
    'tpsj7w1z': {
      'en': '80 Jorissen',
      'af': '80 Jorissen',
      'zu': '80 Jorissen',
    },
    '94t8vds9': {
      'en': 'Braamlofts',
      'af': 'Braamlofts',
      'zu': 'Ama-Braamlofts',
    },
    'bq57k0is': {
      'en': 'Dunvista',
      'af': 'Dunvista',
      'zu': 'Dunvista',
    },
    'wruqqg64': {
      'en': '126 Siemert',
      'af': '126 Siemert',
      'zu': '126 Siemert',
    },
    '5doz0qe5': {
      'en': 'Wynton Joy',
      'af': 'Wynton Joy',
      'zu': 'Wynton Joy',
    },
    'm54ifkhe': {
      'en': 'Rennie House',
      'af': 'Rennie Huis',
      'zu': 'Izindlu zikaRennie',
    },
    'uvsvwads': {
      'en': 'YMCA',
      'af': 'YMCA',
      'zu': 'I-YMCA',
    },
    '7cgxecon': {
      'en': '49 Jorissen',
      'af': '49 Jorissen',
      'zu': '49 Jorissen',
    },
    'dqbmn08s': {
      'en': 'Submitted',
      'af': 'Ingedien',
      'zu': 'Kuthunyelwe',
    },
    '6kd5l1dm': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
    'ocojyy0t': {
      'en': 'Complete',
      'af': 'Voltooi',
      'zu': 'Qedela',
    },
    '0q7rrff7': {
      'en': 'Pending',
      'af': 'Hangende',
      'zu': 'Kusalindile',
    },
    'e35hx1xk': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
    '82351dvu': {
      'en': 'Completed',
      'af': 'Voltooi',
      'zu': 'Kuqediwe',
    },
    '5qqng74d': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
  },
  // settingsPage
  {
    '88dygncw': {
      'en': 'Account',
      'af': 'Rekening',
      'zu': 'I-akhawunti',
    },
    'f3i4zw5r': {
      'en': 'Messages',
      'af': 'Boodskappe',
      'zu': 'Imilayezo',
    },
    'xowg732i': {
      'en': 'Appearance',
      'af': 'Voorkoms',
      'zu': 'Ukubukeka',
    },
    'k5zov4wu': {
      'en': 'Languages',
      'af': 'Oor ons',
      'zu': 'Mayelana NATHI',
    },
    'dppxo6qy': {
      'en': 'About us',
      'af': 'Oor ons',
      'zu': 'Mayelana NATHI',
    },
    'jc0n0yu2': {
      'en': 'Logout',
      'af': 'Teken uit',
      'zu': 'Phuma',
    },
    'tgaplj7b': {
      'en': 'Settings',
      'af': 'Instellings',
      'zu': 'Izilungiselelo',
    },
  },
  // moreInfo
  {
    'ar2gbe1q': {
      'en': 'Details',
      'af': 'Besonderhede',
      'zu': 'Imininingwane',
    },
    '63mvhayu': {
      'en': 'Category',
      'af': 'Kategorie',
      'zu': 'Isigaba',
    },
    'mnosb3cz': {
      'en': 'Status',
      'af': 'Status',
      'zu': 'Isimo',
    },
    '6kfw4vzm': {
      'en': 'Assigned',
      'af': 'Toegewys',
      'zu': 'Kwabelwe',
    },
    'he7db7lc': {
      'en': 'View Ratings',
      'af': 'Bekyk graderings',
      'zu': 'Buka Izilinganiso',
    },
    '6h5c0r9t': {
      'en': 'Private Feedback',
      'af': 'Privaat terugvoer',
      'zu': 'Impendulo Eyimfihlo',
    },
    'b77vsr82': {
      'en': 'What was your most important concern with this  ticket?',
      'af': 'Wat was jou belangrikste bekommernis met hierdie kaartjie?',
      'zu': 'Yini ebikukhathaza kakhulu ngaleli thikithi?',
    },
    'rez8w2p2': {
      'en': 'Time',
      'af': 'Tyd',
      'zu': 'Isikhathi',
    },
    '9qcsl926': {
      'en': 'Convinience',
      'af': 'Gerieflikheid',
      'zu': 'Convinience',
    },
    '23lrgihg': {
      'en': 'Cleanliness',
      'af': 'Netheid',
      'zu': 'Inhlanzeko',
    },
    'sr39hfvu': {
      'en': 'Communication',
      'af': 'Kommunikasie',
      'zu': 'Ukuxhumana',
    },
    'j90vq57t': {
      'en': 'Quality',
      'af': 'Kwaliteit',
      'zu': 'Ikhwalithi',
    },
    '5szyjrn4': {
      'en': 'Option ',
      'af': 'Opsie',
      'zu': 'Inketho',
    },
    'qivzxp4x': {
      'en':
          'Your rating is really important for us as it helps us to improve our services for the future.',
      'af':
          'Jou gradering is baie belangrik vir ons aangesien dit ons help om ons dienste vir die toekoms te verbeter.',
      'zu':
          'Isilinganiso sakho sibaluleke ngempela kithi njengoba sisisiza ukuthuthukisa amasevisi ethu esikhathini esizayo.',
    },
    'w331zevs': {
      'en': 'Comments',
      'af': 'Kommentaar',
      'zu': 'Amazwana',
    },
    'm1oke29u': {
      'en': '1',
      'af': '1',
      'zu': '1',
    },
    '3n97vkpm': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // editProfile
  {
    'md5hmb31': {
      'en': 'Change My Picture',
      'af': 'Verander my prentjie',
      'zu': 'Shintsha Isithombe Sami',
    },
    'ewwa3itt': {
      'en': 'Name',
      'af': 'Naam',
      'zu': 'Igama',
    },
    'e9qupoa6': {
      'en': 'Email',
      'af': 'E-pos',
      'zu': 'I-imeyili',
    },
    'nodm1wpq': {
      'en': 'Bio    ',
      'af': 'Bio',
      'zu': 'I-Bio',
    },
    'jz2nh1hw': {
      'en': 'Write about yourself...',
      'af': 'Skryf oor jouself...',
      'zu': 'Bhala ngawe...',
    },
    'vhcbk10y': {
      'en': 'Building',
      'af': 'Gebou',
      'zu': 'Isakhiwo',
    },
    'op1s99pp': {
      'en': 'Room',
      'af': 'Kamer',
      'zu': 'Igumbi',
    },
    '68s6f4gx': {
      'en': 'UID',
      'af': 'UID',
      'zu': 'I-UID',
    },
    'keev4u4m': {
      'en': 'Profile',
      'af': 'Profiel',
      'zu': 'Iphrofayela',
    },
    'a266amof': {
      'en': 'Save',
      'af': 'Stoor',
      'zu': 'Londoloza',
    },
    'ml5wkcpi': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // ChatPage
  {
    'wyvwgjhq': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // MessagesPage
  {
    'jhsqao76': {
      'en': 'Inbox',
      'af': 'Inkassie',
      'zu': 'Ibhokisi lokungenayo',
    },
  },
  // members
  {
    'gl97it2y': {
      'en': 'Search Contacts',
      'af': 'Soek kontakte',
      'zu': 'Sesha Oxhumana Nabo',
    },
    'nbjmgezt': {
      'en': 'Search',
      'af': 'Soek',
      'zu': 'Sesha',
    },
    '5s2fw3ss': {
      'en': 'Search Contacts',
      'af': 'Soek kontakte',
      'zu': 'Sesha Oxhumana Nabo',
    },
    '409fzaxz': {
      'en': 'Search Friends to chat',
      'af': 'Soek vriende om te gesels',
      'zu': 'Sesha Abangane ukuze uxoxe',
    },
    'wbnku1q0': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // emptyList
  {
    '2qmg1npm': {
      'en': 'No results were found from your seaech.\nPlease try again.',
      'af':
          'Geen resultate is van jou soektog gevind nie. Probeer asseblief weer.',
      'zu':
          'Ayikho imiphumela etholakele kusukela ekusesheni kwakho. Ngicela uzame futhi.',
    },
  },
  // darkMode
  {
    '1ly1b0b2': {
      'en': 'Light theme',
      'af': 'Ligte tema',
      'zu': 'Itimu ekhanyayo',
    },
    'upt03p4e': {
      'en': 'Dark theme',
      'af': 'Donker tema',
      'zu': 'Itimu emnyama',
    },
    'xkghbr38': {
      'en': 'From device settings',
      'af': 'Van toestelinstellings',
      'zu': 'Kusuka kuzilungiselelo zedivayisi',
    },
  },
  // Languages
  {
    'vqnqc46x': {
      'en': 'Afrikaans',
      'af': '',
      'zu': '',
    },
    '89inkaoh': {
      'en': 'English',
      'af': '',
      'zu': '',
    },
    'nkxy3bl4': {
      'en': 'Zulu',
      'af': '',
      'zu': '',
    },
  },
  // Miscellaneous
  {
    'lvpj234m': {
      'en':
          'Enable access so you can take photos of your maintenance reports and update your profile picture.',
      'af':
          'Aktiveer toegang sodat jy foto&#39;s van jou instandhoudingsverslae kan neem en jou profielfoto kan opdateer.',
      'zu':
          'Nika amandla ukufinyelela ukuze ukwazi ukuthatha izithombe zemibiko yakho yokulungisa futhi ubuyekeze isithombe sakho sephrofayela.',
    },
    'tpjlcilr': {
      'en':
          'Let Campus Africa access your library so you can upload photos to your maintenance reports and update your profile picture',
      'af':
          'Laat Campus Africa toegang tot jou biblioteek sodat jy foto&#39;s na jou instandhoudingsverslae kan oplaai en jou profielfoto kan opdateer',
      'zu':
          'Vumela i-Campus Africa ifinyelele umtapo wakho wolwazi ukuze ukwazi ukulayisha izithombe emibikweni yakho yokulungisa futhi ubuyekeze isithombe sakho sephrofayela',
    },
    'uo3dfuv5': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '0oulxlkm': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'xjjji9rx': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '961yscwv': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'agtamtgc': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'nkzdpl8c': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'r9k8vtxj': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'bt05trjv': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'tt9qlhvb': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'zd4vyvrw': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'z40c2u6r': {
      'en': 'File Uploaded!',
      'af': 'Lêer opgelaai!',
      'zu': 'Ifayela Lilayishiwe!',
    },
    'gpuitegy': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '7rz9brmh': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'oawj31df': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '30v0jpfw': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '28rhkne9': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '9lma6ka4': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '79esio8m': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '6z8c56bm': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'pjyanqy2': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'h2dm6i3z': {
      'en': '',
      'af': '',
      'zu': '',
    },
  },
].reduce((a, b) => a..addAll(b));
