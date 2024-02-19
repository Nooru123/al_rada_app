import 'package:ai_rida/view/delivery_boy/dlv_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'account.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(111, 31, 40, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DlvHome()));
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
        title: Text(
          "Notifications",
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell_circle_fill,
              color: Colors.white,
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
      body: ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: width / 60, vertical: height / 90),
          itemBuilder: (context, index) {
            return Container(
              height: height / 10,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "1",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Wrap(
                    spacing: width / 200,
                    children: [
                      Text(
                        "Order No:",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "#001",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    "is ready for delivery!",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                height: height / 80,
              ),
          itemCount: 1),
    );
  }
}
