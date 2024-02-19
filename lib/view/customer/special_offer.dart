import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../model/modelmodel.dart';
class SpecialOffer extends StatelessWidget {
  const SpecialOffer({super.key});



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(

      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20,),
        itemCount: specialOfferModel.length,
        itemBuilder: (context,index){
        return Card(shadowColor: Colors.black,
          child: Container(
            padding: EdgeInsets.all( width/50,),
            
             height: height/2.8,
             child: Column(
               children: [
                 Container(
                   height: height/4,
                   width: width,

                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(specialOfferModel[index]["photo"]))
                   ),
                 ),
                 Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children:[ Text(specialOfferModel[index]['name'],style: GoogleFonts.poppins(fontSize: height/40),),
                       Icon(Icons.select_all_outlined,color: Colors.red,)

                 ]),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: width/40),
                   height: height/20,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     color: Colors.green.shade500
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Order Now",style: GoogleFonts.poppins(fontSize: height/40,color: Colors.white),),
                       Wrap(children: [
                         Text("₹ ",style: GoogleFonts.poppins(fontSize: height/40,color: Colors.white),),
                         Text(specialOfferModel[index]['price'],style: GoogleFonts.poppins(fontSize: height/40,color: Colors.white),),

                       ])
                     ],
                   ),
                 )
               ],
             ),
          ),
        );
      },
          )
    );
  }
}
