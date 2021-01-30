import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseLanguageExampleScreen extends StatefulWidget {
  @override
  _ChooseLanguageExampleScreenState createState() =>
      _ChooseLanguageExampleScreenState();
}

class _ChooseLanguageExampleScreenState
    extends State<ChooseLanguageExampleScreen> {
  List<AppLanguage> supportLanguages = [
    AppLanguage('English', Locale('en', 'EN'),
        'resources/svg/united-kingdom_circle_512.svg'),
    AppLanguage(
        'မြန်မာ', Locale('my', 'MM'), 'resources/svg/myanmar_circle_512.svg'),
    AppLanguage('中国', Locale('zh', 'CN'), 'resources/svg/china_circle_512.svg'),
  ];

  void changeLanguage(Locale locale) {
    EasyLocalization.of(context).locale = locale;
  }

  @override
  Widget build(BuildContext context) {
    Locale currentLanguageLocale = context.locale;
    debugPrint(currentLanguageLocale.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('languages'.tr()),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: supportLanguages.length,
        itemBuilder: (context, index) {
          AppLanguage language = supportLanguages[index];
          return ListTile(
            leading: SvgPicture.asset(
              language.languageImage,
              width: 40,
              height: 40,
            ),
            title: Text(language.languageName),
            trailing: Radio(
              value: language.locale,
              groupValue: currentLanguageLocale,
              onChanged: (Locale locale) {
                print(locale.toString());
                changeLanguage(locale);
              },
            ),
            onTap: (){
              changeLanguage(language.locale);
            },
          );
        },
      ),
    );
  }
}

class AppLanguage {
  final String languageName;
  final Locale locale;
  final String languageImage;

  AppLanguage(this.languageName, this.locale, this.languageImage);
}
