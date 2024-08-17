import 'package:e_commerce/provider/user.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/widgets/customButtons.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void signOut() {
      AuthServices().signOut(context);
    }

    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user.toJson().toString()),
          GestureDetector(
              onTap: () {
                signOut();
              },
              child: const CustomButton(
                  buttonText: 'Sign out',
                  buttonColor: Colors.black,
                  textColor: Colors.white))
        ],
      ),
    );
  }
}
