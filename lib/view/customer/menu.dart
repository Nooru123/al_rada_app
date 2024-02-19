import 'package:ai_rida/view/customer/breads.dart';
import 'package:ai_rida/view/customer/drinks.dart';
import 'package:ai_rida/view/customer/sides.dart';
import 'package:ai_rida/view/customer/special_offer.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../delivery_boy/dlv_home_tab_view.dart';
class Menu extends StatelessWidget {
  const Menu({super.key});

  

  @override
  Widget build(BuildContext context) {
 

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return   DefaultTabController(
      length: 4,
      child: Scaffold(
      
        body:Column(
          children: [
            Container(
                height: height/20,
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child:  TabBar(
                indicator: const BubbleTabIndicator(
                indicatorColor: Colors.red
                ),
                labelColor: const Color.fromRGBO(111, 31, 40, 1),
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.white,
                dividerColor: Colors.transparent,

                tabs: [
                Tab( child: Text("Special offer",style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w500),),),
                Tab( child: Text("Sides",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500),),),
                  Tab( child: Text("Breads",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500),),),
                  Tab( child: Text("Drinks",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500),),),

                  ]),
            ),
            SizedBox(
              height: height/1.32689,
              child: TabBarView(children: [
                SpecialOffer(),
                Sides(),
                Breads(),
                Drinks(),

              ]),
            ),



          ],
        ),
      
      
      ),
    );
  }
}
