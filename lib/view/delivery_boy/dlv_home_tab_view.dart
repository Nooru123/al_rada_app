import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DlvHomeTabView extends StatelessWidget {
  const DlvHomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height ;
    double width= MediaQuery.of(context).size.width ;
    return  Scaffold(
      backgroundColor: const Color.fromRGBO(111, 31, 40, 1),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width/15),
            height:height/10 ,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Orders",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20,color: const Color.fromRGBO(111, 31, 40, 1) ),),
                Text("10",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
              ],
            ),
          ),
          SizedBox(
            height: height/60,
            width: width,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width/19),
            height:height/10 ,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Earnings",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20,color: const Color.fromRGBO(111, 31, 40, 1) ),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("10",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
                    Text("rupee",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: height/60,
            width: width,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width/15),
            height:height/10 ,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Login Hours ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20,color: const Color.fromRGBO(111, 31, 40, 1) ),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text("10",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
                    Text("hrs",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
