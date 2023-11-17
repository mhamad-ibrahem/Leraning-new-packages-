import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../screens/system/model/days_model.dart';

class SystemController extends GetxController {
  FilePickerResult? filePicker;
  List<File> files = [];
  List<CroppedFile> croppedFiles = [];
  final List<DayModel> days = [
    DayModel(name: 'Sun Day', money: 200, isSelected: true),
    DayModel(name: 'Mon Day', money: 150),
    DayModel(name: 'Tues Day', money: 140),
    DayModel(name: 'Wednes Day', money: 160),
    DayModel(name: 'Thurs Day', money: 110),
    DayModel(name: 'Fri Day', money: 190),
    DayModel(name: 'Satur Day', money: 120),
  ];
  late DayModel selectedChart;
  cropImage(BuildContext context, File file) async {
    ImageCropper imageCropper = ImageCropper();
    dynamic croppeFiles = await imageCropper.cropImage(
      sourcePath: file.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    croppedFiles.add(croppeFiles);
    update();
  }

  chooseFile() async {
    filePicker = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
      // allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    if (filePicker != null) {
      files = filePicker!.paths.map((path) => File(path!)).toList();
      files.forEach((element) {
        log("${element.path}");
        update();
      });
    } else {
      // User canceled the picker
    }
  }

  changeSelectedChart(DayModel chart) {
    selectedChart = chart;
    update();
  }

  @override
  void onInit() {
    selectedChart = days[0];
    super.onInit();
  }
}
