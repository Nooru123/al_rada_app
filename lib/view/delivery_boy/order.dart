import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'account.dart';
import 'notifications.dart';
class OrderPage extends StatelessWidget {
const OrderPage({super.key});

@override
Widget build(BuildContext context) {
  double height= MediaQuery.of(context).size.height ;
  double width= MediaQuery.of(context).size.width ;
return  Scaffold(
  appBar: AppBar(
    automaticallyImplyLeading:false,

    backgroundColor: const Color.fromRGBO(111, 31, 40, 1),
    title: Text("Order",style: GoogleFonts.poppins(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.w500,color: Colors.white),),

    actions: [
      IconButton( onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Notifications()));

      }, icon: Icon(CupertinoIcons.bell_circle_fill,color: HexColor("#000000"),size: 30,),),
      IconButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Account()));

      }, icon: Icon(CupertinoIcons.person_circle_fill,color: HexColor("#000000"),size: 30, ),),
      SizedBox(
        height: height/50,
        width: width/30,
      ),
    ],
  ),
  body: Padding(
    padding:  EdgeInsets.symmetric(horizontal: width/50),
    child: ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height:height/80,),
        itemCount: 3,
        padding: EdgeInsets.symmetric(vertical: width/50),
        itemBuilder: (context,index){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: width/50,vertical: width/50),
        height: height/4.5,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Wrap(
                   spacing:height/600,
                  children: [
                    Text("Order No:",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500, ),),

                    Text("#001",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500, ),),

                  ],
                ),

                Text("5 min ago",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500,color:const Color.fromRGBO(111, 31, 40, 1) ),),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: height/51.6,
            ),
            Text("Tirur-2",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500, ),),
            Text("mattummal complex",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500, ),),
            SizedBox(
              height: height/70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w600, ),),
                Text("Paid\t\t\t\t\t\t",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w600, ),),
              ],
            ),
            SizedBox(
              height: height/30,
            ),
            const Divider(
              color: Colors.grey,
            )

          ],


        ),

      );
    }),
  ),

);
}
}