
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
