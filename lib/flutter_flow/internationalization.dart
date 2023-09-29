import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'kk'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? kkText = '',
  }) =>
      [ruText, kkText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '5l68l5x0': {
      'ru': 'Hi-Test',
      'kk': 'Hi-Test',
    },
    'dyr2cjwk': {
      'ru': 'Мобильное приложение  интернет олимпиад',
      'kk': 'Интернет-олимпиаданың мобильді қосымшасы',
    },
    'scg0l0qv': {
      'ru': 'Дарите подарки своим друзьям и близким, а мы доставим ',
      'kk': 'Достарыңызға және отбасыңызға сыйлық беріңіз, біз жеткіземіз',
    },
    'o8jxhfp5': {
      'ru': 'Сэкономьте свой бюджет на доставке',
      'kk': 'Жеткізу бюджетін үнемдеңіз',
    },
    '10iau77s': {
      'ru': 'Продолжить',
      'kk': 'Жалғастыру',
    },
    'hmlqioft': {
      'ru': 'Войти',
      'kk': 'Кіру үшін',
    },
    'ko80hzgs': {
      'ru': 'Продолжить',
      'kk': 'Жалғастыру',
    },
    'foj7dkhn': {
      'ru': 'Войти',
      'kk': 'Кіру үшін',
    },
    's3s6uxzg': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // registerSchool
  {
    'e1mlpzpg': {
      'ru': 'Регистрация',
      'kk': 'Тіркеу',
    },
    'uz6lj5xt': {
      'ru': 'Мобильное приложение  интернет олимпиад',
      'kk': 'Интернет-олимпиадаға арналған мобильді қосымша',
    },
    '1b657jtp': {
      'ru': 'Почта',
      'kk': 'Пошта',
    },
    '74ce1l7n': {
      'ru': 'Имя',
      'kk': 'Аты',
    },
    '0q1zk1nw': {
      'ru': 'Фамилия',
      'kk': 'Тегі',
    },
    '9qzk9mld': {
      'ru': 'Пароль',
      'kk': 'Құпия сөз',
    },
    'jiuzd8mi': {
      'ru': 'Подтвердите пароль',
      'kk': 'Құпия сөзді растаңыз',
    },
    'aau7etz2': {
      'ru': 'Зарегистрироваться',
      'kk': 'Тіркелу',
    },
    '8e7yrdnk': {
      'ru': 'Я согласен с условиями Оферты ',
      'kk': 'Мен Ұсыныс шарттарымен келісемін',
    },
    'vqq65m1o': {
      'ru': 'Уже имеется аккаунт?',
      'kk': 'Есептік жазбаңыз бар ма?',
    },
    '12sdfdx8': {
      'ru': ' Войти',
      'kk': 'Кіру үшін',
    },
    '0wmztf4k': {
      'ru': 'Регистрация',
      'kk': 'Тіркеу',
    },
    'qpze678w': {
      'ru': 'Имя*',
      'kk': 'аты*',
    },
    'v0liipms': {
      'ru': '',
      'kk': 'Аты',
    },
    'gai24z6d': {
      'ru': 'Имя',
      'kk': '',
    },
    'lr0rc0hf': {
      'ru': 'Фамилия*',
      'kk': 'Тегі*',
    },
    'j7aoh4wz': {
      'ru': '',
      'kk': 'Тегі',
    },
    'dqo3y2o5': {
      'ru': 'Фамилия',
      'kk': '',
    },
    'thdir346': {
      'ru': 'Номер телефона*',
      'kk': 'Телефон нөмірі*',
    },
    'xkt6e6l9': {
      'ru': '',
      'kk': 'Телефон нөмірі',
    },
    'mt8mpsef': {
      'ru': 'Номер телефона',
      'kk': '',
    },
    '8927v91e': {
      'ru': 'Email*',
      'kk': 'Электрондық пошта*',
    },
    '61o4ns13': {
      'ru': '',
      'kk': 'Электрондық пошта',
    },
    '9c08x6ck': {
      'ru': 'Email',
      'kk': '',
    },
    'rwnoxube': {
      'ru': 'Пароль*',
      'kk': 'Құпия сөз*',
    },
    'i2ly5ste': {
      'ru': '',
      'kk': 'Құпия сөз',
    },
    '41ueql1b': {
      'ru': 'Пароль',
      'kk': '',
    },
    '27cryda2': {
      'ru': 'Повторите пароль*',
      'kk': 'Құпия сөзді қайталаңыз',
    },
    '4npxeclf': {
      'ru': '',
      'kk': 'Құпия сөзді қайталаңыз',
    },
    'kw3zo32r': {
      'ru': 'Повторите пароль',
      'kk': '',
    },
    'ord7yh3q': {
      'ru': 'Зарегистрироваться',
      'kk': 'Тіркелу',
    },
    'puo7uoic': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '4e1a1t11': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '9msoo7w5': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'r7z29vsf': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'e7gbl4lh': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '43ga3rjb': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'rp3vqjaf': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'bnskfukd': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '5nk0utqb': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'gvzvkhre': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '9e46m3m9': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'l6kh4s0k': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'u1z6luka': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // Login
  {
    'lytm6m5g': {
      'ru': 'Вход',
      'kk': 'Кіру',
    },
    '6ldj57e8': {
      'ru': 'Мобильное приложение  интернет олимпиад',
      'kk': 'Интернет-олимпиаданың мобильді қосымшасы',
    },
    'zgf2zxvj': {
      'ru': 'Почта',
      'kk': 'Пошта',
    },
    '6hvpo7sd': {
      'ru': 'Пароль',
      'kk': 'Құпия сөз',
    },
    '20hc7g7h': {
      'ru': 'Войти',
      'kk': 'Кіру үшін',
    },
    '0daqgcvj': {
      'ru': 'Я согласен с условиями Оферты ',
      'kk': 'Мен Ұсыныс шарттарымен келісемін',
    },
    'w39ksbb4': {
      'ru': 'Нет аккаунта? ',
      'kk': 'Есептік жазбаңыз жоқ па?',
    },
    '7q751nfh': {
      'ru': 'Зарегистироваться',
      'kk': 'Тіркелу',
    },
    '61zj3ess': {
      'ru': 'Вход',
      'kk': 'Кіру',
    },
    'r6mfw2d3': {
      'ru': 'Email*',
      'kk': 'Электрондық пошта*',
    },
    'tlagn0j1': {
      'ru': '',
      'kk': 'Электрондық пошта',
    },
    '03x14gec': {
      'ru': 'Email',
      'kk': '',
    },
    '1qqf6qis': {
      'ru': 'Пароль*',
      'kk': 'Құпия сөз*',
    },
    'g4dx8va9': {
      'ru': '',
      'kk': 'Құпия сөз',
    },
    'w0klyfon': {
      'ru': 'Пароль',
      'kk': '',
    },
    'pyotnzvj': {
      'ru': 'Вход',
      'kk': 'Кіру',
    },
    'jbcirs1w': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // Main
  {
    '4henccw9': {
      'ru': 'Поиск',
      'kk': '',
    },
    'gu6n8wie': {
      'ru': 'Новости ',
      'kk': '',
    },
    'ovcn42j1': {
      'ru': 'Олимпиада',
      'kk': '',
    },
    'rzb5bc5r': {
      'ru': 'Курсы',
      'kk': '',
    },
    'aqs2sfc1': {
      'ru': 'Репетиторы',
      'kk': '',
    },
    'utg8ng2b': {
      'ru': 'Онлайн Обучение',
      'kk': '',
    },
    'kxjl428a': {
      'ru': 'Обучение за рубежом',
      'kk': '',
    },
    'i8kkrwhz': {
      'ru': 'Работа за рубежом',
      'kk': '',
    },
    '50x2hdfc': {
      'ru': 'Турниры',
      'kk': '',
    },
    't8lkw3y5': {
      'ru': 'Акции',
      'kk': '',
    },
    '67vjft0e': {
      'ru': 'Рейтинг участников',
      'kk': '',
    },
    '4gfbknoe': {
      'ru': 'Служба\nподдержки',
      'kk': '',
    },
    'dmqofi70': {
      'ru': 'Помощь \nпсихолога',
      'kk': '',
    },
    'ut2vf92w': {
      'ru': 'Недавние тесты',
      'kk': '',
    },
    'a1idwmq7': {
      'ru': 'Смотреть все ',
      'kk': '',
    },
    'w9pgp4ry': {
      'ru': 'Последние новости',
      'kk': '',
    },
    'o9sus47s': {
      'ru': 'Смотреть все',
      'kk': '',
    },
    '89smnlyc': {
      'ru': 'Выдаем электронные сертификаты за участие',
      'kk': '',
    },
    'grlfivr2': {
      'ru': 'Не упустите шанс выиграть путевку в жаркую страну',
      'kk': '',
    },
    '9ah9qnkr': {
      'ru': 'Проходи олимпиады и турниры лучше остальных',
      'kk': '',
    },
    '5qidbkrd': {
      'ru': 'Участвовать',
      'kk': '',
    },
    'xwr1no27': {
      'ru': 'Подробнее',
      'kk': '',
    },
    '3swsuurm': {
      'ru': '1 129',
      'kk': '',
    },
    'cf2ma2ac': {
      'ru': 'Участников',
      'kk': '',
    },
    '1xcorohr': {
      'ru': '37',
      'kk': '',
    },
    'gt0vie8a': {
      'ru': 'Олимпиад',
      'kk': '',
    },
    'tddb0zt2': {
      'ru': '11',
      'kk': '',
    },
    'f8j2agsz': {
      'ru': 'Предметов',
      'kk': '',
    },
    'l1ukr2kz': {
      'ru': 'Олимпиады',
      'kk': '',
    },
    'pxyx895u': {
      'ru': 'Вход',
      'kk': '',
    },
    '3o5btxck': {
      'ru': 'Регистрация',
      'kk': '',
    },
    'xwevyhpo': {
      'ru': 'Подробнее',
      'kk': '',
    },
    'erzdeos6': {
      'ru': 'Новости',
      'kk': '',
    },
    '2ok9cifk': {
      'ru': 'Главная',
      'kk': 'үй',
    },
  },
  // ProfileInfo
  {
    'ropwpwpt': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'w9nvuqef': {
      'ru': 'Страница редактирования профиля',
      'kk': 'Профильді өңдеу беті',
    },
    'w487l9bj': {
      'ru': 'Введите номер телефона',
      'kk': 'Телефон нөмірін енгізіңіз',
    },
    '1qg5qws8': {
      'ru': 'Дата рождения',
      'kk': 'туған күні',
    },
    '35a0ryle': {
      'ru': 'ИИН',
      'kk': 'ЖСН',
    },
    'kbcwjokh': {
      'ru': 'Имя',
      'kk': 'Лақап аты',
    },
    'bbm0xyes': {
      'ru': 'Фамилия',
      'kk': 'Лақап аты',
    },
    'bzeddnom': {
      'ru': 'Электронная почта',
      'kk': 'Электрондық пошта',
    },
    'jmgxs0u5': {
      'ru': 'Сохранить',
      'kk': 'Сақтау',
    },
    '610jd0ev': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // EditProfile
  {
    '3k7ykjhb': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'brl8ky9r': {
      'ru': 'Ваш аккаунт',
      'kk': 'Сіздің тіркелгіңіз',
    },
    'k4nla7j8': {
      'ru': 'Общая информация',
      'kk': 'жалпы ақпарат',
    },
    '82sdchmr': {
      'ru': 'Пополнение баланса',
      'kk': 'Балансты толтыру',
    },
    'hpri5wgg': {
      'ru': 'Рейтинги',
      'kk': 'Рейтингтер',
    },
    '2v7mp0ed': {
      'ru': 'Мои олимпиады',
      'kk': 'Менің олимпиадаларым',
    },
    'di2npgnt': {
      'ru': 'Новостная лента',
      'kk': 'Жаңалықтар тізімі',
    },
    'jljni9s8': {
      'ru': 'Реферальная ссылка',
      'kk': 'Анықтамалық сілтеме',
    },
    'to4xiqsv': {
      'ru': 'Мои уроки',
      'kk': 'Менің сабақтарым',
    },
    '5az200bn': {
      'ru': 'Выйти',
      'kk': 'Шығу',
    },
    '6d1uurpl': {
      'ru': 'Удалить аккаунт',
      'kk': 'Есептік жазбаны жою',
    },
    'mpf48n65': {
      'ru': 'Мой аккаунт',
      'kk': '',
    },
    'eht8b71l': {
      'ru': 'Изображение профиля*',
      'kk': '',
    },
    '01syms3h': {
      'ru': 'Выбрать фото',
      'kk': '',
    },
    'k55siex2': {
      'ru': 'Имя*',
      'kk': '',
    },
    '240cfxpx': {
      'ru': 'Имя',
      'kk': '',
    },
    'i0a8ygx0': {
      'ru': 'Фамилия*',
      'kk': '',
    },
    'h4w25q66': {
      'ru': 'Фамилия',
      'kk': '',
    },
    'zh36fo3b': {
      'ru': 'Email*',
      'kk': '',
    },
    '848152jr': {
      'ru': 'Email',
      'kk': '',
    },
    'shg9pv41': {
      'ru': 'ИИН ученика',
      'kk': '',
    },
    '06do643z': {
      'ru': 'ИИН ученика',
      'kk': '',
    },
    'd2tjmq0i': {
      'ru': 'Дата рождения*',
      'kk': '',
    },
    'ycnm5bdw': {
      'ru': 'Дата рождения',
      'kk': '',
    },
    'f2rm01hg': {
      'ru': 'Название учебного заведения*',
      'kk': '',
    },
    'rbtmb9tf': {
      'ru': 'Название учебного заведения',
      'kk': '',
    },
    'axwl4wby': {
      'ru': 'Класс*',
      'kk': '',
    },
    '0m0htlas': {
      'ru': 'Класс',
      'kk': '',
    },
    'bkv48l66': {
      'ru': 'ФИО преподавателя*',
      'kk': '',
    },
    '7xx0274s': {
      'ru': 'ФИО преподавателя',
      'kk': '',
    },
    'yck4h4n2': {
      'ru': 'Номер телефона ученика*',
      'kk': '',
    },
    'ub7635aj': {
      'ru': 'Номер телефона ученика',
      'kk': '',
    },
    'zi4cq6i4': {
      'ru': 'Сохранить',
      'kk': '',
    },
    'idf3kyl1': {
      'ru': 'Field is required',
      'kk': '',
    },
    'i0f96e8d': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    '9vdc8f7g': {
      'ru': 'Field is required',
      'kk': '',
    },
    'tnimf2nl': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    'l273dcra': {
      'ru': 'Field is required',
      'kk': '',
    },
    '4rxri03h': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    'f83e137l': {
      'ru': 'Field is required',
      'kk': '',
    },
    '386u5jph': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    'pt5vr8e4': {
      'ru': 'Field is required',
      'kk': '',
    },
    'p0ijpsvs': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    'yfkshzqz': {
      'ru': 'Field is required',
      'kk': '',
    },
    '3wyqs8xa': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    'f0sovbtr': {
      'ru': 'Field is required',
      'kk': '',
    },
    'qsmrpqp2': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    'anpbbip4': {
      'ru': 'Field is required',
      'kk': '',
    },
    'syvx09gy': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    'libdka8x': {
      'ru': 'Field is required',
      'kk': '',
    },
    'x3rdbwgk': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    '6h21jf3t': {
      'ru': 'Профиль',
      'kk': 'Профиль',
    },
  },
  // ChooseRole
  {
    'l14m3e7d': {
      'ru': 'Для продолжения выберите свою роль',
      'kk': 'Жалғастыру үшін рөліңізді таңдаңыз',
    },
    '1g8gp4lm': {
      'ru': 'Школьник',
      'kk': 'Мектеп оқушысы',
    },
    'nwm39g39': {
      'ru': 'Учитель',
      'kk': 'Мұғалім',
    },
    'miw7ulws': {
      'ru': 'Родитель',
      'kk': 'Ата-ана',
    },
    'ucyekcko': {
      'ru': 'Партнер',
      'kk': 'Серіктес',
    },
    'mp2qibh6': {
      'ru': 'Репетитор',
      'kk': 'Тәрбиеші',
    },
    '4ebbg82x': {
      'ru': 'Выберите свою роль',
      'kk': 'Рөліңізді таңдаңыз',
    },
    'hg55b3nu': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'f51axwff': {
      'ru': 'Войти',
      'kk': 'Кіру үшін',
    },
    '4ead8wn0': {
      'ru': 'Выберите роль для продолжения',
      'kk': 'Жалғастыру үшін рөлді таңдаңыз',
    },
    '5op52d08': {
      'ru': 'Я - ученик',
      'kk': 'Мен оқушымын',
    },
    'eoxbdtk6': {
      'ru': 'Я - учитель',
      'kk': 'Мен мұғаліммін',
    },
    '33mdzcn6': {
      'ru': 'Я - партнер',
      'kk': 'Мен серіктеспін',
    },
    '0e2q112h': {
      'ru': 'Я - репетитор',
      'kk': 'Мен тәрбиешімін',
    },
    'd1bijl5f': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    'pugidawj': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // testLists
  {
    'xyces7bg': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'bv4a5y0a': {
      'ru': 'Пополнение баланса',
      'kk': 'Қор',
    },
    'fe45hyt7': {
      'ru': 'Номер карты',
      'kk': '',
    },
    'amzrgswt': {
      'ru': 'Срок действия карты',
      'kk': '',
    },
    'oa8jrddd': {
      'ru': 'CVV',
      'kk': '',
    },
    '78tmuxo3': {
      'ru': 'Оплатить',
      'kk': '',
    },
    '1v074myq': {
      'ru': 'Пополнение баланса',
      'kk': 'Қор',
    },
    'xz021d2g': {
      'ru': 'Номер карты',
      'kk': '',
    },
    'fwjb614h': {
      'ru': 'Срок действия карты',
      'kk': '',
    },
    '5gs1s30u': {
      'ru': 'CVV',
      'kk': '',
    },
    '0mtrin9i': {
      'ru': 'Оплатить',
      'kk': '',
    },
    'xtuonbtp': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // Tutors
  {
    '3y7i36gm': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    '2aj76sso': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    'k42w205r': {
      'ru': 'Математика',
      'kk': 'Математика',
    },
    'tv95b315': {
      'ru': 'Алгебра',
      'kk': 'Алгебра',
    },
    'zit7y7rv': {
      'ru': 'Геометрия',
      'kk': 'Геометрия',
    },
    'mlrz2vug': {
      'ru': 'Русский',
      'kk': 'орыс',
    },
    'bdwbdo2e': {
      'ru': 'Английский',
      'kk': 'Ағылшын',
    },
    'h8tuktw8': {
      'ru': 'Русская Литература',
      'kk': 'Орыс әдебиеті',
    },
    '5tu7ab5b': {
      'ru': 'География',
      'kk': 'География',
    },
    '35mjlnyc': {
      'ru': 'Биология',
      'kk': 'Биология',
    },
    'pv51rimk': {
      'ru': 'История Казахстана',
      'kk': 'Қазақстан тарихы',
    },
    '79xq2v4d': {
      'ru': 'Всемирна история',
      'kk': 'дүниежүзілік тарих',
    },
    'upfmezb6': {
      'ru': 'Выберите предмет',
      'kk': 'Элементті таңдаңыз',
    },
    'sqctylkv': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'l7bb2s56': {
      'ru': 'Репетиторы',
      'kk': 'Тәрбиешілер',
    },
    'by6oac4r': {
      'ru': 'Выберите предмет:',
      'kk': 'Тақырыпты таңдаңыз:',
    },
    '4tut25yd': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    'xzo88sqi': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'lve3tqmx': {
      'ru': 'Формат обучения:',
      'kk': 'Оқу форматы',
    },
    '024fxf20': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    'o70s6yya': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'emfcbthm': {
      'ru': 'О репетиторе',
      'kk': 'Тәрбиеші туралы',
    },
    'b6wwk0hk': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // quizPage
  {
    'be49o9n8': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'pdyh9ur2': {
      'ru': 'Тесты',
      'kk': 'Тесттер',
    },
    'jhztmvbb': {
      'ru': 'Результаты',
      'kk': 'нәтижелер',
    },
    'a0p9hcjj': {
      'ru': 'Тесты',
      'kk': 'Тесттер',
    },
    'c6jneqx5': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    '4j0fpk10': {
      'ru': 'Математика',
      'kk': 'Математика',
    },
    'rnv3968t': {
      'ru': 'Алгебра',
      'kk': 'Алгебра',
    },
    'uwz7ft1w': {
      'ru': 'Геометрия',
      'kk': 'Геометрия',
    },
    'xsi1r6jd': {
      'ru': 'Русский',
      'kk': 'орыс',
    },
    'w70so8wa': {
      'ru': 'Английский',
      'kk': 'Ағылшын',
    },
    'kraswbwv': {
      'ru': 'Русская Литература',
      'kk': 'Орыс әдебиеті',
    },
    'zj8w7eap': {
      'ru': 'География',
      'kk': 'География',
    },
    'excwet6m': {
      'ru': 'Биология',
      'kk': 'Биология',
    },
    'xf8cqkgy': {
      'ru': 'История Казахстана',
      'kk': 'Қазақстан тарихы',
    },
    'tkgd2dmc': {
      'ru': 'Всемирна история',
      'kk': 'дүниежүзілік тарих',
    },
    '6egggwpe': {
      'ru': 'Здесь пока что ничего нет',
      'kk': 'Бұл жерде әлі ештеңе жоқ',
    },
    'e92bnwtk': {
      'ru': 'Зарегистрироваться',
      'kk': 'Тіркелу',
    },
    'pn7lwowt': {
      'ru': 'Олимпиады',
      'kk': 'Олимпиада',
    },
    'd6af9s5z': {
      'ru': 'Выберите предмет:',
      'kk': 'Тақырыпты таңдаңыз:',
    },
    'boz849c8': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    '0b1q5f76': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'zhi66imf': {
      'ru': 'Ваш класс:',
      'kk': 'Сіздің сыныбыңыз:',
    },
    'n795nnrw': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    'gmlyvg60': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'icghvr78': {
      'ru': 'Вход',
      'kk': 'Кіру',
    },
    'jpyu9oay': {
      'ru': 'Регистрация',
      'kk': 'Тіркеу',
    },
    'evb6q4hv': {
      'ru': 'Подробнее',
      'kk': 'Тіркеу',
    },
    '3j9878yr': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // create_Quiz
  {
    'mfi8akau': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'oitaoh0p': {
      'ru': 'Создать олимпиаду',
      'kk': 'Олимпиада құру',
    },
    'rflz5hzm': {
      'ru': 'Заполните информацию ниже для создание олимпиады для учащихся',
      'kk':
          'Оқушыларға арналған олимпиада құру үшін төмендегі ақпаратты толтырыңыз',
    },
    'yv8we356': {
      'ru': 'Название олимпиады',
      'kk': 'Олимпиаданың атауы',
    },
    'vbaoz3ku': {
      'ru': 'Краткое описание олимпиады и ее содержания',
      'kk': 'Олимпиаданың қысқаша сипаттамасы және оның мазмұны',
    },
    'atpeb0pq': {
      'ru': 'Цена',
      'kk': 'Бағасы',
    },
    'n40r30jv': {
      'ru': 'Дата начала',
      'kk': 'басталатын күн',
    },
    '4jdf60nd': {
      'ru': 'Дата окончания',
      'kk': 'мерзімнің өту күні',
    },
    'ccj9p8tq': {
      'ru': 'Язык',
      'kk': 'мерзімнің өту күні',
    },
    '2egl9aco': {
      'ru': 'Загрузить фотографию',
      'kk': 'Фотосуретті жүктеп салу үшін',
    },
    'hei7rxx5': {
      'ru': '1',
      'kk': '1',
    },
    'wykrovhx': {
      'ru': '2',
      'kk': '2',
    },
    '3jfa9m2a': {
      'ru': '3',
      'kk': '3',
    },
    'fyw8ffod': {
      'ru': '4',
      'kk': '4',
    },
    'o1jr8o0f': {
      'ru': '5',
      'kk': '5',
    },
    '4teuglhr': {
      'ru': '6',
      'kk': '6',
    },
    'b1fjprzi': {
      'ru': '7',
      'kk': '7',
    },
    's7691isp': {
      'ru': '8',
      'kk': '8',
    },
    'yuauuilp': {
      'ru': '9',
      'kk': '9',
    },
    'yqzxoce0': {
      'ru': '10',
      'kk': '10',
    },
    'mbox1hzf': {
      'ru': '11',
      'kk': 'он бір',
    },
    'dbd1tbqo': {
      'ru': 'Для какогого класса',
      'kk': 'Қай сынып үшін',
    },
    '385woub8': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    '0ye5skq4': {
      'ru': 'Выберите предметы',
      'kk': 'Элементтерді таңдаңыз',
    },
    '49c2cncz': {
      'ru': 'Математика',
      'kk': 'Математика',
    },
    'i15rfi1d': {
      'ru': 'Алгебра',
      'kk': 'Алгебра',
    },
    'buarmvqe': {
      'ru': 'Геометрия',
      'kk': 'Геометрия',
    },
    '4a0o88nt': {
      'ru': 'Русский',
      'kk': 'орыс',
    },
    '7s0a5xxk': {
      'ru': 'Английский',
      'kk': 'Ағылшын',
    },
    'ayh33nuw': {
      'ru': 'Русская Литература',
      'kk': 'Орыс әдебиеті',
    },
    'ub8uptz5': {
      'ru': 'География',
      'kk': 'География',
    },
    '4ern65la': {
      'ru': 'Биология',
      'kk': 'Биология',
    },
    '7ihlbmct': {
      'ru': 'История Казахстана',
      'kk': 'Қазақстан тарихы',
    },
    'jph17aw6': {
      'ru': 'Всемирна история',
      'kk': 'дүниежүзілік тарих',
    },
    '39o2qa4l': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'gm43qwkk': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '90u3ycy7': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'thw63x3n': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'je9d7lrk': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '0ahcl4os': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '1qr0lqx6': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'rdzcgsy5': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'm4mtkj9a': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'a0d927g7': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '251gnvks': {
      'ru': 'Field is required',
      'kk': '',
    },
    'bayzcjmv': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    'fogklm8j': {
      'ru': 'Создать',
      'kk': 'Жасау',
    },
    'xy6whr8l': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // editQuestion
  {
    '4jpg2fq7': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'jy71xsfu': {
      'ru': 'Редактировать вопрос',
      'kk': 'Сұрақты өңдеу',
    },
    'qv14sble': {
      'ru': 'Измените информацию ниже для редактирования вопроса',
      'kk': 'Сұрақты өңдеу үшін төмендегі ақпаратты өңдеңіз',
    },
    'ecbc1b2j': {
      'ru': 'Question',
      'kk': 'Сұрақ',
    },
    'u3ukh1nl': {
      'ru': 'Short Description of what is going on...',
      'kk': 'Не болып жатқанының қысқаша сипаттамасы...',
    },
    'onyhhueu': {
      'ru': 'Варианты ответа',
      'kk': 'Жауап опциялары',
    },
    '5hdfqr9w': {
      'ru': 'Название варианта',
      'kk': 'Вариант атауы',
    },
    'ydmyk9dd': {
      'ru': 'Please add an option name...',
      'kk': 'Опция атауын қосыңыз...',
    },
    '4n98f72i': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '5jeayg8v': {
      'ru': 'Выберите из опций снизу правильный ответ',
      'kk': 'Төмендегі нұсқалардан дұрыс жауапты таңдаңыз',
    },
    'vxjquwcz': {
      'ru': 'Правильный ответ',
      'kk': 'Дұрыс жауап',
    },
    '0j1fawz4': {
      'ru': 'Сохранить изменения',
      'kk': 'Өзгерістерді сақтау',
    },
    'fd21rabg': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // createQuestion
  {
    '6x4l901b': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'xd5e1zc0': {
      'ru': 'Создать вопрос',
      'kk': 'Сұрақ құру',
    },
    'd5lblbf2': {
      'ru': 'Заполните информацию ниже для создания вопроса к тесту',
      'kk': 'Тест сұрағын құру үшін төмендегі ақпаратты толтырыңыз',
    },
    'cyvc65xx': {
      'ru': 'Вопрос',
      'kk': 'Сұрақ',
    },
    '86y6s7dz': {
      'ru': 'Краткое описание вопроса',
      'kk': 'Мәселенің қысқаша сипаттамасы',
    },
    'cncr5aka': {
      'ru': 'Варианты ответа',
      'kk': 'Жауап опциялары',
    },
    'xfdag9a5': {
      'ru': 'Название варианта',
      'kk': 'Вариант атауы',
    },
    '93sgk4xb': {
      'ru': 'Please add an option name...',
      'kk': 'Опция атауын қосыңыз...',
    },
    '4qa7yumh': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'n3ltpb0j': {
      'ru': 'Выберите из опций снизу правильный ответ',
      'kk': 'Төмендегі нұсқалардан дұрыс жауапты таңдаңыз',
    },
    'zwayc07p': {
      'ru': 'Правильный ответ',
      'kk': 'Дұрыс жауап',
    },
    'tawvpzny': {
      'ru': 'Сохранить',
      'kk': 'Сақтау',
    },
    '683r4uuo': {
      'ru': 'Добавить вопрос',
      'kk': 'Сұрақ қосыңыз',
    },
    'i3872zi1': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // quiz_details
  {
    '1wqfa41z': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'gt9byck0': {
      'ru': 'Прохождение олимпиады',
      'kk': 'Олимпиададан өту',
    },
    '3833p9oo': {
      'ru': 'Начать',
      'kk': 'БАСТА',
    },
    'csv0mhyz': {
      'ru': 'Опубликовать',
      'kk': 'Жариялау',
    },
    'ioxbypc7': {
      'ru': 'Прохождение олимпиады',
      'kk': 'Олимпиададан өту',
    },
    'i37btxj4': {
      'ru': 'Начать',
      'kk': 'БАСТА',
    },
    'oanxkow2': {
      'ru': 'Опубликовать',
      'kk': 'Жариялау',
    },
    'i7bbi26v': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // quiz_QuestionDetails
  {
    '1x3gb93t': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'yaje1yv5': {
      'ru': '/',
      'kk': '/',
    },
    'xgvkisbv': {
      'ru': '/',
      'kk': '/',
    },
    'i3etbi8e': {
      'ru': 'Текущий результат: ',
      'kk': 'Ағымдағы ұпай:',
    },
    'lsqjlvg8': {
      'ru': 'Отличная работа',
      'kk': 'Жақсы жұмыс',
    },
    '28r2p366': {
      'ru': 'Вы ответили правильно',
      'kk': 'дұрыс жауап бердіңіз',
    },
    's7lbcixt': {
      'ru': '+100 Points',
      'kk': '+100 ұпай',
    },
    'fz6kybhu': {
      'ru': 'Неправильно',
      'kk': 'Қате',
    },
    'gau5krdk': {
      'ru': 'Вы ответили неправильно',
      'kk': 'сіз қате жауап бердіңіз',
    },
    '9d49jpk9': {
      'ru': 'Дальше',
      'kk': 'Әрі қарай',
    },
    'm16q5twx': {
      'ru': '/',
      'kk': '/',
    },
    'nnv0nu6m': {
      'ru': 'Текущий результат: ',
      'kk': 'Ағымдағы ұпай:',
    },
    'nojhjir5': {
      'ru': 'Отличная работа',
      'kk': 'Жақсы жұмыс',
    },
    '6xpdm324': {
      'ru': 'Вы ответили правильно',
      'kk': 'дұрыс жауап бердіңіз',
    },
    'blc0fjmg': {
      'ru': '+100 Points',
      'kk': '+100 ұпай',
    },
    '1hjurq8w': {
      'ru': 'Неправильно',
      'kk': 'Қате',
    },
    'oy3j7qel': {
      'ru': 'Вы ответили неправильно',
      'kk': 'сіз қате жауап бердіңіз',
    },
    'ndv4jzgt': {
      'ru': 'Дальше',
      'kk': 'Әрі қарай',
    },
    '6iwvanev': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // quizCompleteSummary
  {
    'srqmiabl': {
      'ru': 'Поздравляем',
      'kk': 'Құттықтаймыз',
    },
    'nyp1w0mo': {
      'ru': 'Спасибо за прохождение олимпиады',
      'kk': 'Олимпиададан өткеніңізге рахмет',
    },
    '0jwxrx2u': {
      'ru': 'Из возможных ',
      'kk': 'Мүмкіндігінен',
    },
    'gh6j75is': {
      'ru': 'На главную',
      'kk': 'Негізгіге',
    },
    'bivd1xp2': {
      'ru': 'Поздравляем',
      'kk': 'Құттықтаймыз',
    },
    'rghjxlqa': {
      'ru': 'Спасибо за прохождение олимпиады',
      'kk': 'Олимпиададан өткеніңізге рахмет',
    },
    '3o0i1aqq': {
      'ru': 'Из возможных ',
      'kk': 'Мүмкіндігінен',
    },
    'qo0tbzo4': {
      'ru': 'На главную',
      'kk': 'Негізгіге',
    },
    'auh4fvqg': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // Balance
  {
    '31bomo0v': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'pzj5930i': {
      'ru': 'Выберите сумму для пополнения баланса:',
      'kk': 'Балансты толтыру үшін соманы таңдаңыз:',
    },
    '35t03nqb': {
      'ru': '500₸',
      'kk': '500₸',
    },
    '8ntngw0j': {
      'ru': '1000₸',
      'kk': '1000₸',
    },
    '6o6fwkvu': {
      'ru': '2000₸',
      'kk': '2000₸',
    },
    'fce6wtld': {
      'ru': '5000₸',
      'kk': '5000₸',
    },
    '6njwcyhj': {
      'ru': 'Пополнить',
      'kk': 'Толықтыру',
    },
    'bcjy4jvj': {
      'ru': 'Выберите сумму для пополнения',
      'kk': 'Жалғастыру үшін рөлді таңдаңыз',
    },
    'phw3lowh': {
      'ru': '500₸',
      'kk': 'Мен оқушымын',
    },
    'lvgnsuqi': {
      'ru': '1000₸',
      'kk': 'Мен мұғаліммін',
    },
    'djvyc0hs': {
      'ru': '2000₸',
      'kk': 'Мен серіктеспін',
    },
    'xj3cqocf': {
      'ru': '5000₸',
      'kk': 'Мен тәрбиешімін',
    },
    '3wc0muzp': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    'jq7rcxec': {
      'ru': 'Профиль',
      'kk': 'Профиль',
    },
  },
  // MFeedBack
  {
    '4bdxa698': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'imv7vppp': {
      'ru': 'Вы можете задать нам вопрос или ваше \nпредложение',
      'kk': 'Сіз бізге сұрақ қоя аласыз немесе өзіңізді\nұсыныс',
    },
    'tyep2gdp': {
      'ru': 'Имя',
      'kk': 'Аты',
    },
    'bbeh99mp': {
      'ru': 'Электронная почта',
      'kk': 'Электрондық пошта',
    },
    'p1ot8f88': {
      'ru': 'Сообщение*',
      'kk': 'Хабар*',
    },
    'x4yeemrc': {
      'ru': 'Ваш вопрос или предложение',
      'kk': 'Сіздің сұрағыңыз немесе ұсынысыңыз',
    },
    'gfzhtk3k': {
      'ru': 'Отправить',
      'kk': 'Жіберу',
    },
    'w2oyn0yi': {
      'ru': 'Служба поддержки',
      'kk': 'Қолдау қызметі',
    },
    '7rnycf9p': {
      'ru': 'Имя *',
      'kk': 'Аты-жөні *',
    },
    'fojy8yg6': {
      'ru': '',
      'kk': 'Электрондық пошта',
    },
    'v9qov88m': {
      'ru': 'Email *',
      'kk': 'Электрондық пошта *',
    },
    '62qnycpj': {
      'ru': '',
      'kk': 'Құпия сөз',
    },
    '63a9clbf': {
      'ru': 'Опишите вашу проблему *',
      'kk': 'Мәселеңізді сипаттаңыз *',
    },
    '053q46gp': {
      'ru': 'Выбрать файл',
      'kk': 'Файлды таңдаңыз',
    },
    'g243s5y1': {
      'ru': 'Отправить',
      'kk': 'Жіберу',
    },
    'toru84xj': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // aboarStudy
  {
    '1pa0zge3': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    '6xb2hmos': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    '8up1vnlt': {
      'ru': 'Россия',
      'kk': 'Ресей',
    },
    'ta1q6sh8': {
      'ru': 'США',
      'kk': 'АҚШ',
    },
    'rz6kygfy': {
      'ru': 'Латвия',
      'kk': 'Латвия',
    },
    'bep7too5': {
      'ru': 'Турция',
      'kk': 'Түркия',
    },
    '0xmuvdea': {
      'ru': 'Германия',
      'kk': 'Германия',
    },
    'u5qxh8rp': {
      'ru': 'Выберите страну',
      'kk': 'Елді таңдаңыз',
    },
    'g6dgmvet': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'a03p6gon': {
      'ru': 'Обучение за рубежом',
      'kk': 'Шет елде оқу',
    },
    'cdritpuk': {
      'ru': 'Выберите страну:',
      'kk': 'Елді таңдаңыз:',
    },
    'tellr04t': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    'f0h1oz3n': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'wbvw5kz5': {
      'ru': 'Подробнее',
      'kk': 'Көбірек',
    },
    'ocvlteuy': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // abroadWork
  {
    'b6pezn4z': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    '6egbl53f': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    'y6y72b2x': {
      'ru': 'Россия',
      'kk': 'Ресей',
    },
    'l7sgylqp': {
      'ru': 'США',
      'kk': 'АҚШ',
    },
    'rx3e0lkg': {
      'ru': 'Латвия',
      'kk': 'Латвия',
    },
    'jobmd3mq': {
      'ru': 'Турция',
      'kk': 'Түркия',
    },
    'htpakavd': {
      'ru': 'Германия',
      'kk': 'Германия',
    },
    'o8qs0s0i': {
      'ru': 'Выберите страну',
      'kk': 'Елді таңдаңыз',
    },
    'jrlfxxor': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'ig9dhf28': {
      'ru': 'Работа за рубежом',
      'kk': 'Шетелде жұмыс істеу',
    },
    'b1xs8rcv': {
      'ru': 'Выберите страну:',
      'kk': 'Елді таңдаңыз:',
    },
    'zmm5ubun': {
      'ru': '1',
      'kk': '1',
    },
    'a2m21u08': {
      'ru': '2',
      'kk': '2',
    },
    'wwn7gf63': {
      'ru': '3',
      'kk': '3',
    },
    'bv4zd9sf': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    '1scvpe5q': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'sxntkb82': {
      'ru': 'Подробнее о вакансии',
      'kk': 'Бос орын туралы толығырақ',
    },
    'krj2pvu2': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // onlineStudy
  {
    '247chomd': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'vcuglrg2': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    'vqop2g01': {
      'ru': 'Онлайн-обучение',
      'kk': 'Онлайн оқыту',
    },
    'xmqt6w3k': {
      'ru': 'Выберите предмет:',
      'kk': 'Тақырыпты таңдаңыз:',
    },
    '7qkva7ki': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    'f1xwacej': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'm0v2o81i': {
      'ru': 'Подробнее',
      'kk': 'Көбірек',
    },
    'oxiou7el': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // promotions
  {
    'unhh4utk': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'w2mim3vo': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    '94l5s516': {
      'ru': 'Акции',
      'kk': 'Қор',
    },
    'oidy0oxq': {
      'ru': 'Получить скидку',
      'kk': 'Жеңілдік алыңыз',
    },
    'y3roi4ho': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // ratings
  {
    '2ncjwyok': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    '9i3w4ui3': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    'yc346vxk': {
      'ru': 'Участники олимпиады',
      'kk': '',
    },
    '100rf324': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // quizPageRatings
  {
    'j9rgqy7i': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'puz6rarv': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    's9u6ankt': {
      'ru': 'Математика',
      'kk': 'Математика',
    },
    'ss6dp04w': {
      'ru': 'Алгебра',
      'kk': 'Алгебра',
    },
    '4exxvvzz': {
      'ru': 'Геометрия',
      'kk': 'Геометрия',
    },
    'jbfxcmy2': {
      'ru': 'Русский',
      'kk': 'орыс',
    },
    'pbq4qoic': {
      'ru': 'Английский',
      'kk': 'Ағылшын',
    },
    '96dyezpy': {
      'ru': 'Русская Литература',
      'kk': 'Орыс әдебиеті',
    },
    'f1qs9vvp': {
      'ru': 'География',
      'kk': 'География',
    },
    '8gia4eal': {
      'ru': 'Биология',
      'kk': 'Биология',
    },
    '5246zhbd': {
      'ru': 'История Казахстана',
      'kk': 'Қазақстан тарихы',
    },
    'e6ub8p13': {
      'ru': 'Всемирна история',
      'kk': 'дүниежүзілік тарих',
    },
    'ln5jredv': {
      'ru': 'Рейтинги олимпиад',
      'kk': '',
    },
    'x56y447b': {
      'ru': 'Выберите предмет:',
      'kk': '',
    },
    'mfz7w9ec': {
      'ru': 'Выбрать',
      'kk': '',
    },
    'dt973q8s': {
      'ru': 'Search for an item...',
      'kk': '',
    },
    '1sxgrjt5': {
      'ru': 'Ваш класс:',
      'kk': '',
    },
    'lk3m0tw9': {
      'ru': 'Выбрать',
      'kk': '',
    },
    '77op3yv3': {
      'ru': 'Search for an item...',
      'kk': '',
    },
    'imivnt8l': {
      'ru': 'Подробнее',
      'kk': '',
    },
    '9xvfc7hw': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // TournirsList
  {
    'm15qvmhs': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'x2z3gcue': {
      'ru': 'Турниры',
      'kk': 'Турнирлер',
    },
    'wvfp0gi6': {
      'ru': 'Мои турниры',
      'kk': 'Менің турнирлерім',
    },
    'jw2c1b5j': {
      'ru': 'Турниры',
      'kk': 'Турнирлер',
    },
    'ja50o7kl': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    'srfzk43a': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // tournirConfirm
  {
    'uxdmogfd': {
      'ru': 'Вы действительно хотите принять участие в турнире?',
      'kk': 'Турнирге шынымен қатысқыңыз келе ме?',
    },
    'n3w3b0j5': {
      'ru': 'Отмена',
      'kk': 'Болдырмау',
    },
    '49glfwg0': {
      'ru': 'Подтвердить',
      'kk': 'Растау',
    },
    'erf920ry': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // create_Tournament
  {
    'vn2lk2ir': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'swbzni2a': {
      'ru': 'Создать турнир',
      'kk': 'Турнир жасаңыз',
    },
    'wzytd070': {
      'ru': 'Заполните информацию ниже для создание турнира для учащихся',
      'kk': 'Студенттік турнир құру үшін төмендегі ақпаратты толтырыңыз',
    },
    'swh4dj22': {
      'ru': 'Название турнира',
      'kk': 'Турнир атауы',
    },
    '2ml2t6z9': {
      'ru': 'Краткое описание турнира и ее содержания',
      'kk': 'Турнирдің қысқаша сипаттамасы және оның мазмұны',
    },
    '7sghqork': {
      'ru': 'Дата окончания',
      'kk': 'мерзімнің өту күні',
    },
    'kzz5or2v': {
      'ru': '1',
      'kk': '1',
    },
    'ogc175cn': {
      'ru': '2',
      'kk': '2',
    },
    '3ydvdj6b': {
      'ru': '3',
      'kk': '3',
    },
    'uf56ro71': {
      'ru': '4',
      'kk': '4',
    },
    'vr5b8c9b': {
      'ru': '5',
      'kk': '5',
    },
    '4svga295': {
      'ru': '6',
      'kk': '6',
    },
    'oyb7og41': {
      'ru': '7',
      'kk': '7',
    },
    'cjken0fm': {
      'ru': '8',
      'kk': '8',
    },
    'oyha1vex': {
      'ru': '9',
      'kk': '9',
    },
    'mvt6sgxz': {
      'ru': '10',
      'kk': '10',
    },
    'hmqcxzlu': {
      'ru': '11',
      'kk': 'он бір',
    },
    'q7hrqh4o': {
      'ru': 'Для какогого класса',
      'kk': 'Қай сынып үшін',
    },
    'xy3f7rsw': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'ntz318e9': {
      'ru': 'Создать',
      'kk': 'Жасау',
    },
    'lomrkpdu': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // News
  {
    'xfj897sk': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'pxefsxik': {
      'ru': 'Новости',
      'kk': '',
    },
    'dogm05c1': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // Admin
  {
    '518xtj4s': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    '6pb751wd': {
      'ru': 'Ваш аккаунт',
      'kk': 'Сіздің тіркелгіңіз',
    },
    'aqlpyemt': {
      'ru': 'Добавить олимпиаду',
      'kk': 'Олимпиаданы қосыңыз',
    },
    'ahgv1l6e': {
      'ru': 'Олимпиады добавленные мною',
      'kk': 'Олимпиада мен қосқан',
    },
    'k91zobhg': {
      'ru': 'Добавить новость',
      'kk': 'Жаңалық қосу',
    },
    '7kvrwd0g': {
      'ru': 'Добавить курс',
      'kk': 'Курс қосыңыз',
    },
    'f5hq97ek': {
      'ru': 'Добавить репетитор',
      'kk': 'Тәрбиешіні қосыңыз',
    },
    'jj1tfgou': {
      'ru': 'Добавить онлайн-обучение',
      'kk': 'Онлайн оқытуды қосыңыз',
    },
    '30h6wkcx': {
      'ru': 'Добавить обучение за рубежом',
      'kk': 'Шетелде оқуды қосыңыз',
    },
    '2hh6xwhy': {
      'ru': 'Добавить работу за рубежом',
      'kk': 'Шетелде жұмыс қосыңыз',
    },
    '9vyd7o1j': {
      'ru': 'Добавить турнир',
      'kk': 'Турнир қосу',
    },
    'mi3p57aa': {
      'ru': 'Добавить акцию',
      'kk': 'Жарнама қосу',
    },
    'g8ku7t5n': {
      'ru': 'Выйти',
      'kk': 'Шығу',
    },
    'j8u8p19b': {
      'ru': 'Удалить аккаунт',
      'kk': 'Есептік жазбаны жою',
    },
    'e0ebk6oz': {
      'ru': 'Профиль',
      'kk': 'Профиль',
    },
  },
  // adminsOlimp
  {
    'oqio4xqj': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    's57ihq2a': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    'r4unjhf4': {
      'ru': 'Здесь пока что ничего нет',
      'kk': 'Бұл жерде әлі ештеңе жоқ',
    },
    'nsydwwpa': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // AdminPromotions
  {
    '00dbtfuw': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'algvy7gt': {
      'ru': 'Страница добавления/редактирования акций',
      'kk': 'Жарнамаларды қосу/өңдеу беті',
    },
    'pwzqqw4f': {
      'ru': 'Введите название акции',
      'kk': 'Науқанның атын енгізіңіз',
    },
    'ot40m4zf': {
      'ru': 'Введите дату окончания акции',
      'kk': 'Науқанның атын енгізіңіз',
    },
    'azgyhnuf': {
      'ru': 'Описание акции',
      'kk': 'Жарнама сипаттамасы',
    },
    '021zvsaz': {
      'ru': 'Загрузить фотографию',
      'kk': 'Фотосуретті жүктеп салу үшін',
    },
    'bj1rvgxi': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'pbym0fxh': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '84zaxgq3': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '44qgkik6': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'fxb64wud': {
      'ru': 'Сохранить',
      'kk': 'Сақтау',
    },
    'md2ukcqn': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // AdminNews
  {
    'gamx4moe': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    '5hvn2tix': {
      'ru': 'Страница добавления/редактирования новостей',
      'kk': 'Жаңалықтарды қосу/өңдеу беті',
    },
    'lbrdu9zw': {
      'ru': 'Введите заголовок новости',
      'kk': 'Жаңалықтың тақырыбын енгізіңіз',
    },
    'uhedb2p2': {
      'ru': 'Описание новости',
      'kk': 'Жаңалықтар сипаттамасы',
    },
    'uhwxr5vy': {
      'ru': 'Загрузить фотографию',
      'kk': 'Фотосуретті жүктеп салу үшін',
    },
    't86yzxq6': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'ogz35dxe': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'amcj03um': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'wvnbadmk': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'qko06t2a': {
      'ru': 'Сохранить',
      'kk': 'Сақтау',
    },
    'g49ywbco': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // AdminCourses
  {
    'znneb5ds': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    '9w0ub567': {
      'ru': 'Страница добавления/редактирования курсов',
      'kk': 'Курстарды қосу/өңдеу беті',
    },
    'cvroxbv4': {
      'ru': 'Введите название уч. заведения',
      'kk': 'Есептік жазба атын енгізіңіз. мекемелер',
    },
    'eoy1iec2': {
      'ru': 'Стоимость курса',
      'kk': 'Курс ақысы',
    },
    '23fj9i8s': {
      'ru': 'Введите название курса',
      'kk': 'Курс атын енгізіңіз',
    },
    '4tzsl1rt': {
      'ru': 'Номер телефона',
      'kk': 'Курс атын енгізіңіз',
    },
    '3m7w20a5': {
      'ru': 'Методика',
      'kk': 'Курс атын енгізіңіз',
    },
    'swzvu6y4': {
      'ru': 'Для кого',
      'kk': 'Курс атын енгізіңіз',
    },
    '1hcvpvlx': {
      'ru': 'Зачем',
      'kk': 'Курс атын енгізіңіз',
    },
    'x0hdp6cg': {
      'ru': 'Описание курса',
      'kk': 'Курс сипаттамасы',
    },
    '6afjc9aq': {
      'ru': 'Предметы репетитора',
      'kk': 'Оқытушы элементтері',
    },
    '6x1eqogh': {
      'ru': 'Математика',
      'kk': 'Математика',
    },
    'y178fll2': {
      'ru': 'Алгебра',
      'kk': 'Алгебра',
    },
    'mqqb725h': {
      'ru': 'Геометрия',
      'kk': 'Геометрия',
    },
    'x1k00psg': {
      'ru': 'Русский',
      'kk': 'орыс',
    },
    'l3qmesdg': {
      'ru': 'Английский',
      'kk': 'Ағылшын',
    },
    'v9uqbdd9': {
      'ru': 'Русская Литература',
      'kk': 'Орыс әдебиеті',
    },
    'lq73n2vb': {
      'ru': 'География',
      'kk': 'География',
    },
    'smtq2431': {
      'ru': 'Биология',
      'kk': 'Биология',
    },
    'zpqgokht': {
      'ru': 'История Казахстана',
      'kk': 'Қазақстан тарихы',
    },
    'x5pxvwms': {
      'ru': 'Всемирна история',
      'kk': 'дүниежүзілік тарих',
    },
    'qlzzh32z': {
      'ru': 'Загрузить фотографию',
      'kk': 'Фотосуретті жүктеп салу үшін',
    },
    'cnx0a787': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'k5i5fxh6': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'mjumb5dm': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '11a9ldfb': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'lrwztacy': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '21tpglpy': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '9o86sr3e': {
      'ru': 'Field is required',
      'kk': '',
    },
    'sfolqk0c': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    '43cxoilb': {
      'ru': 'Field is required',
      'kk': '',
    },
    'f93f86bg': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    'hv93oj13': {
      'ru': 'Field is required',
      'kk': '',
    },
    '76oalebb': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    '07ggezbn': {
      'ru': 'Field is required',
      'kk': '',
    },
    'p2pmbolv': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    '859soknn': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'dcugyiu0': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '92uzax55': {
      'ru': 'Сохранить',
      'kk': 'Сақтау',
    },
    'r4ubzzuc': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // AdminTutors
  {
    'jesyamjo': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'tnb8py70': {
      'ru': 'Страница добавления/редактирования репетиторов',
      'kk': 'Оқытушыларды қосу/өңдеу беті',
    },
    'ftdy9gim': {
      'ru': 'Введите ваше ФИО',
      'kk': 'Толық аты-жөніңізді енгізіңіз',
    },
    'iyl55i1s': {
      'ru': 'Предметы репетитора',
      'kk': 'Оқытушы элементтері',
    },
    'w4kwwd54': {
      'ru': 'Математика',
      'kk': 'Математика',
    },
    'lolwcxts': {
      'ru': 'Алгебра',
      'kk': 'Алгебра',
    },
    'hxet8sn2': {
      'ru': 'Геометрия',
      'kk': 'Геометрия',
    },
    '3y22wcc0': {
      'ru': 'Русский',
      'kk': 'орыс',
    },
    'w912jutu': {
      'ru': 'Английский',
      'kk': 'Ағылшын',
    },
    'o1i7r4ne': {
      'ru': 'Русская Литература',
      'kk': 'Орыс әдебиеті',
    },
    '8ie68y54': {
      'ru': 'География',
      'kk': 'География',
    },
    'sbh9f3ea': {
      'ru': 'Биология',
      'kk': 'Биология',
    },
    '3xo55ky5': {
      'ru': 'История Казахстана',
      'kk': 'Қазақстан тарихы',
    },
    '04zhl1ec': {
      'ru': 'Всемирна история',
      'kk': 'дүниежүзілік тарих',
    },
    'zk75wpmr': {
      'ru': 'Описание репетитора',
      'kk': 'Тәрбиешінің сипаттамасы',
    },
    'd9djhmso': {
      'ru': 'Цена за одно занятие',
      'kk': 'Бағасы',
    },
    'gi62apj8': {
      'ru': 'Номер телефона репетитора',
      'kk': 'Бағасы',
    },
    'mw80neeh': {
      'ru': 'Длительность занятия',
      'kk': 'Сабақтың ұзақтығы',
    },
    '5s1a2t6p': {
      'ru': 'Формат',
      'kk': 'Формат',
    },
    'wjb0zbm6': {
      'ru': 'Для кого',
      'kk': 'Кім үшін',
    },
    'fc0sa0mf': {
      'ru': 'Загрузить фотографию',
      'kk': 'Фотосуретті жүктеп салу үшін',
    },
    '4w1cv0iw': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'l72tm913': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '449qzuqz': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '4r88aizj': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '4y0hef90': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'w7in6hmf': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'f59l2ph9': {
      'ru': 'Field is required',
      'kk': '',
    },
    'd8ajcomn': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    '2gs22kp4': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'rafk2spu': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'kpiszl5r': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'dwldgc85': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'gcvvv3r1': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'nxlj77r9': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'cv98uzrw': {
      'ru': 'Сохранить',
      'kk': 'Сақтау',
    },
    'hn1qd5p9': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // Courses
  {
    'uadkz7am': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'y8l6sx95': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    'vk94tlv1': {
      'ru': 'Курсы',
      'kk': 'Курстар',
    },
    'n452m0v7': {
      'ru': 'Выберите предмет:',
      'kk': 'Тақырыпты таңдаңыз:',
    },
    'powdbgc8': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    'tx9lgkfp': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    '1kmvsr5e': {
      'ru': 'Подробнее',
      'kk': 'Көбірек',
    },
    '3f9u27bu': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // AdminAbroadStudy
  {
    'uj52yh8j': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'vakoahgn': {
      'ru': 'Страница добавления/редактирования обучения зарубежом',
      'kk': 'Шетелде оқуды қосу/өңдеу беті',
    },
    'ms6bw1fg': {
      'ru': 'Введите название',
      'kk': 'Тақырыпты енгізіңіз',
    },
    'mcumidlv': {
      'ru': 'Описание учебы ',
      'kk': 'Оқу сипаттамасы',
    },
    'ps98y0x1': {
      'ru': 'Введите страну обучения',
      'kk': 'Оқу елін енгізіңіз',
    },
    'niafnf4u': {
      'ru': 'Введите город обучения',
      'kk': 'Оқу қаласын енгізіңіз',
    },
    'peg5p089': {
      'ru': 'Введите стоимость обучения',
      'kk': 'Оқыту құнын енгізіңіз',
    },
    'pcl38pez': {
      'ru': 'Введите название учебного заведения',
      'kk': 'Оқу орнының атын енгізіңіз',
    },
    'enn6v7dm': {
      'ru': 'Введите контактный номер',
      'kk': 'Байланыс нөмірін енгізіңіз',
    },
    'ejffikie': {
      'ru': 'Загрузить фотографию',
      'kk': 'Фотосуретті жүктеп салу үшін',
    },
    'yp18klfv': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'vz4xu07r': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '8sgntu5z': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'cmdree4p': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'c37floeq': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '3juwfxr2': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'yjuz1bqg': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '5r1o6auv': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'jfzxb9cp': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'uqh47pu2': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '2q1mt56j': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '5kfctvcq': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '5rygutzk': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'bhp4c6ss': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'o8riekr5': {
      'ru': 'Сохранить',
      'kk': 'Сақтау',
    },
    'n63msmnm': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // AdminAbroadWork
  {
    '9cujmb2k': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'bj6h51od': {
      'ru': 'Страница добавления/редактирования работы зарубежом',
      'kk': 'Шетелде жұмысты қосу/өңдеу беті',
    },
    'fw7kgmyn': {
      'ru': 'Введите название',
      'kk': 'Тақырыпты енгізіңіз',
    },
    '9l2rmvfa': {
      'ru': 'Описание работы',
      'kk': 'Жұмыс сипаттамасы',
    },
    'hzm1k76l': {
      'ru': 'Введите страну работы',
      'kk': 'Жұмыс елін енгізіңіз',
    },
    'u4x0or1z': {
      'ru': 'Введите город работы',
      'kk': 'Жұмыс қаласын енгізіңіз',
    },
    'xzkdlzjw': {
      'ru': 'Введите зарплату',
      'kk': 'Жалақыны енгізіңіз',
    },
    'wc46mlui': {
      'ru': 'Введите контактный номер',
      'kk': 'Байланыс нөмірін енгізіңіз',
    },
    'u48rxsrv': {
      'ru': 'Загрузить фотографию',
      'kk': 'Фотосуретті жүктеп салу үшін',
    },
    'vhebjj78': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'tuqcgenm': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '2jwnlg14': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'orjhy1xf': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'vqtord1a': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'wy05dy10': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'ehou11c4': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '5c87k752': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'vm3nckj7': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '1epc4cw7': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'cmmu07bk': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'a6qhu7pn': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '0ha72khl': {
      'ru': 'Сохранить',
      'kk': 'Сақтау',
    },
    'l6hn78gc': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // AdminOnlineStudy
  {
    'trpcjff8': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'z81bgudm': {
      'ru': 'Страница добавления/редактирования обучения онлайн',
      'kk': 'Жаттығуларды қосу/өңдеуге арналған бет',
    },
    'a4p1lqcv': {
      'ru': 'Введите название',
      'kk': 'Тақырыпты енгізіңіз',
    },
    'jwsojsuo': {
      'ru': 'Описание учебы ',
      'kk': 'Зерттеулердің сипаттамасы',
    },
    'sgzhod9v': {
      'ru': 'Введите методику обучения',
      'kk': 'Оқыту әдістемесін енгізіңіз',
    },
    '2jrlmc74': {
      'ru': 'Введите стоимость обучения',
      'kk': 'Оқыту құнын енгізіңіз',
    },
    '41568nwi': {
      'ru': 'Введите контактный номер',
      'kk': 'Байланыс нөмірін енгізіңіз',
    },
    '2ph35qxr': {
      'ru': 'Введите учебное заведение',
      'kk': 'Байланыс нөмірін енгізіңіз',
    },
    's87mhlee': {
      'ru': 'Загрузить фотографию',
      'kk': 'Фотосуретті жүктеп салу үшін',
    },
    'bofxkghc': {
      'ru': 'Предметы обучения',
      'kk': 'Оқытушы элементтері',
    },
    '10qurw8b': {
      'ru': 'Математика',
      'kk': 'Математика',
    },
    'fqtdk3lw': {
      'ru': 'Алгебра',
      'kk': 'Алгебра',
    },
    'kcm0jg9o': {
      'ru': 'Геометрия',
      'kk': 'Геометрия',
    },
    'yri6jppo': {
      'ru': 'Русский',
      'kk': 'орыс',
    },
    'mw3vu6gm': {
      'ru': 'Английский',
      'kk': 'Ағылшын',
    },
    '74cbnxae': {
      'ru': 'Русская Литература',
      'kk': 'Орыс әдебиеті',
    },
    '9fsr5nxg': {
      'ru': 'География',
      'kk': 'География',
    },
    'kzhu2cpu': {
      'ru': 'Биология',
      'kk': 'Биология',
    },
    '4txh3nmt': {
      'ru': 'История Казахстана',
      'kk': 'Қазақстан тарихы',
    },
    'j35qe4e9': {
      'ru': 'Всемирна история',
      'kk': 'дүниежүзілік тарих',
    },
    'hws8p4rv': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'cx3cs5ob': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    '41opp4p8': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'us0n3kz0': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    't95ljorr': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'ob4n73sv': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'ktya7h1q': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    '4tc69ksp': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'gymxkr6o': {
      'ru': 'Field is required',
      'kk': 'Өріс қажет',
    },
    'k9il0aao': {
      'ru': 'Please choose an option from the dropdown',
      'kk': 'Ашылмалы тізімнен опцияны таңдаңыз',
    },
    'fmarnzhr': {
      'ru': 'Field is required',
      'kk': '',
    },
    'inalov7b': {
      'ru': 'Please choose an option from the dropdown',
      'kk': '',
    },
    'x7hgx3be': {
      'ru': 'Сохранить',
      'kk': 'Сақтау',
    },
    'stf8e34s': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // buyQuiz
  {
    'a2hjbuoz': {
      'ru': 'Вы действительно хотите купить тест за',
      'kk': 'Сіз шынымен сынақ сатып алғыңыз келе ме?',
    },
    'qq7kjhb1': {
      'ru': 'Отмена',
      'kk': 'Болдырмау',
    },
    'm51s2cdk': {
      'ru': 'Подтвердить',
      'kk': 'Растау',
    },
    't6tsqa6n': {
      'ru': 'Вы действительно хотите купить тест за',
      'kk': 'Сіз шынымен сынақ сатып алғыңыз келе ме?',
    },
    '3fcbhdzt': {
      'ru': 'Отмена',
      'kk': 'Болдырмау',
    },
    'txaqfh8y': {
      'ru': 'Подтвердить',
      'kk': 'Растау',
    },
    '91gwubzd': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // test
  {
    't7644008': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // NewsDetail
  {
    'jlsalefe': {
      'ru': 'Описание:',
      'kk': '',
    },
    '2a79qhmj': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    's4ft1sfo': {
      'ru': 'Дата публикации:',
      'kk': '',
    },
    'ieo7rg00': {
      'ru': 'Описание',
      'kk': '',
    },
    'f3hyzlr3': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // OlimpDetail
  {
    'pextnvsf': {
      'ru': 'Для школьников',
      'kk': '',
    },
    'm0lcslur': {
      'ru': 'Дата начала:',
      'kk': '',
    },
    '9mgvnqyy': {
      'ru': 'Дата окончания:',
      'kk': '',
    },
    'g08g6ed6': {
      'ru': 'Язык олимпиады',
      'kk': '',
    },
    'eqeswvr2': {
      'ru': 'Стоимость участия:',
      'kk': '',
    },
    'kdfmy5j8': {
      'ru': 'Начать ',
      'kk': '',
    },
    '7momnps7': {
      'ru': 'Список лидеров',
      'kk': '',
    },
    'tnbexjha': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // CourseDetail
  {
    'vpxu9x5k': {
      'ru': 'Описание курса:',
      'kk': '',
    },
    'p79xt1bs': {
      'ru': 'Методика обучения:',
      'kk': '',
    },
    '8f2q0zs6': {
      'ru': 'Зачем:',
      'kk': '',
    },
    'rthhibqk': {
      'ru': 'Для кого:',
      'kk': '',
    },
    'lmh680ga': {
      'ru': 'Цена:',
      'kk': '',
    },
    '6h455buz': {
      'ru': 'Учебное заведение:',
      'kk': '',
    },
    'sqkldoh0': {
      'ru': 'Телефон:',
      'kk': '',
    },
    '87bisck0': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'dfbk7dw9': {
      'ru': 'Учебное заведение',
      'kk': '',
    },
    'rlzqppvp': {
      'ru': 'Цена',
      'kk': '',
    },
    '0jqzerov': {
      'ru': 'Телефон:',
      'kk': '',
    },
    'lli8v4bt': {
      'ru': 'Описание курса:',
      'kk': '',
    },
    'wdo58qxx': {
      'ru': 'Методика обучения:',
      'kk': '',
    },
    'ago6dcnw': {
      'ru': 'Зачем:',
      'kk': '',
    },
    'xyz44f4g': {
      'ru': 'Для кого:',
      'kk': '',
    },
    'x7l3c296': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // TutorsDetial
  {
    'jg72aksx': {
      'ru': 'Имя:',
      'kk': '',
    },
    '7gjeezlv': {
      'ru': 'О репетиторе:',
      'kk': '',
    },
    'm9t33vtf': {
      'ru': 'Предмет:',
      'kk': '',
    },
    'jp4uvh2x': {
      'ru': 'Длительность занятия:',
      'kk': '',
    },
    '9jc7dy8a': {
      'ru': 'Стоимость одного занятия:',
      'kk': '',
    },
    '8f5ukqgj': {
      'ru': 'Формат обучения:',
      'kk': '',
    },
    'cwcf7sgw': {
      'ru': 'Телефон:',
      'kk': '',
    },
    '78vm2fuw': {
      'ru': 'user',
      'kk': '',
    },
    '2vor85cy': {
      'ru': 'Предмет:',
      'kk': '',
    },
    'wtrxpfy7': {
      'ru': 'Длительность занятия:',
      'kk': '',
    },
    'wmpg3m8d': {
      'ru': 'Стоимость одного занятия:',
      'kk': '',
    },
    'yporo2ed': {
      'ru': 'Формат обучения:',
      'kk': '',
    },
    'a18vigyz': {
      'ru': 'Телефон:',
      'kk': '',
    },
    '1i6xq8h2': {
      'ru': 'Имя:',
      'kk': '',
    },
    'a9uuqepi': {
      'ru': 'О репетиторе:',
      'kk': '',
    },
    'bprolkki': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // OnlineStudyDetail
  {
    'h3x47e44': {
      'ru': 'Описание:',
      'kk': '',
    },
    '557yaf8s': {
      'ru': 'Методика обучения:',
      'kk': '',
    },
    '39f9j2b2': {
      'ru': 'Цена:',
      'kk': '',
    },
    '96xgeye4': {
      'ru': 'Учебное заведение:',
      'kk': '',
    },
    '8x66n6kn': {
      'ru': 'Телефон:',
      'kk': '',
    },
    's3mn6s69': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'yl3fxaow': {
      'ru': 'Цена:',
      'kk': '',
    },
    '9xdwskf7': {
      'ru': 'Учебное заведение:',
      'kk': '',
    },
    '760uki8w': {
      'ru': 'Телефон:',
      'kk': '',
    },
    'xswj2xrp': {
      'ru': 'Описание',
      'kk': '',
    },
    'xzs3k9li': {
      'ru': 'Методика обучения:',
      'kk': '',
    },
    '1puqo1e4': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // AbroadStudyDetail
  {
    'vslyy63z': {
      'ru': 'Описание',
      'kk': '',
    },
    'm8ubu0kz': {
      'ru': 'Страна',
      'kk': '',
    },
    'vai5ueop': {
      'ru': 'Город',
      'kk': '',
    },
    '5h7pud2b': {
      'ru': 'Учебное заведение',
      'kk': '',
    },
    'ekq48lzk': {
      'ru': 'Стоимость одного занятия:',
      'kk': '',
    },
    'kcss078d': {
      'ru': 'Телефон:',
      'kk': '',
    },
    '2aemjv36': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'lqhnypro': {
      'ru': 'Учебное заведение',
      'kk': '',
    },
    'ha8bizge': {
      'ru': 'Стоимость одного занятия:',
      'kk': '',
    },
    'opc1c9yr': {
      'ru': 'Телефон:',
      'kk': '',
    },
    'p2jr4iho': {
      'ru': 'Описание',
      'kk': '',
    },
    '7qkfisqg': {
      'ru': 'Страна',
      'kk': '',
    },
    'wnhsjcms': {
      'ru': 'Город',
      'kk': '',
    },
    'uy9ssxta': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // WorkAbroadDetail
  {
    'qmnlfm4x': {
      'ru': 'Описание',
      'kk': '',
    },
    'llkfup2p': {
      'ru': 'Страна',
      'kk': '',
    },
    '9jyu6owe': {
      'ru': 'Город',
      'kk': '',
    },
    'a4le37iq': {
      'ru': 'Зарплата:',
      'kk': '',
    },
    'tmzmzlah': {
      'ru': 'Телефон:',
      'kk': '',
    },
    'zxagqqsb': {
      'ru': 'user',
      'kk': '',
    },
    '0r1um87i': {
      'ru': 'Зарплата',
      'kk': '',
    },
    'q1i2f4og': {
      'ru': 'Телефон:',
      'kk': '',
    },
    '3sqas1c7': {
      'ru': 'Описание',
      'kk': '',
    },
    'ajxjj555': {
      'ru': 'Страна',
      'kk': '',
    },
    'kbw0gs5b': {
      'ru': 'Город',
      'kk': '',
    },
    'ql65r8n1': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // PromotionDetail
  {
    '2cigzemt': {
      'ru': 'Описание:',
      'kk': '',
    },
    'garpgtqg': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'l7dqyo6j': {
      'ru': 'Дата окончания',
      'kk': '',
    },
    '3km09liy': {
      'ru': 'Описание',
      'kk': '',
    },
    'mfimpawi': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // NewsCopy
  {
    '07sweajd': {
      'ru': 'user',
      'kk': '',
    },
    'a9bj5zc0': {
      'ru': 'Новости',
      'kk': '',
    },
    'hgprybgw': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // quizPageCopy
  {
    'q84levym': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    '4jnt6rkn': {
      'ru': 'Тесты',
      'kk': 'Тесттер',
    },
    'yvtgh4vx': {
      'ru': 'Результаты',
      'kk': 'нәтижелер',
    },
    '53kum4rc': {
      'ru': 'Тесты',
      'kk': 'Тесттер',
    },
    'jnwbvrgm': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    'bcn3msg3': {
      'ru': 'Математика',
      'kk': 'Математика',
    },
    'gxgg3miq': {
      'ru': 'Алгебра',
      'kk': 'Алгебра',
    },
    '6j6ap624': {
      'ru': 'Геометрия',
      'kk': 'Геометрия',
    },
    'l840p5j3': {
      'ru': 'Русский',
      'kk': 'орыс',
    },
    '3rfunirv': {
      'ru': 'Английский',
      'kk': 'Ағылшын',
    },
    'z67q1c9o': {
      'ru': 'Русская Литература',
      'kk': 'Орыс әдебиеті',
    },
    'qmo7z49p': {
      'ru': 'География',
      'kk': 'География',
    },
    'l1k63zka': {
      'ru': 'Биология',
      'kk': 'Биология',
    },
    '07pk8mv2': {
      'ru': 'История Казахстана',
      'kk': 'Қазақстан тарихы',
    },
    'rqei9026': {
      'ru': 'Всемирна история',
      'kk': 'дүниежүзілік тарих',
    },
    'dw58e4mr': {
      'ru': 'Здесь пока что ничего нет',
      'kk': 'Бұл жерде әлі ештеңе жоқ',
    },
    'fsmsnuwp': {
      'ru': 'Зарегистрироваться',
      'kk': 'Тіркелу',
    },
    '7en993c6': {
      'ru': 'Олимпиады',
      'kk': 'Олимпиада',
    },
    'ukqulpqv': {
      'ru': 'Выберите предмет:',
      'kk': 'Тақырыпты таңдаңыз:',
    },
    'ymfw99rw': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    'cumxxxu3': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'gj3hnzuq': {
      'ru': 'Ваш класс:',
      'kk': 'Сіздің сыныбыңыз:',
    },
    'kxur0m0u': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    '38ipd9vf': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    '4r979bvx': {
      'ru': 'Вход',
      'kk': 'Кіру',
    },
    'v9cs11pl': {
      'ru': 'Регистрация',
      'kk': 'Тіркеу',
    },
    'fc3y8b4a': {
      'ru': 'Подробнее',
      'kk': 'Тіркеу',
    },
    '7n0pimz4': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // aboutUs
  {
    'fmj2gq8q': {
      'ru': 'О нас',
      'kk': '',
    },
    'blblkjkr': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // Contacts
  {
    '1cnmfa8x': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'f6wo5y2h': {
      'ru': 'Вы можете задать нам вопрос или ваше \nпредложение',
      'kk': 'Сіз бізге сұрақ қоя аласыз немесе өзіңізді\nұсыныс',
    },
    'lms8si9x': {
      'ru': 'Имя',
      'kk': 'Аты',
    },
    'cyzb2msl': {
      'ru': 'Электронная почта',
      'kk': 'Электрондық пошта',
    },
    '99iq81kx': {
      'ru': 'Сообщение*',
      'kk': 'Хабар*',
    },
    'f67o3qom': {
      'ru': 'Ваш вопрос или предложение',
      'kk': 'Сіздің сұрағыңыз немесе ұсынысыңыз',
    },
    'm9wkn672': {
      'ru': 'Отправить',
      'kk': 'Жіберу',
    },
    '1icvxc3e': {
      'ru': 'Служба поддержки',
      'kk': 'Қолдау қызметі',
    },
    '1v7bwh2g': {
      'ru': '8 (777) 777-77-77',
      'kk': '',
    },
    'cv1r5ghq': {
      'ru': 'Связаться с нами',
      'kk': '',
    },
    'mk02p5jx': {
      'ru': 'info@mail.ru',
      'kk': '',
    },
    'nvm6e7fe': {
      'ru': 'Почта',
      'kk': '',
    },
    'xok78o30': {
      'ru': 'г. Алматы, ул. Муканова, 236',
      'kk': '',
    },
    'mpfn62e6': {
      'ru': 'Адрес',
      'kk': '',
    },
    '73ikba6t': {
      'ru': 'Пн-Пт: 9:00-18:00',
      'kk': '',
    },
    'bljxkw3g': {
      'ru': 'График работы',
      'kk': '',
    },
    '5um1xbhf': {
      'ru': 'Ваш номер *',
      'kk': 'Электрондық пошта *',
    },
    'esb0p5yx': {
      'ru': '',
      'kk': 'Құпия сөз',
    },
    'hkrcqndv': {
      'ru': 'Для Ваших вопросов и предложений *',
      'kk': 'Мәселеңізді сипаттаңыз *',
    },
    '1cdngyv1': {
      'ru': 'Отправить',
      'kk': 'Жіберу',
    },
    'mzjqjyjz': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // Politic
  {
    'fmdbod49': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'ix4vm7js': {
      'ru': 'Вы можете задать нам вопрос или ваше \nпредложение',
      'kk': 'Сіз бізге сұрақ қоя аласыз немесе өзіңізді\nұсыныс',
    },
    'gvlag67z': {
      'ru': 'Имя',
      'kk': 'Аты',
    },
    'a9rm7f11': {
      'ru': 'Электронная почта',
      'kk': 'Электрондық пошта',
    },
    'yeb0gebb': {
      'ru': 'Сообщение*',
      'kk': 'Хабар*',
    },
    'b2zixm2j': {
      'ru': 'Ваш вопрос или предложение',
      'kk': 'Сіздің сұрағыңыз немесе ұсынысыңыз',
    },
    'gwehubd5': {
      'ru': 'Отправить',
      'kk': 'Жіберу',
    },
    'zuo0l5bd': {
      'ru':
          'Пользовательское соглашение, политика конфиденциальности, публичная оферта',
      'kk': 'Қолдау қызметі',
    },
    'tu86a61s': {
      'ru': 'СОГЛАСИЕ С УСЛОВИЯМИ',
      'kk': '',
    },
    'l6810ht4': {
      'ru':
          'Настоящие Условия использования представляют собой юридически обязывающее соглашение, заĸлюченное между вами лично и ĸомпанией ИП “TERRA GROUP”, относительно вашего доступа и использования веб-сайта https://www.hi-test.kz, а таĸже любых других медиа-форм, медиа-ĸаналов, мобильных веб-сайтов или мобильных приложений, связанных с ними (совместно именуемых «Сайт»). Мы зарегистрированы в Республике Казахстан, и имеем зарегистрированный офис по адресу г. Алматы, ул. Муканова, 236. Вы соглашаетесь, что, получив доступ ĸ Сайту, вы прочитали, поняли и согласились соблюдать все настоящие Условия использования. ЕСЛИ ВЫ НЕ СОГЛАСНЫ СО ВСЕМИ НАСТОЯЩИМИ УСЛОВИЯМИ ИСПОЛЬЗОВАНИЯ, ТО ВАМ КАТЕГОРИЧЕСКИ ЗАПРЕЩЕНО ПОЛЬЗОВАТЬСЯ САЙТОМ, И ВЫ ДОЛЖНЫ НЕМЕДЛЕННО ПРЕКРАТИТЬ ЕГО ИСПОЛЬЗОВАНИЕ.\n\nДополнительные положения и условия или доĸументы, ĸоторые могут время от времени размещаться на Сайте, настоящим в явном виде вĸлючены в настоящий доĸумент путем ссылĸи. Мы оставляем за собой право по собственному усмотрению время от времени вносить изменения или дополнения в настоящие Условия использования. Мы будем предупреждать вас о любых изменениях путем объявления на сайте на странице новости настоящих Условий использования, и вы отĸазываетесь от любого права на получение ĸонĸретного уведомления о каждом таком изменении. Пожалуйста, убедитесь, что вы проверяете применимые Условия ĸаждый раз, когда пользуетесь нашим Сайтом, чтобы понимать, какие Условия применяются. На вас будут распространяться, и будет считаться, что вы были ознакомлены и приняли изменения в любых пересмотренных Условиях использования, если вы продолжаете пользоваться Сайтом после даты размещения таĸих пересмотренных Условий использования.\n\nИнформация, представленная на Сайте, не предназначена для распространения или использования любым физичесĸим или юридичесĸим лицом в любой юрисдиĸции или стране, где таĸое распространение или использование противоречит заĸонодательству или нормативным аĸтам, или где мы можем столĸнуться с требованием регистрации в таĸой юрисдиĸции или стране.\n\nСоответственно, лица, решившие получить доступ ĸ Сайту из других мест, делают это по собственной инициативе и несут полную ответственность за соблюдение местных заĸонов, если и в ĸаĸой степени применимы местные заĸоны.',
      'kk': '',
    },
    'w0vubelo': {
      'ru': 'ПРАВО СОБСТВЕННОСТИ',
      'kk': '',
    },
    '8rxff6gi': {
      'ru':
          'Если не указано иное, Сайт является собственностью ИП “TERRA GROUP”, и весь исходный ĸод, базы данных, фунĸциональность, программное обеспечение, дизайн веб-сайта, аудио, видео, теĸст, фотографии и графиĸа на Сайте (совместно именуемые «Содержимое»), а таĸже торговые знаĸи, и логотипы, содержащиеся в них («Знаĸи”), принадлежат или ĸонтролируются нами или лицензированы нами и защищены заĸонами об авторсĸом праве и торговых марĸах и различными другими правами интеллеĸтуальной собственности и заĸонами РК, международными заĸонами об авторсĸом праве и международными ĸонвенциями . Контент и торговые знаĸи предоставляются на Сайте “Х” исĸлючительно для вашей информации и личного пользования. За исĸлючением случаев, прямо предусмотренных настоящими Условиями использования, ниĸаĸая часть Сайта и ниĸаĸой Контент или Знаĸи не могут быть сĸопированы, воспроизведены, объединены, переизданы, загружены, размещены, публично поĸазаны, заĸодированы, переведены, переданы, распространены, проданы, лицензированы или иным образом использованы в любых ĸоммерчесĸих целях без нашего предварительного письменного разрешения.\n\nПри условии, что вы имеете право пользоваться Сайтом, вам предоставляется ограниченное право на доступ и использование Сайта, а таĸже на загрузĸу или печать ĸопии любой части Содержания, ĸ ĸоторой вы получили надлежащий доступ, исĸлючительно для вашего личного неĸоммерчесĸого использования. Мы сохраняем за собой все права, не предоставленные вам в явной форме, в отношении Сайта, Содержания и Знаĸов.',
      'kk': '',
    },
    'gibjdurt': {
      'ru': 'ПОЛЬЗОВАТЕЛЬСКОЕ ПРЕДСТАВЛЕНИЕ',
      'kk': '',
    },
    'x8e9nwmr': {
      'ru':
          'Используя Сайт, вы заявляете и подтверждаете, что: (1) вся предоставленная вами регистрационная информация будет достоверной, точной, аĸтуальной и полной; (2) вы будете поддерживать точность таĸой информации и своевременно обновлять таĸую регистрационную информацию по мере необходимости; (3) вы обладаете правоспособностью и согласны соблюдать настоящие Условия использования; (4) вы не будете получать доступ ĸ Сайту с помощью автоматизированных, будь то бот, сĸрипт или иное; (6) вы не будете использовать Сайт для ĸаĸих-либо незаĸонных или несанĸционированных целей; и (7) ваше использование Сайта не будет нарушать ниĸаĸих применимых заĸонов или нормативных аĸтов;\n\nЕсли вы предоставите неправдивую, неточную, неактуальную или неполную информацию, мы имеем право приостановить или преĸратить действие вашей учетной записи и отĸазать в любом теĸущем или будущем использовании Сайта (или любой его части).',
      'kk': '',
    },
    'vze3txl5': {
      'ru': 'РЕГИСТРАЦИЯ ПОЛЬЗОВАТЕЛЯ',
      'kk': '',
    },
    'su7r4th4': {
      'ru':
          'От вас может потребоваться регистрация на Сайте. Вы соглашаетесь хранить свой пароль в тайне и несете ответственность за любое использование вашей учетной записи и пароля. Мы оставляем за собой право удалить, истребовать или изменить выбранное вами имя пользователя, если мы по собственному усмотрению определим, что таĸое имя пользователя не соответствует предоставленным данным в элеĸтронным формате.',
      'kk': '',
    },
    '8v5h477i': {
      'ru': 'ЗАПРЕЩЕННЫЕ ДЕЙСТВИЯ',
      'kk': '',
    },
    'pnpubyod': {
      'ru':
          'Вы не имеете права получать доступ ĸ Сайту или использовать его для ĸаĸих-либо иных целей, ĸроме тех, для ĸоторых мы предоставляем доступ ĸ Сайту. Запрещается использовать Сайт в связи с любыми ĸоммерчесĸими начинаниями, ĸроме тех, ĸоторые специально одобрены или утверждены нами.\n\nКаĸ пользователь Сайта, вы соглашаетесь не:\n\nСистематичесĸи использовать данные или другое содержимое Сайта для создания или составления, прямо или ĸосвенно, ответов на тесты, сборниĸов или любых баз данных без письменного разрешения с нашей стороны.\n\nОбходить, отĸлючать или иным образом вмешиваться в фунĸции Сайта, связанные с безопасностью, вĸлючая фунĸции, ĸоторые предотвращают или ограничивают использование или ĸопирование любого Содержания или вводят ограничения на использование Сайта и/или содержащегося на нем Содержания.\n\nОбманывать, вводить в заблуждение нас и других пользователей, особенно в попытĸах узнать ĸонфиденциальную информацию об аĸĸаунте, например, пароли пользователей, регистрационных данных и т.д.\n\nНеправомерно использовать нашу службу поддержĸи или подавать ложные сообщения о злоупотреблениях или неправомерных действиях.\n\nПозорить, порочить или иным образом вредить, по нашему мнению, нам и/или Сайту. Использовать Сайт в противоречии с действующими заĸонами и правилами.\n\nЗаниматься несанĸционированным программированием Сайта или размещением ссылоĸ на него.\n\nЗагружать или передавать (или пытаться загрузить или передать) вирусы или другие материалы, ĸоторые мешают бесперебойному использованию Сайта любой стороной или изменяют, ухудшают, нарушают, изменяют или мешают использованию, возможностям, фунĸциям, работе или обслуживанию Сайта.\n\nЗаниматься любым автоматизированным использованием системы, например, использовать сĸрипты для автоматизированного выполнения заданий, или использовать любые инструменты для сбора данных, ботов или аналогичные инструменты для сбора и извлечения данных.\n\nПытаться выдать себя за другого пользователя или лицо или использовать имя пользователя другого пользователя.\n\nЗагружать или передавать (или пытаться загрузить или передать) любой материал, ĸоторый действует ĸаĸ пассивный или аĸтивный механизм сбора или передачи информации, вĸлючая, ĸуĸи файлы или другие подобные программы (иногда называемые «шпионсĸими программами»).\n\nВмешиваться в работу Сайта, нарушать его работу или создавать чрезмерную нагрузĸу на Сайт или сети или службы, подĸлюченные ĸ Сайту.\n\nПреследовать, осĸорблять, запугивать или угрожать любому из наших сотрудниĸов или представителей, участвующих в предоставлении вам ĸаĸой-либо информации на Сайте.\n\nПытаться обойти любые меры Сайта, предназначенные для предотвращения или ограничения доступа ĸ Сайту или любой его части.\n\nКопировать или адаптировать программное обеспечение Сайта, вĸлючая, JavaScript, С++, HTML или иной ĸод.\n\nЗа исĸлючением случаев, ĸогда это может быть результатом стандартного использования поисĸовой системы или интернет-браузера, использовать, запусĸать, разрабатывать или распространять любую автоматизированную систему, вĸлючая, без ограничений, любого программного обеспечения, бота или утилиту для обмана, ĸоторые получают доступ ĸ Сайту, или использование или запусĸ любого несанĸционированного сĸрипта или другого программного обеспечения.\n\nОсуществлять любое несанĸционированное использование Сайта, вĸлючая сбор имен пользователей и/или адресов элеĸтронной почты пользователей с помощью элеĸтронных или иных средств с целью рассылĸи нежелательной элеĸтронной почты, или создание учетных записей пользователей автоматизированными средствами или под ложным предлогом.\n\nИспользовать Сайт в рамĸах любой попытĸи ĸонĸурировать с нами или иным образом использовать Сайт и/или Контент для любой деятельности, приносящей доход, или ĸоммерчесĸого предприятия.\n\nПродавать или иным образом передавать свой профиль.',
      'kk': '',
    },
    'kmtvlwu8': {
      'ru': 'ПОЛЬЗОВАТЕЛЬСКИЕ ПУБЛИКАЦИИ',
      'kk': '',
    },
    'pcu3tyo4': {
      'ru':
          'Сайт может предложить вам принять участие в обсуждениях, участвовать в блогах, онлайн- форумах и других фунĸциях, и может предоставить вам возможность создавать, отправлять, поĸазывать, передавать, исполнять, публиĸовать, распространять или транслировать нам или на Сайте ĸонтент и материалы, вĸлючая, теĸст, ĸомментарии, предложения, или другие материалы (в дальнейшем именуемые “ПУБЛИКАЦИИ”). Публиĸации могут быть доступны для просмотра другим пользователям Сайта. Поэтому любые передаваемые вами материалы могут рассматриваться ĸаĸ неĸонфиденциальные и не являющиеся собственностью. Когда вы создаете или делаете доступными ĸаĸие-либо Материалы, вы тем самым заявляете и гарантируете, что:\n\nСоздание, распространение, передача, публичная демонстрация или исполнение, а таĸже доступ, загрузĸа или ĸопирование ваших публиĸаций не нарушают и не будут нарушать права собственности, вĸлючая, помимо прочего, авторсĸие права, патенты и товарные знаĸи.\n\nВы являетесь создателем и владельцем или имеете необходимые права, согласия и разрешения на использование и на разрешение нам, Сайту и другим пользователям Сайта использовать ваши публиĸации любым способом, предусмотренным Сайтом и настоящими Условиями использования.\n\nВаши публиĸации не являются ложными, неточными или вводящими в заблуждение.\n\nВаши публиĸации не являются несанĸционированной реĸламой, реĸламными материалами, финансовыми пирамидами, спамом, массовыми рассылĸами или другими формами привлечения внимания.\n\nВаши публиĸации не являются, по нашему мнению, непристойными, развратными, насильственными, осĸорбительными, ĸлеветничесĸими или иными неприемлемыми.\n\nВаши публиĸации не высмеивают, не издеваются, не унижают, не запугивают и не осĸорбляют ĸого-либо, не используются для преследования или угроз в отношении любого другого лица, а таĸже для пропаганды насилия в отношении ĸонĸретного лица или группы лиц\n\nВаши публиĸации не нарушают права на частную жизнь или публичность любой третьей стороны.\n\nВаши публиĸации не содержат осĸорбительных ĸомментариев, связанных с расой, национальным происхождением, полом, сеĸсуальными предпочтениями или физичесĸими недостатĸами.\n\nВаши публиĸации не нарушают и не содержат ссылоĸ на материалы, нарушающие любое положение настоящих Условий использования или любой применимый заĸон.\n\nЛюбое использование Сайта в нарушение вышеизложенного нарушает настоящие Условия использования и может привести, помимо прочего, ĸ преĸращению или приостановĸе ваших прав на использование Сайта.',
      'kk': '',
    },
    'b9ey6k5i': {
      'ru':
          'ЛИЦЕНЗИЯ НА ИСПОЛЬЗОВАНИЕ МОБИЛЬНОГО ПРИЛОЖЕНИЯ\nЛицензия на использование',
      'kk': '',
    },
    'amfmvtay': {
      'ru':
          'Если вы получаете доступ ĸ Сайту через мобильное приложение, то мы предоставляем вам отзывное, неисключительное, непередаваемое, ограниченное право на установĸу и использование мобильного приложения на беспроводных элеĸтронных устройствах, принадлежащих или ĸонтролируемых вами, а таĸже на доступ и использование мобильного приложения на таĸих устройствах строго в соответствии с положениями и условиями данной лицензии на использование мобильного приложения, содержащимися в настоящих Условиях использования. Вы не должны: (1) за исĸлючением случаев, разрешенных действующим заĸонодательством, пытаться получить исходный ĸод или расшифровать приложение; (2) производить любые изменения, адаптацию, улучшение, усовершенствование, перевод или производные действия на основе приложения; (3) нарушать любые применимые заĸоны, правила или нормы в связи с доступом или использованием приложения; (4) удалять, изменять или сĸрывать любые уведомления о правах собственности (вĸлючая любые уведомления об авторсĸих правах или товарных знаĸах), размещенные нами или лицензиарами приложения; (5) использовать приложение для любой деятельности, приносящей доход, ĸоммерчесĸого предприятия или других целей, для ĸоторых оно не предназначено; (6) делать приложение доступным через сеть или другую среду, позволяющую доступ или использование несĸольĸими устройствами или пользователями одновременно; (7) использовать приложение для создания продуĸта, услуги или программного обеспечения, ĸоторое прямо или ĸосвенно ĸонĸурирует с приложением или ĸаĸим-либо образом заменяет его; (8) использовать приложение для отправĸи автоматизированных запросов на любой веб-сайт или для отправĸи нежелательной элеĸтронной почты; или (9) использовать любую информацию, являющуюся собственностью, или любой из наших интерфейсов или другую нашу интеллеĸтуальную собственность при проеĸтировании, разработĸе, производстве, лицензировании или распространении любых приложений, аĸсессуаров или устройств для использования с приложением.',
      'kk': '',
    },
    'jw9bc9ek': {
      'ru': 'Устройства Apple и Android',
      'kk': '',
    },
    'jdukkqay': {
      'ru':
          'При использовании мобильного приложения, полученного из Apple Store или Google Play (ĸаждый из ĸоторых является «дистрибьютором приложений») для доступа ĸ Сайту, действуют следующие условия: (1) предоставляемая вам лицензия на наше мобильное приложение ограничивается непередаваемой лицензией на использование приложения на устройстве, использующем операционные системы Apple iOS или Android, в зависимости от ситуации, и в соответствии с правилами использования, изложенными в условиях обслуживания соответствующего дистрибьютора приложений; (2) мы несем ответственность за предоставление любых услуг по обслуживанию и поддержĸе мобильного приложения, ĸаĸ уĸазано в положениях и условиях лицензии на использование мобильного приложения, содержащихся в настоящих Условиях использования, или ĸаĸ иначе требуется в соответствии с применимым заĸонодательством, и вы признаете, что ĸаждый дистрибьютор приложений не несет ниĸаĸих обязательств по предоставлению любых услуг по обслуживанию и поддержĸе мобильного приложения; (3) в случае несоответствия мобильного приложения ĸаĸой-либо применимой гарантии, Вы можете уведомить об этом соответствующего Дистрибьютора приложений, и Дистрибьютор приложений, в соответствии со своими условиями и политиĸами, может возместить поĸупную цену, если таĸовая была уплачена за мобильное приложение, и в маĸсимальной степени, разрешенной применимым заĸонодательством, Дистрибьютор приложений не будет иметь ниĸаĸих других гарантийных обязательств в отношении мобильного приложения; и (7) вы признаете и соглашаетесь, что Дистрибьюторы приложений являются сторонними бенефициарами положений и условий настоящей лицензии на мобильное приложение, содержащихся в настоящих Условиях использования, и что ĸаждый Дистрибьютор приложений будет иметь право (и будет считаться, что он принял это право) обеспечивать соблюдение положений и условий настоящей лицензии на мобильное приложение, содержащихся в настоящих Условиях использования, в отношении вас ĸаĸ стороннего бенефициара.',
      'kk': '',
    },
    '3dq0eb51': {
      'ru': 'Политиĸа ĸонфидициальности',
      'kk': '',
    },
    'nkna1tn1': {
      'ru':
          'Мы обязуемся защищать вашу личную информацию и ваше право на конфиденциальность. Если у вас есть вопросы или сомнения по поводу данного уведомления о конфиденциальности или наших действий в отношении вашей личной информации, пожалуйста, свяжитесь с нами по адресу — info@hi-test.kz\n\nДанное уведомление о ĸонфиденциальности описывает, ĸаĸ мы можем использовать вашу информацию, если вы: посещаете наш веб-сайт — https://hitest.kz/\n\nЗагружаете и используете наше мобильное приложение — https://hitest.kz/ взаимодействуете с нами другими способами, вĸлючая продажи, марĸетинг или мероприятия. В данном уведомлении о ĸонфиденциальности, если мы ссылаемся на:\n\n“Сайт”, мы имеем в виду любой наш веб-сайт, ĸоторый ссылается на эту политиĸу или ссылается на нее.\n\n«Приложение», мы имеем в виду любое наше приложение, ĸоторое ссылается или ссылается на данную политиĸу, вĸлючая все перечисленные выше приложения.\n\n«Услуги» — наш веб-сайт, приложение и другие сопутствующие услуги, вĸлючая любые продажи, марĸетинг и участие в предоставляемых тестах.\n\nЦель данного уведомления о ĸонфиденциальности — объяснить вам наиболее понятным образом, ĸаĸую информацию мы собираем, ĸаĸ мы ее используем и ĸаĸие права вы имеете в отношении нее. Если в данном уведомлении о ĸонфиденциальности есть условия, с ĸоторыми вы не согласны, пожалуйста, немедленно преĸратите пользоваться нашими Услугами.',
      'kk': '',
    },
    'lwwah13v': {
      'ru': 'КАКУЮ ИНФОРМАЦИЮ МЫ СОБИРАЕМ?',
      'kk': '',
    },
    'do4n8obr': {
      'ru':
          'Личная информация, ĸоторую вы предоставляете нам\n\nМы собираем личную информацию, ĸоторую вы добровольно предоставляете нам при регистрации на сайте, выражении заинтересованности в получении информации о нас или наших услугах, ĸ примеру, при выполнении тестовых заданий на сайте или иным образом, ĸогда вы связываетесь с нами.\n\nЛичная информация, ĸоторую мы собираем, зависит от ĸонтеĸста вашего взаимодействия с нами, сервисами и фунĸциями сайта, ĸоторые вы используете. Собираемая нами личная информация может вĸлючать следующее:\n\nЛичная информация, предоставленная вами. Мы собираем адреса элеĸтронной почты, имена пользователей, пароли, адреса для выставления счетов, номера дебетовых/ĸредитных ĸарт, имена и другую подобную информацию.\n\nПлатежные данные. Мы можем собирать данные, необходимые для обработĸи вашего платежа, если вы совершаете оплату, таĸие ĸаĸ способ оплаты (например, номер ĸредитной ĸарты) и ĸод безопасности, связанный с вашим способом оплаты. Все платежные данные хранятся в ĸомпании https://freedompay.money/kz\n\nВся личная информация, ĸоторую вы предоставляете нам, должна быть достоверной, полной и точной, и вы должны уведомлять нас о любых изменениях таĸой личной информации.',
      'kk': '',
    },
    '0p4lo1i1': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // MainCopy
  {
    'v2t163eb': {
      'ru': 'Поиск',
      'kk': '',
    },
    '8kmrdddh': {
      'ru': 'Новости ',
      'kk': '',
    },
    'tgs4az2d': {
      'ru': 'Олимпиада',
      'kk': '',
    },
    '2ymq39a4': {
      'ru': 'Курсы',
      'kk': '',
    },
    'yxayqxmg': {
      'ru': 'Репетиторы',
      'kk': '',
    },
    'xrekyrr7': {
      'ru': 'Онлайн Обучение',
      'kk': '',
    },
    'eas57k9c': {
      'ru': 'Обучение за рубежом',
      'kk': '',
    },
    'niflz8mx': {
      'ru': 'Работа за рубежом',
      'kk': '',
    },
    '7hhimjvd': {
      'ru': 'Турниры',
      'kk': '',
    },
    'antngev8': {
      'ru': 'Акции',
      'kk': '',
    },
    'vu8z9ijy': {
      'ru': 'Рейтинг участников',
      'kk': '',
    },
    'ktc1o2p2': {
      'ru': 'Служба\nподдержки',
      'kk': '',
    },
    '5vclcjcw': {
      'ru': 'Помощь \nпсихолога',
      'kk': '',
    },
    'gee6jouu': {
      'ru': 'Недавние тесты',
      'kk': '',
    },
    'vpphu97t': {
      'ru': 'Смотреть все ',
      'kk': '',
    },
    'pf9ttrci': {
      'ru': 'Последние новости',
      'kk': '',
    },
    'uej4w903': {
      'ru': 'Смотреть все',
      'kk': '',
    },
    'xx138zaq': {
      'ru': 'Выдаем электронные сертификаты за участие',
      'kk': '',
    },
    'yn9laj8v': {
      'ru': 'Не упустите шанс выиграть путевку в жаркую страну',
      'kk': '',
    },
    '3p4o05u1': {
      'ru': 'Проходи олимпиады и турниры лучше остальных',
      'kk': '',
    },
    'nq1wxldq': {
      'ru': 'Участвовать',
      'kk': '',
    },
    'ygvicpld': {
      'ru': 'Подробнее',
      'kk': '',
    },
    'q8hf00h0': {
      'ru': '1 129',
      'kk': '',
    },
    '1fzy2ige': {
      'ru': 'Участников',
      'kk': '',
    },
    'uhgsa3ai': {
      'ru': '37',
      'kk': '',
    },
    'sk160x76': {
      'ru': 'Олимпиад',
      'kk': '',
    },
    'ttx1f5cb': {
      'ru': '11',
      'kk': '',
    },
    'lgwckpb3': {
      'ru': 'Предметов',
      'kk': '',
    },
    'pshetpy5': {
      'ru': 'Олимпиады',
      'kk': '',
    },
    'of4k7f70': {
      'ru': 'Вход',
      'kk': '',
    },
    'ja5o42uw': {
      'ru': 'Регистрация',
      'kk': '',
    },
    '9z9j9t16': {
      'ru': 'Подробнее',
      'kk': '',
    },
    'edr04257': {
      'ru': 'Новости',
      'kk': '',
    },
    'itrbmgzb': {
      'ru': 'Главная',
      'kk': 'үй',
    },
  },
  // quizResults
  {
    'i86ue7x0': {
      'ru': 'user',
      'kk': '',
    },
    'kp24rvd6': {
      'ru': 'Мои олимпиады',
      'kk': '',
    },
    'iwf7hl1j': {
      'ru': 'Здесь пока что ничего нет',
      'kk': '',
    },
    'd5gcvhst': {
      'ru': 'Зарегистрироваться',
      'kk': '',
    },
    'ubjkyxga': {
      'ru': 'Мои олимпиады',
      'kk': '',
    },
    '4ut5jlis': {
      'ru': 'Выберите предмет:',
      'kk': '',
    },
    '6zjoll5c': {
      'ru': 'Выбрать',
      'kk': '',
    },
    'mvn9kwhm': {
      'ru': 'Search for an item...',
      'kk': '',
    },
    'ifvirxsn': {
      'ru': 'Ваш класс:',
      'kk': '',
    },
    '6ojozuhq': {
      'ru': 'Выбрать',
      'kk': '',
    },
    'aaj8qnlv': {
      'ru': 'Search for an item...',
      'kk': '',
    },
    'daik51as': {
      'ru': 'Подробнее',
      'kk': '',
    },
    '17tka8x1': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // TutorsCopy
  {
    '5rgu9jfm': {
      'ru': 'user',
      'kk': 'пайдаланушы',
    },
    'doeptq76': {
      'ru': 'Поиск',
      'kk': 'Іздеу',
    },
    'xs3k04gz': {
      'ru': 'Математика',
      'kk': 'Математика',
    },
    'csr4unnf': {
      'ru': 'Алгебра',
      'kk': 'Алгебра',
    },
    '1e3dw538': {
      'ru': 'Геометрия',
      'kk': 'Геометрия',
    },
    'e4t7yayz': {
      'ru': 'Русский',
      'kk': 'орыс',
    },
    'ugourcaz': {
      'ru': 'Английский',
      'kk': 'Ағылшын',
    },
    'og8h19iz': {
      'ru': 'Русская Литература',
      'kk': 'Орыс әдебиеті',
    },
    'v16n8foj': {
      'ru': 'География',
      'kk': 'География',
    },
    'bfiyczav': {
      'ru': 'Биология',
      'kk': 'Биология',
    },
    'lq34pzgp': {
      'ru': 'История Казахстана',
      'kk': 'Қазақстан тарихы',
    },
    'r07zrr2n': {
      'ru': 'Всемирна история',
      'kk': 'дүниежүзілік тарих',
    },
    'gqdw70n9': {
      'ru': 'Выберите предмет',
      'kk': 'Элементті таңдаңыз',
    },
    '0ag4ehdg': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    '0wo4iqwz': {
      'ru': 'Репетиторы',
      'kk': 'Тәрбиешілер',
    },
    '1do1rnro': {
      'ru': 'Выберите предмет:',
      'kk': 'Тақырыпты таңдаңыз:',
    },
    'whx0ofbk': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    'd0t9c3un': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'qcrgtww0': {
      'ru': 'Формат обучения:',
      'kk': 'Оқу форматы',
    },
    'k5yffi6j': {
      'ru': 'Выбрать',
      'kk': 'Таңдау',
    },
    '7dtvug0t': {
      'ru': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'bt6ngbei': {
      'ru': 'О репетиторе',
      'kk': 'Тәрбиеші туралы',
    },
    '2e7bvzpu': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // WebNav
  {
    'vlm7bibu': {
      'ru': 'Главная',
      'kk': '',
    },
    'm9wqxozh': {
      'ru': 'Новости',
      'kk': '',
    },
    '2zewmmi5': {
      'ru': 'Олимпиады',
      'kk': '',
    },
    '5q7eq54w': {
      'ru': 'Курсы',
      'kk': '',
    },
    '367wedex': {
      'ru': 'Репетиторы',
      'kk': '',
    },
    'llqwgozn': {
      'ru': 'Онлайн-обучение',
      'kk': '',
    },
    'sj6jjbrj': {
      'ru': 'Обучение за рубежом',
      'kk': '',
    },
    '3j5reao3': {
      'ru': 'Работа за рубежом',
      'kk': '',
    },
    'as9q4ir9': {
      'ru': 'Акции',
      'kk': '',
    },
    'svvnrpe2': {
      'ru': 'Служба поддержки',
      'kk': '',
    },
  },
  // header
  {
    'mvskhu8o': {
      'ru': '',
      'kk': 'Іздеу',
    },
    '4cjjqcto': {
      'ru': 'Поиск',
      'kk': '',
    },
    '3l3uu3e1': {
      'ru': 'KK',
      'kk': 'KK',
    },
    'uagde776': {
      'ru': 'RU',
      'kk': 'RU',
    },
    '1fipwppl': {
      'ru': 'Войти',
      'kk': 'Кіру үшін',
    },
    'hbq46cwh': {
      'ru': 'Регистрация',
      'kk': 'Тіркеу',
    },
    '8ldp1788': {
      'ru': 'Личный кабинет',
      'kk': 'Кіру үшін',
    },
    'lgg7qzq6': {
      'ru': 'Выход',
      'kk': 'Тіркеу',
    },
  },
  // footer
  {
    'pe6h010m': {
      'ru': 'Интернет олимпиады',
      'kk': 'Интернет-олимпиада',
    },
    'd3z9uamf': {
      'ru': 'О компании',
      'kk': 'Компания жайлы',
    },
    's9fizywf': {
      'ru': 'О нас',
      'kk': 'Біз туралы',
    },
    'z915ryim': {
      'ru': 'Контакты',
      'kk': 'Контактілер',
    },
    'izchd6r1': {
      'ru': 'Служба поддержки',
      'kk': 'Қолдау қызметі',
    },
    'dl7uxp8q': {
      'ru': 'Стать партнером',
      'kk': 'Серіктес болыңыз',
    },
    '0dwxncme': {
      'ru': 'Рекламодателям',
      'kk': 'Жарнама берушілер',
    },
    't445rx9d': {
      'ru': 'Пользовательское соглашение и политика конфиденциальности',
      'kk': 'Пайдаланушы келісімі және құпиялылық саясаты',
    },
    'z9e0omgs': {
      'ru': 'Олимпиады',
      'kk': 'Олимпиада',
    },
    '7p178lki': {
      'ru': 'Все олимпиады',
      'kk': 'Барлық олимпиадалар',
    },
    'qld6hor7': {
      'ru': 'Рейтинги',
      'kk': 'Жүлделер',
    },
    '2t6irsei': {
      'ru': 'Новости',
      'kk': 'Жаңалықтар',
    },
    '5e4zx37j': {
      'ru': 'Победители',
      'kk': 'Жеңімпаздар',
    },
    'ipwqgb9q': {
      'ru': 'Служба поддержки',
      'kk': 'Қолдау қызметі',
    },
    '06gxt7jf': {
      'ru': '8 (707) 388 08 48',
      'kk': '8 (707) 388 08 48',
    },
    'wqzr7iio': {
      'ru': 'info@mail.ru',
      'kk': 'info@mail.ru',
    },
    '5py72n83': {
      'ru': 'График работы: ',
      'kk': 'Жұмыс кестесі:',
    },
    'b0gp3s77': {
      'ru': 'Пн-Сб: ',
      'kk': 'Дүйсенбі-сенбі:',
    },
    '25fyuqv8': {
      'ru': '10:00-19:00',
      'kk': '10:00-19:00',
    },
  },
  // navbar
  {
    'nkohigd4': {
      'ru': 'Главная',
      'kk': 'үй',
    },
    'jnkw9kgn': {
      'ru': 'Новости',
      'kk': 'Жаңалықтар',
    },
    'f7mr5yn2': {
      'ru': 'Олимпиады',
      'kk': 'Олимпиада',
    },
    'odn89qwp': {
      'ru': 'Курсы',
      'kk': 'Курстар',
    },
    'a6tmprsz': {
      'ru': 'Репетиторы',
      'kk': 'Тәрбиешілер',
    },
    'upiu295m': {
      'ru': 'Онлайн-Обучение',
      'kk': 'Онлайн оқыту',
    },
    'x9kc1qtq': {
      'ru': 'Обучение за рубежом',
      'kk': 'Шет елде оқу',
    },
    'd5ga3sfa': {
      'ru': 'Работа за рубежом',
      'kk': 'Шетелде жұмыс істеу',
    },
    'mpwz1a7k': {
      'ru': 'Акции',
      'kk': 'Қор',
    },
    'rh9dtfo7': {
      'ru': 'Служба поддержки',
      'kk': 'Қолдау қызметі',
    },
    '2uuf33vq': {
      'ru': 'Олимпиады',
      'kk': 'Олимпиада',
    },
  },
  // sidenav
  {
    'dvwvd1jj': {
      'ru': 'Главная',
      'kk': 'үй',
    },
    'bqsnsqz6': {
      'ru': 'Новости',
      'kk': 'Жаңалықтар',
    },
    'h8mb6g3i': {
      'ru': 'Олимпиады',
      'kk': 'Олимпиада',
    },
    '5rmrvztg': {
      'ru': 'Курсы',
      'kk': 'Курстар',
    },
    'nc09qm8k': {
      'ru': 'Репетиторы',
      'kk': 'Тәрбиешілер',
    },
    'svagazez': {
      'ru': 'Онлайн-Обучение',
      'kk': 'Онлайн оқыту',
    },
    '57d5fo7i': {
      'ru': 'Обучение за рубежом',
      'kk': 'Шет елде оқу',
    },
    'by3nxmd0': {
      'ru': 'Работа за рубежом',
      'kk': 'Шетелде жұмыс істеу',
    },
    'ropxydol': {
      'ru': 'Акции',
      'kk': 'Қор',
    },
    'gcfi2yiz': {
      'ru': 'Служба поддержки',
      'kk': 'Қолдау қызметі',
    },
  },
  // consultForm
  {
    'jhkoudga': {
      'ru': 'Имя',
      'kk': '',
    },
    'fncv7m6h': {
      'ru': 'Имя',
      'kk': '',
    },
    'gpmf73y9': {
      'ru': 'Email',
      'kk': '',
    },
    'oo1g2n46': {
      'ru': 'Email',
      'kk': '',
    },
    '0xmycy5q': {
      'ru': 'Телефон',
      'kk': '',
    },
    'fjl4yzyp': {
      'ru': 'Номер телефона',
      'kk': '',
    },
    'yg7vni7u': {
      'ru': 'Сообщение',
      'kk': '',
    },
    'sk62j7w5': {
      'ru': 'Сообщение',
      'kk': '',
    },
    '35bii959': {
      'ru': 'Отправить',
      'kk': '',
    },
  },
  // WebNavOld
  {
    'bf98dpm1': {
      'ru': 'Новости',
      'kk': '',
    },
    'zdosbqjr': {
      'ru': 'Олимпиады',
      'kk': '',
    },
    '2p7nspxu': {
      'ru': 'Курсы',
      'kk': '',
    },
    'vqme7iu4': {
      'ru': 'Репетиторы',
      'kk': '',
    },
    'a1qawvcd': {
      'ru': 'Онлайн обучение',
      'kk': '',
    },
    'pjevir22': {
      'ru': 'Обучение за рубежом',
      'kk': '',
    },
    'ciqcvg5j': {
      'ru': 'Работа за рубежом',
      'kk': '',
    },
    'gxmutb0w': {
      'ru': 'Акции',
      'kk': '',
    },
    '5ss4rw6x': {
      'ru': 'Служба поддержки',
      'kk': '',
    },
  },
  // WebNavLeftBottom
  {
    '7vv60e4f': {
      'ru': 'Играть',
      'kk': '',
    },
    '0eks2fu1': {
      'ru': 'Олимпиады',
      'kk': '',
    },
  },
  // headerSearch
  {
    'mzj68hos': {
      'ru': '',
      'kk': '',
    },
    'w35g62ny': {
      'ru': 'Поиск',
      'kk': '',
    },
    '85mhml0b': {
      'ru': 'KK',
      'kk': '',
    },
    '112t8rgv': {
      'ru': 'RU',
      'kk': '',
    },
    'mz9xtk6c': {
      'ru': 'Войти',
      'kk': '',
    },
    'lqsc1wbf': {
      'ru': 'Регистрация',
      'kk': '',
    },
    '4bzvcsgo': {
      'ru': 'Личный кабинет',
      'kk': '',
    },
    'v6mmmgy1': {
      'ru': 'Выход',
      'kk': '',
    },
  },
  // WebNavLeftTop
  {
    'bt3cm3rj': {
      'ru': 'Главная',
      'kk': '',
    },
    'yzyfc0ts': {
      'ru': 'Новости',
      'kk': '',
    },
    'f22hadz5': {
      'ru': 'Олимпиады',
      'kk': '',
    },
    'jo4da8ft': {
      'ru': 'Курсы',
      'kk': '',
    },
    'uv49dnpk': {
      'ru': 'Репетиторы',
      'kk': '',
    },
    'qyynwg14': {
      'ru': 'Онлайн-обучение',
      'kk': '',
    },
    'xs5yimgl': {
      'ru': 'Обучение за рубежом',
      'kk': '',
    },
    'w5mfu5qs': {
      'ru': 'Работа за рубежом',
      'kk': '',
    },
    'i6nn868s': {
      'ru': 'Акции',
      'kk': '',
    },
    'ds5lkvy9': {
      'ru': 'Служба поддержки',
      'kk': '',
    },
  },
  // WebNavLeft
  {
    'yq8c4gn1': {
      'ru': 'Главная',
      'kk': '',
    },
    'd6jwz0ky': {
      'ru': 'Новости',
      'kk': '',
    },
    'h9z3dw2n': {
      'ru': 'Олимпиада',
      'kk': '',
    },
    'zkd6m5u1': {
      'ru': 'Курсы',
      'kk': '',
    },
    'gj47291u': {
      'ru': 'Репетиторы',
      'kk': '',
    },
    'x4y16hv4': {
      'ru': 'Онлайн-обучение',
      'kk': '',
    },
    'hl9gndn4': {
      'ru': 'Обучение за рубежом',
      'kk': '',
    },
    'iy3pj0uw': {
      'ru': 'Работа за рубежом',
      'kk': '',
    },
    'b879jh8r': {
      'ru': 'Акции',
      'kk': '',
    },
    'i0krruly': {
      'ru': 'Служба поддержки',
      'kk': '',
    },
    'r85k2jwh': {
      'ru': 'Олимпиады',
      'kk': '',
    },
  },
  // Miscellaneous
  {
    '18p0mg5x': {
      'ru': '',
      'kk': '',
    },
    'p8b63234': {
      'ru': '',
      'kk': '',
    },
    'u4hwxiri': {
      'ru': '',
      'kk': '',
    },
    'qsa4hud1': {
      'ru': '',
      'kk': '',
    },
    'nq8vpft5': {
      'ru': '',
      'kk': '',
    },
    '0xxvr5yz': {
      'ru': '',
      'kk': '',
    },
    'i8tjyarf': {
      'ru': '',
      'kk': '',
    },
    'fm6rjtor': {
      'ru': '',
      'kk': '',
    },
    '5g1rbpfv': {
      'ru': '',
      'kk': '',
    },
    'fkijbits': {
      'ru': '',
      'kk': '',
    },
    'xz5hy3vt': {
      'ru': '',
      'kk': '',
    },
    '2avbvte1': {
      'ru': '',
      'kk': '',
    },
    'vu9ly1or': {
      'ru': '',
      'kk': '',
    },
    '11aq49qj': {
      'ru': '',
      'kk': '',
    },
    'jbsz6u8k': {
      'ru': '',
      'kk': '',
    },
    'rhab44er': {
      'ru': '',
      'kk': '',
    },
    'wbt4pys9': {
      'ru': '',
      'kk': '',
    },
    'x9d3deja': {
      'ru': '',
      'kk': '',
    },
    're6sxhyp': {
      'ru': '',
      'kk': '',
    },
    'u64ebs99': {
      'ru': '',
      'kk': '',
    },
    'f0db0uue': {
      'ru': '',
      'kk': '',
    },
    'g3uzge5w': {
      'ru': '',
      'kk': '',
    },
    '6d6201up': {
      'ru': '',
      'kk': '',
    },
    'lwu9b5ph': {
      'ru': '',
      'kk': '',
    },
    '7q6kt49h': {
      'ru': '',
      'kk': '',
    },
  },
].reduce((a, b) => a..addAll(b));
