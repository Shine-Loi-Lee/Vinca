import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vinca/app_assets/asset_icons.dart';
import 'package:vinca/app_assets/consts.dart';
import 'package:vinca/app_assets/fonts.dart';

class ShowVersion extends StatelessWidget {
  const ShowVersion({super.key});

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
            'version'.tr(),
            style: GoogleFontsInter.textStyle(
              color: const Color(0XFFA2DBEE),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05 * screenWidth),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 0.1 * screenHeight),
              SvgPicture.asset(
                AppIcons.vincaLogo,
                height: 0.1 * screenHeight,
                width: 0.1 * screenHeight,
              ),
              SizedBox(height: 0.03 * screenHeight),
              Text(
                '${'software'.tr()}: Vinca',
                style: GoogleFontsInter.textStyle(
                  fontSize: 0.02 * screenHeight,
                ),
              ),
              SizedBox(height: 0.008 * screenHeight),
              Text(
                '${'version'.tr()}: $currentVersion',
                style: GoogleFontsInter.textStyle(
                  fontSize: 0.02 * screenHeight,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
