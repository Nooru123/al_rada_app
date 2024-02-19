import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../model/modelmodel.dart';

class Breads extends StatelessWidget {
  const Breads({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body:Padding(
        padding:  EdgeInsets.symmetric(horizontal: width/30,vertical: width/50),
        child: GridView.builder(itemCount: breadsModel.length,

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
                                  image: AssetImage(breadsModel[index]['photo']))
                          ),
                        ),
                        Text(breadsModel[index]['name'],style: GoogleFonts.poppins(fontSize: height/40),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [


                            Icon(Icons.select_all_outlined,color: Colors.red,),
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
                              Wrap(children:[ Text("₹ "),
                                Text(breadsModel[index]['price'])
                              ]),

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
