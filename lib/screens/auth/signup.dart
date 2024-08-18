import 'package:e_commerce/screens/auth/signin.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/widgets/customButtons.dart';
import 'package:e_commerce/widgets/customTextfield.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstnameController = TextEditingController();
    final TextEditingController lastnameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  final AuthServices authService = AuthServices();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    firstnameController.dispose();
 lastnameController.dispose();

  }

  signUpUser() {
    authService.signUp(
        context: context,
        email: emailController.text,
        password: passwordController.text,
        firstname: firstnameController.text,
        lastname: lastnameController.text
       );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Create an account',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Let\'s create your account',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'First Name',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextfield(
                   type: TextInputType.text,
                  controller: firstnameController,
                  obsecureText: false,
                  hintText: 'first name',
                ),
                const SizedBox(
                  height: 15,
                ),
                 const Text(
                  'Last Name',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextfield(
                   type: TextInputType.text,
                  controller: lastnameController,
                  obsecureText: false,
                  hintText: 'last name',
                ),
                const SizedBox(
                  height: 15,
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
                const SizedBox(
                  height: 15,
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
                  height: 15,
                ),
                GestureDetector(
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                      text: 'By signing up you agree to our ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextSpan(
                        text: 'Terms, Privacy Policy and conditions',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline))
                  ])),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    if (signUpFormKey.currentState!.validate()) {
                      await signUpUser();
                      //  Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const MobileLayout();
                      // }));
                    }
                  },
                  child: const CustomButton(
                    buttonText: 'Create an account',
                    buttonColor: Colors.black,
                    textColor: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(children: <Widget>[
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("OR"),
                    ),
                    Expanded(child: Divider()),
                  ]),
                ),
                Card(
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/ic_google.png',
                            height: 30,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Sign up with Google',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 19),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return SigninScreen();
                          }));
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
