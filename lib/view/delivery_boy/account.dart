import 'dart:io';

import 'package:ai_rida/view/delivery_boy/dlv_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../controller/accountpro.dart';
import '../../controller/login.dart';
import 'notifications.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final controller = Provider.of<BackendProvider>(
      context,
    );

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
          "Account",
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
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.person_circle_fill,
              color: Colors.white,
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
        padding: EdgeInsets.symmetric(horizontal: width / 30),
        child: SingleChildScrollView(
          child: Form(
            key: AllKeys.formKey3,
            child: Consumer<BackendProvider>(
              builder: (context,value,child) {
                return FutureBuilder(
                  future:value.fetchUserDataDlvDtl() ,
                  builder: (context,snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height / 18,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Consumer<BackendProvider>(builder: (context, value, _) {
                            return Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    value.getImage();
                                  },
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(color: Colors.black),
                                        image: DecorationImage(
                                          image: value.image1 != null
                                              ?

                                              NetworkImage(controller.userModel.imageUrl!)

                                              :const AssetImage('assets/avatar.jpg') as ImageProvider,
                                        )),
                                  ),
                                )
                                // IconButton(
                                //   onPressed: () {
                                //     imageController.getImage();
                                //   },
                                //
                                //   icon: const Icon(Icons.add_a_photo),
                                // ),
                                );
                          }),
                        ),
                        SizedBox(
                          height: height / 18,
                        ),
                        const Text(
                          "Name",
                          style: TextStyle(fontSize: 22),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: width / 30),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: controller.fetchName2,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your Name",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Name";
                              }
                              return null;
                            },
                            onSaved: (value) {},
                          ),
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(fontSize: 22),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: width / 30),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller:controller.fetchEmil2,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your Email",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Email";
                              }
                              return null;
                            },
                            onSaved: (value) {},
                          ),
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(fontSize: 22),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: width / 30),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: controller.fetchPass2,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your Password",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Password";
                              }
                              return null;
                            },
                            onSaved: (value) {},
                          ),
                        ),
                        const Text(
                          "Mobile number",
                          style: TextStyle(fontSize: 22),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: width / 30),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: controller.fetchMobile2,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your Mobile number",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Mobile number";
                              }
                              return null;
                            },
                            onSaved: (value) {},
                          ),
                        ),
                        SizedBox(
                          height: height / 28,
                        ),
                        InkWell(onTap: (){
                          onTap: ()async{
                            if (
                            controller.image1!=null
                            ){
                              String imageUrl = await controller.uploadImage(controller.image1! as File);
                              if(imageUrl.isNotEmpty){
                                controller.editProfile(controller.fetchName2.text, controller.fetchPass2.text, controller.fetchEmil2.text, controller.image1! as File, controller.fetchMobile2.text, context );

                              }

                            }

                          };
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const DlvHome()));
                        },
                          child: Container(
                            alignment: Alignment.center,
                            height: height / 16,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white),
                                color: Colors.black),
                            child: const Text(
                              "Update",
                              style: TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
