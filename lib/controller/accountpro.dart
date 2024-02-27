import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../model/dlv_model.dart';


class BackendProvider with ChangeNotifier {
  File? image1;
  final ImagePicker picker = ImagePicker();
  TextEditingController fetchName = TextEditingController();
  TextEditingController fetchEmil = TextEditingController();
  TextEditingController fetchPass = TextEditingController();
  TextEditingController fetchMobile = TextEditingController();
  TextEditingController fetchAddress = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  DlvDtl? _userModel;
  DlvDtl get userModel => _userModel!;
  String? _uid;
  String get uid => _uid!;
  Future<void> getImage() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);


    image1 = File(pickedFile!.path);

    notifyListeners();
  }
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
      SettableMetadata metadata=SettableMetadata(contentType: "image/jpeg");
      UploadTask uploadTask = reference.putFile(image,metadata );
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