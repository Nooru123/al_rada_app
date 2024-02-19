import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/modelmodel.dart';
class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(itemCount: carouselModel.length, itemBuilder: (BuildContext context,  itemIndex,int pageViewIndex){
              return Container(
                height: height/4.5,
                decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.fill,

                      image: AssetImage(carouselModel[itemIndex]))

                ),
              );
            }, options:  CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.6,
                enlargeCenterPage: false,
                viewportFraction: 1
            ),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width/30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Special offer",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold),),
                      TextButton(onPressed: (){}, child: Text("view all",style: GoogleFonts.poppins(fontSize: 12),))

                    ],
                  ),
                  SizedBox(
                    height: height/4,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Container(
                            height:height/5,
                            width:width/1.3,
                            decoration:  BoxDecoration(
                                image: DecorationImage(image: AssetImage(specialModel[index]))
                            ),
                          );
                        }, separatorBuilder: (context,index){
                      return SizedBox(
                        width: width/20,
                      );
                    }, itemCount: specialModel.length),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Menu",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold),),
                      TextButton(onPressed: (){}, child: Text("view all",style: GoogleFonts.poppins(fontSize: 12),))

                    ],
                  ),
                  SizedBox(
                    height: height/6,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Container(
                            height:height/7,
                            width:width/2,
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(menuModel[index]))
                            ),
                          );
                        }, separatorBuilder: (context,index){
                      return SizedBox(
                        width: width/20,
                      );
                    }, itemCount: menuModel.length),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height/40,
            )


          ],
        ),
      ),
    );
  }
}
