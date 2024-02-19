import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../controller/login.dart';

class SignInSignUp extends StatelessWidget {
  const SignInSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<SplashPro>(context, listen: false);
    return Scaffold(
      body: Consumer<SplashPro>(builder: (context, value, _) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/img_3.png"))),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 10,
              top: MediaQuery.of(context).size.height / 1.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      login.fly1(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 1.6,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.white),
                      child: const Text("SingIn"),
                    ),
                  ),
                  InkWell(
                    onLongPress: () {},
                    onTap: () {
                      login.fly(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 1.6,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.black),
                      child: const Text(
                        "SingUp ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width / 12,
              left: MediaQuery.of(context).size.width / 1.2,
              child: PopupMenuButton(
                shape: const Border.fromBorderSide(
                    BorderSide(color: Colors.deepOrange)),
                offset: const Offset(0, 3),
                position: PopupMenuPosition.under,
                icon: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(CupertinoIcons.person_2)),
                color: HexColor("F3B55E"),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                      height: 25,
                      onTap: () {
                        value.userType.value='Customer';
                      },
                      value: 0,
                      child: const Text("Customer")),
                  PopupMenuItem<int>(
                      height: 25,
                      onTap: () {
                        value.userType.value='Delivery boy';

                      },
                      value: 1,
                      child: const Text("Delivery boy")),
                ],
                onSelected: (item) => {print(item)},
              ),
            )
          ],
        );
      }),
    );
  }
}
