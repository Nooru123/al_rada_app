import 'package:ai_rida/view/customer/ctm_home.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
class OrderConfirmed extends StatelessWidget {
  const OrderConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(MediaQuery.of(context).size.height/4),
            Icon(TeenyIcons.tick,size: MediaQuery.of(context).size.height/30,),
            Text("Order Confirmed",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.height/30),),
            Text("Thank you for you order",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.height/50),),
            Gap(MediaQuery.of(context).size.height/4),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CtmHome()));
            }, child: Text("Continue",style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.height/40),))
          ],
        ),
      ),
    );
  }
}
