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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(111, 31, 40, 1),
        title: Text(
          "Progress",
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Notifications()));
            },
            icon: Icon(
              CupertinoIcons.bell_circle_fill,
              color: HexColor("#000000"),
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Account()));
            },
            icon: Icon(
              CupertinoIcons.person_circle_fill,
              color: HexColor("#000000"),
              size: 30,
            ),
          ),
          SizedBox(
            height: height / 50,
            width: width / 30,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(width / 50),
        child: Container(
          padding: EdgeInsets.all(width / 50),
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order No:#001',style: GoogleFonts.poppins(fontSize: height/35,fontWeight: FontWeight.w500),),
                  Text('5 min ago',style: GoogleFonts.poppins(fontSize: height/35,fontWeight: FontWeight.w500),),
                ],
              ),
              const Divider(),
              SizedBox(
                height: height / 7,
                child: Text("""Tirur-2
mattummal complex
flat no:121
customer name:Shanin
contact no:9526718126""",style: GoogleFonts.poppins(fontSize: height/50,),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width/40),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ordered item:",style: GoogleFonts.poppins(fontSize: height/40,fontWeight: FontWeight.w500),),
                    Table(defaultColumnWidth:FixedColumnWidth(width/2.9),
                      children: [
                        TableRow(
                          children: [
                            Text("No",style: GoogleFonts.poppins(fontSize: height/50),),
                            Text("Item",style: GoogleFonts.poppins(fontSize: height/50),),
                            Text("amount",style: GoogleFonts.poppins(fontSize: height/50),),
                          ]
                        ),
                        TableRow(
                          children: [
                            Text("1",style: GoogleFonts.poppins(fontSize: height/50),),
                            Text("Fried combo",style: GoogleFonts.poppins(fontSize: height/50),),
                            Text("459.0",style: GoogleFonts.poppins(fontSize: height/50),),
                          ]
                        ),
                        TableRow(
                          children: [
                            Text("2",style: GoogleFonts.poppins(fontSize: height/50),),
                            Text("Bun",style: GoogleFonts.poppins(fontSize: height/50),),
                            Text("8.0",style: GoogleFonts.poppins(fontSize: height/50),),
                          ],
                        ),
                      ],
                    ),
                    Gap(height/50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",style: GoogleFonts.poppins(fontSize: height/45,fontWeight: FontWeight.w400),),
                        Text("467.0",style: GoogleFonts.poppins(fontSize: height/45,fontWeight: FontWeight.w400),),

                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: height/20,
                    width: width/2.6,
                    decoration: BoxDecoration(
                      color: Colors.red.shade700,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text("Out for delivery",style: GoogleFonts.poppins(fontSize: height/45,fontWeight: FontWeight.w500,color: Colors.white),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: height/20,
                    width: width/2.6,
                    decoration: BoxDecoration(
                      color: Colors.green.shade800,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text("Delivered",style: GoogleFonts.poppins(fontSize: height/45,fontWeight: FontWeight.w500,color: Colors.white),),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child:  const GoogleMap(

                    initialCameraPosition: CameraPosition(

                        zoom: 12,
                        target: LatLng(10.9760, 76.2254))),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue.shade300,
                ),
                child: Text("Navigate",style: GoogleFonts.poppins(fontSize: height/45,fontWeight: FontWeight.w500,color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
