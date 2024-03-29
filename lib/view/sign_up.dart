import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/login.dart';

class SignUp extends StatelessWidget {
  final String usertype;
  const SignUp({required this.usertype, super.key});

  @override
  Widget build(BuildContext context) {
    print(usertype);
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
          child: SingleChildScrollView(
            child: Form(
              key: AllKeys.formKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 8,
                  ),
                  const Center(
                      child: Text(
                    "Sign Up",
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
                      controller: goPro.email,
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
                    height: height / 50,
                  ),
                  const Text(
                    "Username",
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
                      controller: goPro.name,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Username",
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
                    height: height / 50,
                  ),
                  const Text(
                    "Create Password",
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
                      controller: goPro.pass,
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
                  SizedBox(
                    height: height / 50,
                  ),
                  const Text(
                    "Confirm Password",
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
                      controller: goPro.conPass,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Re-enter your password",
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
                    height: height / 40,
                  ),
                  InkWell(
                    onTap: () {
                      if (goPro.email.text.isNotEmpty &&
                          goPro.name.text.isNotEmpty &&
                          goPro.pass.text.isNotEmpty &&
                          goPro.conPass.text.isNotEmpty) {
                        usertype!='Customer'?
                          goPro.signUp2(goPro.name.text, goPro.pass.text, goPro.email.text, context,usertype):


                          goPro.signUp(goPro.name.text, goPro.pass.text, goPro.email.text, context,usertype);


                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("All fields required")));
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
                        "Sign Up",
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
                              goPro.movingToLogin(context);
                            },
                            child: const Text(
                              "Sign In",
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
