// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vinca/app_assets/asset_icons.dart';
import 'package:vinca/screens/settings/setting_main.dart';

class VincaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const VincaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(0.009 * screenHeight),
            child: SvgPicture.asset(
              AppIcons.vincaLogo,
              width: 0.029 * screenHeight,
              height: 0.029 * screenHeight,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Color(0XFFA2DBEE),
            ),
            iconSize: 0.029 * screenHeight,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingMain()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    final double screenHeight =
        WidgetsBinding.instance.window.physicalSize.height /
            WidgetsBinding.instance.window.devicePixelRatio;
    return Size.fromHeight(screenHeight * 0.08);
  }
}
