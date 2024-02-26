import 'package:ai_rida/controller/dlv_home_controller.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'account.dart';
import 'dlv_home_tab_view.dart';
import 'notifications.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    double height= MediaQuery.of(context).size.height ;
    double width= MediaQuery.of(context).size.width ;
    final change =Provider.of<HomePro>(context);


    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading:false,
            backgroundColor: const Color.fromRGBO(111, 31, 40, 1),
          title: Text("Dashboard",style: GoogleFonts.poppins(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.w500,color: Colors.white),),

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
          padding:  EdgeInsets.symmetric(horizontal: width/30),
          child: SingleChildScrollView(
            child: Column(
              children: [ 
                SizedBox(
                  height: height/50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hy User",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
                    Wrap(
            
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text("offline",style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w600),),
            
                        Consumer<HomePro>(
                            builder: (context,value,child) {
                              return FutureBuilder(
                                  future: value.offline(context),
                                  builder: (context,snapshot) {
                                    return Switch(
                                      activeColor: Colors.white,
                                      activeTrackColor: const Color.fromRGBO(1, 1, 0, 1) ,
                                      inactiveTrackColor:  const Color.fromRGBO(111, 31, 40, 1),
                                      inactiveThumbColor:  const Color.fromRGBO(11, 1, 0, 1),
                                      value: change.isOn, onChanged: (bool value) {
                                      change.offline(value);
            
                                    },);
                                  }
                              );
                            }
                        ),
            
                      ],
                    ),
            
            
                  ],
                ),
                SizedBox(
                  height: height/60,
                  width: width,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width/50,vertical: width/50),
                  height: height/1.98,
                  width: width,
                  decoration: BoxDecoration(
                      color:const Color.fromRGBO(111, 31, 40, 1),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height/90,
                        width: width,
                      ),
                      Text("Performance",style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white),),
                      TabBar(
                          indicator: const BubbleTabIndicator(
                              indicatorColor: Colors.white
                          ),
                          labelColor: const Color.fromRGBO(111, 31, 40, 1),
                          indicatorColor: Colors.transparent,
                          unselectedLabelColor: Colors.white,
                          dividerColor: Colors.transparent,
            
                          tabs: [
                            Tab( child: Text("Daily",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),),
                            Tab( child: Text("Weekly",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),),
                            Tab( child: Text("Monthly",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),),
            
                          ]),
                      SizedBox(
                        height: height/60,
                        width: width,
                      ),
                      SizedBox(
                        height: height/2.89,
                        child: const TabBarView(children: [
                          DlvHomeTabView(),
                          DlvHomeTabView(),
                          DlvHomeTabView(),
            
                        ]),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height/40,
                  width: width,
                ),
                Image.asset("assets/img_5.png")
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}