import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

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

                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                crossAxisCount: 2), itemBuilder: (context,index){
              return Card(
                child: Container(
                  height: height/8,
                  width:width/2.4 ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: height/10,

                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/img.png"))
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}