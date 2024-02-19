import 'package:ai_rida/controller/login.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Consumer<SplashPro>(
        builder: (context,value,child) {
          return FutureBuilder(
            future: value.whereToGo(context),
            builder: (context,snapshot) {
              return Container(
                alignment: Alignment.center,
                height: double.infinity,
                width: double.infinity,
                color:HexColor("61052A"),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width/1.1,
                    child: Image.asset("assets/img.png")),
              );
            }
          );
        }
      ),
    );
  }
}
