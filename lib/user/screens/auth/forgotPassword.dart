
import 'package:e_commerce/user/screens/auth/otp.dart';
import 'package:e_commerce/widgets/customButtons.dart';
import 'package:e_commerce/widgets/customTextfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Forgot password',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Enter your email for verification process. We will send a 4 digit code to your email',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Email',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextfield(
              type: TextInputType.emailAddress,
              controller: emailController,
              obsecureText: false,
              hintText: 'email',
            ),
            
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const OtpScreen();
                  }));
                },
                child: const CustomButton(
                  buttonText: 'Send code',
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
