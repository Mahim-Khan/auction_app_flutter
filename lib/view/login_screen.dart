import 'package:flutter/material.dart';
import 'package:auction_app_flutter/view/my_item_screen.dart';
import 'package:auction_app_flutter/view/register_screen.dart';
import 'package:auction_app_flutter/utils/flutter_exports.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future exitDialog() {
    return showDialog(
      context: context,
      builder: (context) => const AlertDialogWidget(),
    );
  }

  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  bool _obscureText = true;
  final formKey = GlobalKey<FormState>();

  // Toggles the password show status
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
        exitDialog();
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
                            kWelcome,
                            style: MyTextStyleBase.home_1,
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
                      onChanged: (password) {},
                    ),
                    Bouncing(
                      onPress: () {},
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => myAsyncMethod(context, () {
                            if (!mounted) return;
                            Navigator.pushNamed(context, MyItemScreen.id);
                          }, () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(kEntCorrect),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text(
                            kLogIn,
                            style: MyTextStyleBase.sizeD,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          kDHave,
                          style: MyTextStyleBase.sizeB,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: const Text(
                            kSignUp,
                            style: MyTextStyleBase.sizeA,
                          ),
                        ),
                      ],
                    ),
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
    bool shouldNavigate = true;
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(kPro),
          backgroundColor: Colors.green.shade300,
        ),
      );
      shouldNavigate =
          await signIn(_emailField.text.trim(), _passwordField.text.trim());
      if (shouldNavigate) {
        onSuccess.call();
      } else {
        onError.call();
      }
    }
  }
}
