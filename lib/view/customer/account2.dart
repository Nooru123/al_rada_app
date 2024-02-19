import 'package:ai_rida/view/customer/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../controller/ctm_Controller.dart';
import 'favarite.dart';
import 'order2.dart';
// import 'package:nooru_project/profile.dart';

// import 'Orders2.dart';
// import 'controller.dart';
// import 'favorite.dart';
class Account2 extends StatelessWidget {
  const Account2({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width/30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Account and Settings",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600),),
            SizedBox(
              height: height/26
              ,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width/3),
              child: Container(
                height: height/8,
                width: width/4,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),color: Colors.grey.shade300,
                ),
              ),
            ),
            SizedBox(
              height: height/20
              ,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width/30),
              height: height/18,


              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),color: Colors.grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.person),
                  Text("Profile",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 15),),
                  SizedBox(
                    height: height/27,
                    width: width/2,
                  ),
                  IconButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Profile()));

                  }, icon:  Icon(Icons.arrow_forward_ios_outlined,size: height/30,color: Colors.deepOrange.shade900,))
                ],
              ),
            ),
            SizedBox(
              height: height/33
              ,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width/30),
              height: height/18,


              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),color: Colors.grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Clarity.cursor_hand_click_line),
                  Text("Orders",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 15),),
                  SizedBox(
                    height: height/27,
                    width: width/2,
                  ),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Orders2()));
                  }, icon:  Icon(Icons.arrow_forward_ios_outlined,size: height/30,color: Colors.deepOrange.shade900,))
                ],
              ),
            ),
            SizedBox(
              height: height/33
              ,
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: width/30),
              height: height/18,


              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),color: Colors.grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Bootstrap.shop),
                  Text("Show your Cart",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 15),),
                  SizedBox(
                    height: height/27,
                    width: width/3.5,
                  ),
                  IconButton(onPressed: (){}, icon:  Icon(Icons.arrow_forward_ios_outlined,size: height/30,color: Colors.deepOrange.shade900,))
                ],
              ),
            ),
            SizedBox(
              height: height/33
              ,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width/30),
              height: height/18,


              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),color: Colors.grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite_border_outlined),
                  Text("Favorite",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 15),),
                  SizedBox(
                    height: height/27,
                    width: width/2.3,
                  ),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Favorite()));
                  }, icon:  Icon(Icons.arrow_forward_ios_outlined,size: height/30,color: Colors.deepOrange.shade900,))
                ],
              ),
            ),
            SizedBox(
              height: height/33
              ,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width/30),
              height: height/18,


              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),color: Colors.grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    const Icon(MingCute.exit_line),
                  Text("Sign Out",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 15),),
                  SizedBox(
                    height: height/27,
                    width: width/2.3,
                  ),
                  IconButton(onPressed: (){
                    showAlertDialog(context);

                  }, icon:  Icon(Icons.arrow_forward_ios_outlined,size: height/30,color: Colors.deepOrange.shade900,))
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}