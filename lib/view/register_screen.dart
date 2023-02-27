import 'package:auction_app_flutter/view/my_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:auction_app_flutter/utils/flutter_exports.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'RegisterScreen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  bool _obscureText = true;
  bool _isVisible = false;
  bool _isPasswordSixCharacter = false;
  bool _isPasswordOneNumber = false;
  onVisible() {
    setState(() {
      _isVisible = true;
    });
  }

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      _isPasswordSixCharacter = false;
      if (password.length >= 6) {
        _isPasswordSixCharacter = true;
      }
      _isPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) {
        _isPasswordOneNumber = true;
      }
    });
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    _emailField.dispose();
    _passwordField.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            kSignUpHere,
                            style:  MyTextStyleBase.home_1,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Lottie.asset(kLogInSignupAnm,
                              height: 200, width: 200, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundedInputEmailField(
                      hintText: kEntEmail,
                      textInputType: TextInputType.emailAddress,
                      controller: _emailField,
                    ),
                    RoundedPasswordField(
                      controller: _passwordField,
                      onPressed: () {
                        _toggle();
                      },
                      visible: _obscureText,
                      hintText: kEntPass,
                      onChanged: (password) {
                        onPasswordChanged(password);
                        onVisible();
                      },
                    ),
                    Visibility(
                      visible: _isVisible,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 42,
                          vertical: 2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    color: _isPasswordOneNumber
                                        ? Colors.green
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  kContain,
                                  style:  MyTextStyleBase.sizeE,
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   height: 6,
                            // ),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    color: _isPasswordSixCharacter
                                        ? Colors.green
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  kContainAt,
                                  style:  MyTextStyleBase.sizeE,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Bouncing(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => myAsyncMethod(
                            context,
                                () {
                              if (!mounted) return;
                              Navigator.pushNamed(context, MyItemScreen.id);
                            },
                                () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                 const SnackBar(
                                  content: Text(kFollow),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: const StadiumBorder(),
                          ),
                          child:  const Text(
                            kRegister,
                            style:  MyTextStyleBase.sizeD,
                          ),
                        ),
                      ),
                      onPress: () {},
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text(
                        kAHave,
                        style:  MyTextStyleBase.sizeB,
                      ),
                        const SizedBox(
                          width: 2,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            kSignIn,
                            style: MyTextStyleBase.sizeA,
                          ),
                        ),
                    ],),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Future<void> myAsyncMethod(
      BuildContext context,
      VoidCallback onSuccess,
      VoidCallback onError,
      ) async {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(kCreateA),
          backgroundColor: Colors.green.shade300,
        ),
      );
      bool shouldNavigate =
      await register(_emailField.text.trim(), _passwordField.text.trim());
      if (shouldNavigate) {
        onSuccess.call();
      } else {
        onError.call();
      }
    }
  }
}
