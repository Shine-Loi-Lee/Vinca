import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vinca/app_assets/fonts.dart';

class PhotoEditPage extends StatefulWidget {
  final LatLng position;

  const PhotoEditPage({super.key, required this.position});

  @override
  PhotoEditPageState createState() => PhotoEditPageState();
}

class PhotoEditPageState extends State<PhotoEditPage> {
  XFile? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      setState(() {
        _pickedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'photo_edit'.tr(),
          style: GoogleFontsInter.textStyle(
            color: const Color(0xFFA2DBEE),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(0.05 * screenHeight),
        child: Column(
          children: [
            SizedBox(height: 0.05 * screenHeight),
            Text(
              'Selected Location: ${widget.position.latitude}, ${widget.position.longitude}',
              style: GoogleFontsInter.textStyle(
                fontSize: 0.02 * screenHeight,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _pickedImage == null
                ? ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Upload Photo'.tr()),
                  )
                : Image.file(
                    File(_pickedImage!.path),
                    height: 200,
                  ),
          ],
        ),
      ),
    );
  }
}
