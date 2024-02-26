import 'dart:io';

import 'package:ai_rida/view/delivery_boy/order.dart';
import 'package:ai_rida/view/delivery_boy/progress.dart';
import 'package:ai_rida/view/delivery_boy/wallet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../model/dlv_model.dart';
import '../view/delivery_boy/delivered.dart';
import '../view/delivery_boy/home.dart';

class DlvPro with ChangeNotifier {
  var selectedIndex = 0;
  List pages = [
    const Home(),
    const OrderPage(),
    const Progress(),
    const Delivered(),
    const Wallet(),
  ];
  void switchToNext(index) {
    selectedIndex = index;
    notifyListeners();
  }
}

class HomePro with ChangeNotifier {
  bool isOn = false;
  Future<void> offline(value) async {
    isOn = value;
    notifyListeners();
  }
}
class BackendProvider with ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  DlvDtl? _userModel;
  DlvDtl get userModel => _userModel!;
  String? _uid;
  String get uid => _uid!;
  Future<void>fetchUserData()async{
    try{
      await firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).get().then((DocumentSnapshot snapshot) {
        _userModel = DlvDtl(userId: snapshot['userId'], userName: snapshot['userName'], userEmail: snapshot['userEmail']);
        _uid =userModel.userId;
      });

    }
    catch(e){
      print(e);

    }
  }
  Future<void> editProfile(String userName, String password, String userEmail, File image, String address, String mobileNumber, context) async {
    try {
      String imageUrl = await uploadImage(image); // Upload image to Firebase Storage
      await firebaseFirestore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .update({
        "userName": userName,
        "Password": password,
        "Email": userEmail,
        "Address": address,
        "MobileNumber": mobileNumber, // Save image URL to Firestore
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Profile updated successfully")));
    } catch (e) {
      print('Error editing profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to update profile")));
    }
  }
  Future<String> uploadImage( image) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
      FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = reference.putFile(image );
      TaskSnapshot storageTaskSnapshot = await uploadTask;
      String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      print(downloadUrl);
      await firebaseFirestore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .update({

        'imageUrl': downloadUrl, // Save image URL to Firestore
      });
      return downloadUrl;
    } catch (e) {
      print('error uploading image:$e');
      return '';
    }
  }

}