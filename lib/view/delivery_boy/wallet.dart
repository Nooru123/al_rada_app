import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'account.dart';
import 'notifications.dart';
class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height ;
    double width= MediaQuery.of(context).size.width ;
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,

        backgroundColor: const Color.fromRGBO(111, 31, 40, 1),
        title: Text("Wallet",style: GoogleFonts.poppins(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.w500,color: Colors.white),),

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
        padding:  EdgeInsets.symmetric(horizontal: width/30,vertical: height/14),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width/40,vertical: height/70),
          height: height/2.5,
          width: width,
          decoration:  BoxDecoration(
            color: const Color.fromRGBO(111, 31, 40, 1) ,
            borderRadius: BorderRadius.circular(12),

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Earnings",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: height/16),
                    height: height/4,
                    width: width/2.5,
                    decoration:  BoxDecoration(
                      color: Colors.white ,
                      borderRadius: BorderRadius.circular(12),

                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Orders",style: GoogleFonts.poppins(fontSize:  18,fontWeight: FontWeight.w500,color: HexColor("#911E2B")),),
                       Text("25",style: GoogleFonts.poppins(fontSize: 30,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: height/16),
                    height: height/4,
                    width: width/2.5,
                    decoration:  BoxDecoration(
                      color: Colors.white ,
                      borderRadius: BorderRadius.circular(12),

                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Amount",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: HexColor("#911E2B")),),
                       Text("1000",style: GoogleFonts.poppins(fontSize: 30,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: height/20,
                width: width,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12)),
                child: Text("Reset",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
