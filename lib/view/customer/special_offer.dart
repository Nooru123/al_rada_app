import 'package:flutter/material.dart';

import '../../model/modelmodel.dart';
class SpecialOffer extends StatelessWidget {
  const SpecialOffer({super.key});



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(

      body: SizedBox(
        height: height/5,
        child: ListView.separated(itemBuilder: (context,index){
          return Container(
            color: Colors.red,
             child: Column(
               children: [
                 Container(
                   decoration: BoxDecoration(
                     image: DecorationImage(
                         fit: BoxFit.fill,
                         image: AssetImage(specialOfferModel[index]["photo"]))
                   ),
                 )
               ],
             ),
          );
        }, separatorBuilder: (context,index){
          return SizedBox(width: width/40,);
        }, itemCount: specialOfferModel.length),
      ),
    );
  }
}
