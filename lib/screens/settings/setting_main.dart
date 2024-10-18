import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vinca/app_assets/fonts.dart';
import 'package:vinca/app_assets/widgets/custome_navigator.dart';
import 'package:vinca/screens/settings/setting_language.dart';
import 'package:vinca/screens/settings/version.dart';

class SettingMain extends StatelessWidget {
  const SettingMain({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'settings'.tr(),
            style: GoogleFontsInter.textStyle(
              color: const Color(0XFFA2DBEE),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05 * screenWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 0.05 * screenHeight),
            buildTitle(
              title: 'settings'.tr(),
              screenHeight: screenHeight,
            ),
            buildSettingTile(
              title: 'language'.tr(),
              icon: Icons.language,
              screenHeight: screenHeight,
              onTap: () {
                pushNavigator(context: context, page: const SettingLanguage());
              },
            ),
            // buildSettingTile(
            //   title: 'themes'.tr(),
            //   icon: Icons.brightness_6,
            //   screenHeight: screenHeight,
            //   onTap: () {
            //     // todo: Make a next page
            //     //pushNavigator(context: context, page: const VincaHomeScreen());
            //   },
            // ),
            SizedBox(height: 0.05 * screenHeight),
            buildTitle(
              title: 'help_n_support'.tr(),
              screenHeight: screenHeight,
            ),
            buildSettingTile(
              title: 'user_guide'.tr(),
              icon: Icons.menu_book,
              screenHeight: screenHeight,
              onTap: () {
                // todo: Make a next page
                //pushNavigator(context: context, page: const VincaHomeScreen());
              },
            ),
            buildSettingTile(
              title: 'faqs'.tr(),
              icon: Icons.help_outline,
              screenHeight: screenHeight,
              onTap: () {
                // todo: Make a next page
                //pushNavigator(context: context, page: const VincaHomeScreen());
              },
            ),
            buildSettingTile(
              title: 'feedback'.tr(),
              icon: Icons.feedback,
              screenHeight: screenHeight,
              onTap: () {
                // todo: Make a next page
                //pushNavigator(context: context, page: const VincaHomeScreen());
              },
            ),
            SizedBox(height: 0.05 * screenHeight),
            buildTitle(
              title: 'about_the_app'.tr(),
              screenHeight: screenHeight,
            ),
            buildSettingTile(
              title: 'software'.tr(),
              icon: Icons.info_outline,
              screenHeight: screenHeight,
              onTap: () {
                pushNavigator(context: context, page: const ShowVersion());
              },
            ),
            buildSettingTile(
              title: 'license'.tr(),
              icon: Icons.article,
              screenHeight: screenHeight,
              onTap: () {
                // todo: Make a next page
                //pushNavigator(context: context, page: const VincaHomeScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle({
    required String title,
    required double screenHeight,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.01 * screenHeight),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: GoogleFontsInter.textStyle(
          color: Colors.black,
          fontSize: 0.023 * screenHeight,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildSettingTile({
    required VoidCallback onTap,
    required IconData icon,
    required String title,
    required double screenHeight,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.02 * screenHeight),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 0.012 * screenHeight),
            Text(
              title,
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
