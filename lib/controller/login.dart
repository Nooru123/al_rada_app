

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/dlv_model.dart';
import '../view/customer/ctm_home.dart';
import '../view/delivery_boy/dlv_home.dart';
import '../view/delivery_boy/login_page2.dart';
import '../view/delivery_boy/sign_up2.dart';
import '../view/signin_signup.dart';
import 'backend.dart';




class SplashPro with ChangeNotifier{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  DlvDtl? _userModel;
  DlvDtl get userModel => _userModel!;
  // var value;
  static const String keylogin ='login';
  static  String value ='';
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();





  BackendServices backendServices =BackendServices();
  var name=TextEditingController();
  var email1=TextEditingController();
  var email=TextEditingController();
  var pass=TextEditingController();
  var pass1=TextEditingController();
  var conPass=TextEditingController();
  var  userType;
  Future<void> fly (context)async{
    var sharedPref= await SharedPreferences.getInstance();
     userType = sharedPref.getString(value);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp2(usertype: userType.toString(),)));


  }

  Future<void> fly1 (context)async{

    var sharedPref= await SharedPreferences.getInstance();
    userType = sharedPref.getString(value);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage2(usertype: userType.toString(),)));


  }
  Future<void> saveUser( String username, String userEmail,String collectionName) async {
    final userDoc=  firebaseFirestore
        .collection(collectionName)
        .doc();
    _userModel = DlvDtl(userId: userDoc.id, userEmail: userEmail, userName: username);
    await userDoc
        .set(_userModel!.toMap());
  }
  Future<void>signUp(String userName,String userPassword,String userEmail,context,String collectionName, )async{
    try{
      var sharedPref = await SharedPreferences.getInstance();
      sharedPref.setBool(keylogin,true);
      UserCredential userCredential =await firebaseAuth.createUserWithEmailAndPassword(email: userEmail, password: userPassword);
      final user =firebaseAuth.currentUser;
      user!.sendEmailVerification();
      await saveUser(userName, userEmail,collectionName);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success")));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage2(usertype: userType.toString(),)));
      notifyListeners();


    }catch(e){
      print(e);
    }
    // var sharedPref = await SharedPreferences.getInstance();
    // sharedPref.setBool(keylogin,true);
    // backendServices.signUp(name.text, pass.text, email.text, context,collectionName);
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage2(usertype: userType.toString(),)));
    // notifyListeners();
  }
  void back (context)async{
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(keylogin,true);
    backendServices.lognin(email1.text, pass1.text,  context);
    notifyListeners();
  }

  // void removeValues() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   prefs.remove(keylogin);
  //
  //
  // }

  // void going (context)async{
  //
  //
  //   var sharedPref = await SharedPreferences.getInstance();
  //
  //   sharedPref.setString(SplashPro.self,"costumer");
  //   notifyListeners();
  // }
  // void went (context)async{
  //
  //
  //   var sharedPref = await SharedPreferences.getInstance();
  //   sharedPref.setString(SplashPro.self,"delivery_boy");
  //   notifyListeners();
  // }


  Future whereToGo(context) async {
    var sharedPref= await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(keylogin);
    Future.delayed (const Duration(seconds: 4),() {


      if (isLoggedIn != null) {
        if (isLoggedIn) {
          if (value=="costumer"){
            Navigator.pushReplacement(context ,
                MaterialPageRoute(builder: (context) =>const CtmHome()));
          }else{
            Navigator.pushReplacement(context ,
                MaterialPageRoute(builder: (context) =>const DlvHome()));
          }
          //home page name
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) =>const SignInSignUp()));
        }
      } else {
        Navigator.pushReplacement(context  ,
            MaterialPageRoute(builder: (context) =>const SignInSignUp()));
      }
      notifyListeners();
    }



    );
  }
}

