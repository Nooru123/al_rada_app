import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icons_plus/icons_plus.dart';

import 'account2.dart';
import 'ctm_home.dart';
class Orders2 extends StatelessWidget {
  const Orders2({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CtmHome()));
        }, icon: const Icon(Icons.arrow_back_ios_sharp),),
        backgroundColor: HexColor("#911E2B"),
        title: Text("Order",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width/30),
        child: Column(
          children: [
            SizedBox(
              height: height/33
              ,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width/20),
              height: height/15,


              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),color: Colors.grey,
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Orders is placed',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
                  Icon(Iconsax.tick_circle_outline,color: Colors.green,size: height/20,)
                ],
              ) ,

            )
          ],
        ),
      ),
    );
  }
}