import 'package:flutter/cupertino.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../controller/dlv_home_controller.dart';

class DlvHome extends StatelessWidget {
  const DlvHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navi = Provider.of<DlvPro>(
      context,
    );

    return Scaffold(
      body: navi.pages[navi.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        iconSize: 25,
        selectedIconTheme: const IconThemeData(size: 33),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        showUnselectedLabels: true,
        currentIndex: navi.selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home_outlined,
            ),
            backgroundColor: HexColor("911E2B"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.fastfood_outlined,
              ),
              backgroundColor: HexColor("911E2B"),
              label: 'Order'),
          BottomNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.timer,
              ),
              backgroundColor: HexColor("911E2B"),
              label: 'Progress'),
          BottomNavigationBarItem(
              icon: const Icon(
                Bootstrap.cart,
              ),
              backgroundColor: HexColor("911E2B"),
              label: 'Delivered'),
          BottomNavigationBarItem(
              icon: const Icon(
                Clarity.wallet_line,
              ),
              backgroundColor: HexColor("911E2B"),
              label: 'Wallet'),
        ],
        onTap: (index) {
          navi.switchToNext(index);
        },
      ),
    );
  }
}
