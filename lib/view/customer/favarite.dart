import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:solar_icons/solar_icons.dart';

import 'account2.dart';
import 'ctm_home.dart';
class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CtmHome()));
        }, icon: const Icon(Icons.arrow_back_ios_sharp),),
        backgroundColor: HexColor("#911E2B"),
        title: Text("favorite",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width/30,vertical: width/50),
        child: GridView.builder(itemCount: 7,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 250,

                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                crossAxisCount: 2), itemBuilder: (context,index){
              return Card(
                child: Container(
                  height: height/4,
                  width:width/2.4 ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width/40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height/8,

                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(12

                            ),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/menu1 2.png"))
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text("2 pcs"),

                            Icon(Icons.select_all_outlined,color: Colors.red,)
                          ],
                        ),
                        const Text("1 bun/caboose"),
                        const Text("Ketchup "),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("mayonnaise"),
                            Icon(SolarIconsBold.heart,color: Colors.deepOrange.shade900,)
                          ],
                        ),
                        Gap(height/200),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: width/40),
                          height: height/20,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.green.shade200

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Add"),
                              Text("₹ 99.0")

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}