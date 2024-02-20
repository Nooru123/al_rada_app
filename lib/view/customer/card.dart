import 'package:ai_rida/view/customer/payment.dart';
import 'package:ai_rida/view/customer/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key, });

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold (
      bottomSheet:
          BottomAppBar(
              height: size.height/4,color: Colors.grey,
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("subtotal",style: GoogleFonts.poppins(fontSize: size.height/40),),
                      Text("₹ 99.0",style: GoogleFonts.poppins(fontSize: size.height/40),),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total",style: GoogleFonts.poppins(fontSize: size.height/43,fontWeight: FontWeight.bold),),
                          Text("(including delivery charge &GST)"),
                        ],
                      ),

                      Text("₹ 140.0",style: GoogleFonts.poppins(fontSize: size.height/40),),
                    ],
                  ),
                  Gap(size.height/40),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Payment()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: size.height/17,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green.shade700
                      ),
                      child: Text("Proceed to checkout",style: GoogleFonts.poppins(fontSize: size.height/40,fontWeight: FontWeight.w500,color: Colors.white),),
                    ),
                  )

                ],
              ) ),


      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(111, 31, 40, 1),

        title: const Text("Card",style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            onPressed: ( ) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchPage()));

            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
          ),

          IconButton(
            onPressed: ( ) {

            },
            icon: const Icon(
              Icons.food_bank_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          Gap(

            size. width / 30,
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView.builder(padding: EdgeInsets.all(size.width/40),
            itemCount: 1,
            itemBuilder: (context,index){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: size.width/40),
            height:size.height/4.3 ,
            width: size.width/1.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.black),
              boxShadow:const [ BoxShadow(
                blurRadius: 10.0
              ),]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Order list",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 20),),
                    TextButton(onPressed: (){}, child: Text("+add more",style: GoogleFonts.poppins(color: Colors.green),))
                  ],
                ),
                const Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("2 pcs,1 bun/caboose"),
                    Icon(CupertinoIcons.delete,color: Colors.red,)
                  ],
                ),
                const Text("Ketchup "),
                const Text("mayonnaise "),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Price",style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                    const Text("₹  99.0"),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: size.height/30,
                    ),
                    const Text("- 1 +"),
                  ],
                ),




              ],
            ),
          );
        }),
      ),
    );
  }
}
