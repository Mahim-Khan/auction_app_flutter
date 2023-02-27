import 'package:auction_app_flutter/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:auction_app_flutter/view/login_screen.dart';
import 'package:auction_app_flutter/view/my_item_screen.dart';
import 'package:auction_app_flutter/utils/flutter_exports.dart';
import 'dart:developer' as dev show log;

import 'package:flutter/services.dart';

extension Log on Object {
  void log() {
    dev.log(toString());
  }
}

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription<User?> user;
  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        kSignedOut.log();
      } else {
        kSignedIn.log();
      }
    });
    // Timer(
    //   const Duration(seconds: 5),
    //   () => FirebaseAuth.instance.currentUser == null
    //       ? Navigator.pushNamed(context, LoginScreen.id)
    //       : Navigator.pushNamed(context, MyItemScreen.id),
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(splashSrn), fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 38.0,right: 28),
                      margin: const EdgeInsets.only(top: 320),
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      child: const Text(kDetails,
                        style: MyTextStyleBase.sizeD,),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 30,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                        FirebaseAuth.instance.currentUser == null
                            ? Navigator.pushNamed(context, LoginScreen.id)
                            : Navigator.pushNamed(context, MyItemScreen.id);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: kPrimaryColor.withOpacity(0.5),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        kLetsLogIn,
                        style: MyTextStyleBase.sizeD,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
