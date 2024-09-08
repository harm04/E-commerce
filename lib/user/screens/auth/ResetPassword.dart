
import 'package:e_commerce/user/screens/auth/signin.dart';
import 'package:e_commerce/widgets/customButtons.dart';
import 'package:e_commerce/widgets/customTextfield.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  void myDialoug() {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/icons/ic_check-mark.png',height: 60,),
                  const  SizedBox(height: 10,),
                    const Text(
                      'Password changed!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'You can now use new password to login to your account.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const SigninScreen();
                          }));
                        },
                        child: const CustomButton(
                            buttonText: 'Login',
                            buttonColor: Colors.black,
                            textColor: Colors.white))
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reset password',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Set the new password for your account so you can login and access all the features.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Password',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextfield(
               type: TextInputType.text,
              controller: passwordController,
              obsecureText: true,
              hintText: 'password',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Confirm Password',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextfield(
               type: TextInputType.text,
              controller: confirmPasswordController,
              obsecureText: true,
              hintText: 'password',
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: GestureDetector(
                onTap: () {
                  myDialoug();
                },
                child: const CustomButton(
                  buttonText: 'Continue',
                  buttonColor: Colors.black,
                  textColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
