import 'package:auction_app_flutter/view/login_screen.dart';
import 'package:auction_app_flutter/view/my_item_screen.dart';
import 'package:auction_app_flutter/view/register_screen.dart';
import 'package:auction_app_flutter/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:auction_app_flutter/utils/flutter_exports.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auction App',
      initialRoute: SplashScreen.id,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        MyItemScreen.id: (context) => const MyItemScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
      },
    );
  }
}
