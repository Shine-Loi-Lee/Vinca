import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vinca/app_assets/fonts.dart';

class SettingLanguage extends ConsumerStatefulWidget {
  const SettingLanguage({super.key});

  @override
  SettingLanguageState createState() => SettingLanguageState();
}

class SettingLanguageState extends ConsumerState<SettingLanguage> {
  Locale? selectedLocale;

  @override
  Widget build(BuildContext context) {
    selectedLocale ??= context.locale;

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'language'.tr(),
              style: GoogleFontsInter.textStyle(
                color: const Color(0XFFA2DBEE),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05 * screenWidth),
          child: Column(
            children: [
              SizedBox(height: 0.05 * screenHeight),
              _buildListTitle(
                lang: 'english'.tr(),
                locale: const Locale('en', 'US'),
                isSelected: selectedLocale == const Locale('en', 'US'),
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              _buildListTitle(
                lang: 'korean'.tr(),
                locale: const Locale('ko', 'KO'),
                isSelected: selectedLocale == const Locale('ko', 'KO'),
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              _buildListTitle(
                lang: 'japanese'.tr(),
                locale: const Locale('ja', 'JA'),
                isSelected: selectedLocale == const Locale('ja', 'JA'),
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              _buildListTitle(
                lang: 'russian'.tr(),
                locale: const Locale('ru', 'RU'),
                isSelected: selectedLocale == const Locale('ru', 'RU'),
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
            ],
          ),
        )));
  }

  Widget _buildListTitle({
    required String lang,
    required Locale locale,
    required bool isSelected,
    required double screenHeight,
    required double screenWidth,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedLocale = locale;
        });
        context.setLocale(locale);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.02 * screenWidth),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons
                      .radio_button_unchecked, // Show selected/unselected state
              size: 0.029 * screenHeight,
              color: isSelected
                  ? const Color(0XFFA2DBEE)
                  : Colors.grey, // Highlight if selected
            ),
            SizedBox(width: 0.025 * screenWidth),
            Text(
              lang,
              style: GoogleFontsInter.textStyle(
                fontSize: 0.018 * screenHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
