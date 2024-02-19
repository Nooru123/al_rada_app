import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AccountPro with ChangeNotifier {
  File? image1;
  final ImagePicker picker = ImagePicker();
  Future<void> getImage() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);


      image1 = File(pickedFile!.path);

    notifyListeners();
  }

}
