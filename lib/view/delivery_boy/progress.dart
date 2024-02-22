import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'account.dart';
import 'notifications.dart';
class Progress extends StatelessWidget {
const Progress({super.key});

@override
Widget build(BuildContext context) {
  double height= MediaQuery.of(context).size.height ;
  double width= MediaQuery.of(context).size.width ;
return  Scaffold(
  appBar: AppBar(
    automaticallyImplyLeading:false,

    backgroundColor: const Color.fromRGBO(111, 31, 40, 1),
    title: Text("Progress",style: GoogleFonts.poppins(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.w500,color: Colors.white),),

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
  body: Column(
    children: [
      Gap(MediaQuery.of(context).size.height/50),
      Container(
        height: MediaQuery.of(context).size.height/4,
        width:MediaQuery.of(context).size.width ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
        child:  const GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(10.975535, 76.230531),zoom: 12,),),
      )
    ],
  ),

);
}
}