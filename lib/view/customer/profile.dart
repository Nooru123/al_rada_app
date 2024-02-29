import 'dart:io';

import 'package:ai_rida/view/customer/ctm_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../controller/accountpro.dart';

import '../../controller/login.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});




  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final fetchData = Provider.of<BackendProvider>(context);




    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(111, 31, 40, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CtmHome()));
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
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const Notifications()));
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
            key: AllKeys.formKey4,
            child: Consumer<BackendProvider>(
              builder: (context,value, child) {
                return FutureBuilder(
                  future: value.fetchUserDataCtmDtl(),
                  builder: (context,snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height / 18,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
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
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:fetchData.image1 != null && fetchData.image1!.path.isNotEmpty
                                          ?NetworkImage(fetchData.userModel.imageUrl!) as ImageProvider :const AssetImage('assets/avatar.jpg'),
                                    )

                                  ),
                                ),
                              )

                              ),
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
                            controller: fetchData.fetchName,
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
                            controller: fetchData.fetchEmil,
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
                            controller: fetchData.fetchPass,
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
                            controller: fetchData.fetchMobile,
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
                        const Text(
                          "Address",
                          style: TextStyle(fontSize: 22),
                        ),
                        TextFormField(
                          controller: fetchData.fetchAddress,
                          decoration: const InputDecoration(
                            border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                            hintText: "Enter your Address",
                          ),
                          maxLines: 5,
                          minLines: 5,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "get your current location";
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        SizedBox(
                          height: height / 28,
                        ),
                        InkWell(
                          onTap: ()async{
                            if (
                            fetchData.image1!=null
                            ){
                              String imageUrl = await fetchData.uploadImage(fetchData.image1! as File);
                              if(imageUrl.isNotEmpty){
                                fetchData.editProfile2(fetchData.fetchName.text, fetchData.fetchPass.text, fetchData.fetchEmil.text, fetchData.image1! as File, fetchData.fetchAddress.text, fetchData.fetchMobile.text, context);

                              }else{

                              }

                            }

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
