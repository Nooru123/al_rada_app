




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upi_india/upi_india.dart';

import '../model/dlv_model.dart';
import '../view/customer/ctm_home.dart';
import '../view/customer/order_confirmed.dart';
import '../view/delivery_boy/dlv_home.dart';
import '../view/login.dart';
import '../view/sign_up.dart';
import '../view/signin_signup.dart';





class SplashPro with ChangeNotifier{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  DlvDtl? _userModel;
  DlvDtl get userModel => _userModel!;
  // var value;
  static const String keyLogin ='login';
  static  String value ='';
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();






  var name=TextEditingController();
  var email1=TextEditingController();
  var email=TextEditingController();
  var pass=TextEditingController();
  var pass1=TextEditingController();
  var conPass=TextEditingController();
  dynamic  userType;
  Future<void> movingToSignUp (context)async{
    var sharedPref= await SharedPreferences.getInstance();
     userType = sharedPref.getString(value);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(usertype: userType.toString(),)));


  }

  Future<void> movingToLogin (context)async{

    var sharedPref= await SharedPreferences.getInstance();
    userType = sharedPref.getString(value);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(usertype: userType.toString(),)));


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
      sharedPref.setBool(keyLogin,true);
      UserCredential userCredential =await firebaseAuth.createUserWithEmailAndPassword(email: userEmail, password: userPassword);
      final user =firebaseAuth.currentUser;
      user!.sendEmailVerification();
      await saveUser(userName, userEmail,collectionName);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success")));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login(usertype: userType.toString(),)));
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
  Future<void>login (String userEmail,String userPass,context)async{
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(keyLogin,true);
      try{
        await firebaseAuth.signInWithEmailAndPassword(email: userEmail, password: userPass);
        final user =firebaseAuth.currentUser;
        final emailVerified = user!.emailVerified;
        if(emailVerified==false){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please verified")));

        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DlvHome()));
        }

      }
      on FirebaseAuthException catch(e){
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(e.toString())));
      }
      catch(e){
        print(e);

      }

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
  Future<void> forgotPassword(String userEmail,context)async{
    try{
      await firebaseAuth.sendPasswordResetEmail(email: userEmail);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password reset email send check your inbox")));
    }
    on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(e.toString())));
    }
    catch(e){
      print(e);

    }
    notifyListeners();
  }


  Future whereToGo(context) async {
    var sharedPref= await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(keyLogin);
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
  ////////////////////////////////////////////////////////////////////////////

}
class PaymentPro with ChangeNotifier{
  Future<UpiResponse>? transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  void allUpi() {

    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {

      apps = value;
      notifyListeners();
    }).catchError((e) {
      apps = [];
    });


  }
  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "9078600498@ybl",
      receiverName: 'Md Azharuddin',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: 1.00,
    );
  }

  Widget displayUpiApps(context) {
    if (apps == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (apps!.isEmpty) {
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    } else{
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onLongPress: (){ transaction = initiateTransaction(app);},
                onTap: () {
                  Navigator.push(context , MaterialPageRoute(builder: (context)=>const OrderConfirmed()));

                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
  }
  }

  String upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
                body,
                style:GoogleFonts.poppins(),
              )),
        ],
      ),
    );
  }
}
