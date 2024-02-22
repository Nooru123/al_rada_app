import 'package:ai_rida/view/customer/account2.dart';
import 'package:ai_rida/view/customer/home2.dart';
import 'package:ai_rida/view/customer/menu.dart';
import 'package:ai_rida/view/splash_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class CtmPro with ChangeNotifier {
  var selectedIndex = 0;
  var textController=TextEditingController();
  List<Map<dynamic,dynamic>> pages = [
    {

      "page": const Home2(),
      "name": "Home"
    },
    {

      "page": const Menu(),
      "name": "Menu"
    },
    {

      "page": const Account2(),
      "name": "Account"
    },



  ];
  void going(index) {
    selectedIndex = index;
    notifyListeners();
  }
  List<String>searchList=[
    "French Fries",
    "Coleslaw",
    "Hummus",
    "Ketchup",
    "Bun",
    "Kuboos",
    "Garlic Bread",
    "Butter Bread",
    "Coca Cola",
    "Mockup Can",
    "Lemonade",
    "Xtreme Soda",
  ];
  TextEditingController searchController=TextEditingController();
  String value = "";
  void searchBar(){
    value=searchController.toString();
notifyListeners();
  }
}
void showAlertDialog(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.question,
    animType: AnimType.bottomSlide,
    title: 'Confirm to sign Out',

    btnCancelOnPress: () {},
    btnOkOnPress: ()async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
       await prefs.clear();
       await prefs.remove(SplashPro.keyLogin);
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SplashScreen()));

      // void removeValues() async {
      //   SharedPreferences prefs = await SharedPreferences.getInstance();
      //
      //   prefs.remove(SplashPro.keylogin);
      //
      //
      // }

    },
  ).show();
}
