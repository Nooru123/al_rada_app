import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../../controller/login.dart';

class Login extends StatelessWidget {
  final String usertype;
  const Login({required this.usertype, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final goPro = Provider.of<SplashPro>(context, listen: false);

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: const Color.fromRGBO(243, 181, 94, 100),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 30),
          child: Form(
            key: AllKeys.formKey2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 8,
                  ),
                  const Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  )),
                  SizedBox(
                    height: height / 8,
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
                      controller: goPro.email1,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Email",
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
                  SizedBox(
                    height: height / 28,
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
                      controller: goPro.pass1,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your password",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: height/60,
                      ),
                      TextButton(onPressed: (){
                        goPro.forgotPassword(goPro.pass1.text, context);
                      }, child: Text("forgot password?",style: GoogleFonts.poppins(),)),
                    ],
                  ),
                  SizedBox(
                    height: height / 23,
                  ),
                  InkWell(
                    onTap: () {
                      goPro.login(goPro.email1.text, goPro.pass1.text, context);
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
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have a account ?"),
                        TextButton(
                            onPressed: () {
                              goPro.movingToSignUp(context);
                            },
                            child: const Text(
                              " Sign Up",
                              style: TextStyle(color: Colors.deepOrangeAccent),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
