import 'package:ai_rida/view/delivery_boy/order.dart';
import 'package:ai_rida/view/delivery_boy/progress.dart';
import 'package:ai_rida/view/delivery_boy/wallet.dart';
import 'package:flutter/material.dart';

import '../view/delivery_boy/delivered.dart';
import '../view/delivery_boy/home.dart';

class DlvPro with ChangeNotifier {
  var selectedIndex = 0;
  List pages = [
    const Home(),
    const Order(),
    const Progress(),
    const Delivered(),
    const Wallet(),
  ];
  void going(index) {
    selectedIndex = index;
    notifyListeners();
  }
}

class HomePro with ChangeNotifier {
  bool isOn = false;
  Future<void> see(value) async {
    isOn = value;
    notifyListeners();
  }
}
