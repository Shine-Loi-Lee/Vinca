import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vinca/app_assets/asset_icons.dart';
import 'package:vinca/app_assets/fonts.dart';
import 'package:vinca/app_assets/widgets/custom_appbar.dart';
import 'package:vinca/screens/get_maps.dart';

class VincaHomeScreen extends StatefulWidget {
  const VincaHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VincaHomeScreenState createState() => _VincaHomeScreenState();
}

class _VincaHomeScreenState extends State<VincaHomeScreen> {
  List<String> editedPhotos = []; // 편집 중인 사진 목록
  String? selectedPhoto; // 선택된 사진
  String? selectedTitle; // 선택된 사진의 제목

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const VincaAppBar(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 0.094 * screenHeight),
              Container(
                width: 0.365 * screenHeight,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Text(
                      selectedPhoto != null
                          ? 'Title: $selectedTitle'
                          : 'no_photo_selected'.tr(),
                      style: GoogleFontsInter.textStyle(
                        color: const Color(0XFFA2DBEE),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: null,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),

              ///////////////////////////////////////////////// ToDo: Make functions
              // Preview of selected photo
              Expanded(
                child: selectedPhoto == null && editedPhotos.isEmpty
                    ? Center(
                        // If there is no selected photo, show the Vinca logo
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.vincaLogo,
                              width: 0.114 * screenHeight,
                              height: 0.114 * screenHeight,
                            ),
                            const SizedBox(height: 20),
                            Text('Vinca Logo',
                                style: GoogleFontsInter.textStyle()),
                          ],
                        ),
                      )
                    : PageView.builder(
                        // Else display the preview of the selected photo
                        scrollDirection: Axis.horizontal,
                        itemCount: editedPhotos.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Image.asset(
                              editedPhotos[index],
                              fit: BoxFit.contain,
                              width: 300,
                              height: 300,
                            ),
                          );
                        },
                        onPageChanged: (index) {
                          setState(() {
                            selectedPhoto = editedPhotos[index];
                            selectedTitle = 'Photo ${index + 1}';
                          });
                        },
                      ),
              ),
              // Scrollable list of edited photos
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: editedPhotos.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPhoto = editedPhotos[index];
                          selectedTitle = 'Photo ${index + 1}';
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          editedPhotos[index],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              //////////////////////////////////////////////////
            ],
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GetMaps()),
                  );
                },
                child: SvgPicture.asset(
                  AppIcons.addButton,
                  width: 0.069 * screenHeight,
                  height: 0.069 * screenHeight,
                )),
          ),
        ],
      ),
    );
  }
}
