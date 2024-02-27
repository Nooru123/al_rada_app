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
