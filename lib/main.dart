import 'package:ai_rida/view/customer/card.dart';
import 'package:ai_rida/view/customer/ctm_home.dart';
import 'package:ai_rida/view/customer/favarite.dart';
import 'package:ai_rida/view/delivery_boy/location.dart';
import 'package:ai_rida/view/delivery_boy/progress.dart';
import 'package:ai_rida/view/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/accountpro.dart';
import 'controller/ctm_Controller.dart';
import 'controller/dlv_home_controller.dart';
import 'controller/login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashPro>(create: (_) => SplashPro()),
        ChangeNotifierProvider<PaymentPro>(create: (_) => PaymentPro()),
        ChangeNotifierProvider<BackendProvider>(create: (_) => BackendProvider()),
        ChangeNotifierProvider<DlvPro>(create: (_) => DlvPro()),
        ChangeNotifierProvider<CtmPro>(create: (_) => CtmPro()),
        ChangeNotifierProvider<HomePro>(create: (_) => HomePro()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your Schanges or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
//DlvHome
//SignUp
// SplashScreen
//SignInSignUp
//LoginPage
//Account