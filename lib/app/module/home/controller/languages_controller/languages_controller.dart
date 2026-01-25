import 'package:finance_management/app/data/dummy_data/language/ban_lang.dart';
import 'package:finance_management/app/data/dummy_data/language/en_lang.dart';
import 'package:get/get.dart';

class LanguagesController extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en_US": EnglshLanguage().language,
    "bn_BD": BanglaLanguage().language,
  };
}
