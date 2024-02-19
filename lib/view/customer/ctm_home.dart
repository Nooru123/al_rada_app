import 'package:ai_rida/view/customer/search_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../../controller/ctm_Controller.dart';
import 'card.dart';

class CtmHome extends StatelessWidget {
  const CtmHome({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final customer = Provider.of<CtmPro>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(customer.pages[customer.selectedIndex]["name"]),
        backgroundColor: const Color.fromRGBO(111, 31, 40, 1),
        actions: [
          IconButton(
            onPressed: ( ) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchPage()));

            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
          ),

          IconButton(
            onPressed: ( ) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CardPage()));


            },
            icon: const Icon(
              Icons.food_bank_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
          Gap(

             width / 30,
          ),
        ],
      ),
      body: customer.pages[customer.selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        iconSize: 25,
        selectedIconTheme: const IconThemeData(size: 33),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        backgroundColor: HexColor("#911E2B"),
        showUnselectedLabels: true,
        currentIndex: customer.selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              EvaIcons.home,
            ),
            backgroundColor: HexColor("#911E2B"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.fastfood_outlined,
              ),
              backgroundColor: HexColor("#911E2B"),
              label: 'Order'),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.person,
              ),
              backgroundColor: HexColor("911E2B"),
              label: 'Progress'),
        ],
        onTap: (index) {
          customer.going(index);
        },
      ),
    );
  }
}
