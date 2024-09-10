import 'dart:convert';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/user/provider/user.dart';
import 'package:e_commerce/user/screens/auth/signin.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:e_commerce/utils/httpErrorHandle.dart';
import 'package:e_commerce/utils/snackbar.dart';
import 'package:e_commerce/widgets/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  void signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String firstname,
    required String lastname,
  }) async {
    try {
      final navigator = Navigator.of(context);
      User user = User(
          email: email,
          id: '',
          firstname: firstname,
          lastname: lastname,
          password: password,
          token: '',
          type: '',
          address: '',
          cart: []
          );
      http.Response res = await http.post(
          Uri.parse('${Constatnts.uri}/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      navigator.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SigninScreen(),
        ),
        (route) => false,
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackbar(
                'Account created successfully. Please logn to continue',
                context);
          });
    } catch (err) {
      showSnackbar(err.toString(), context);
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${Constatnts.uri}/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          navigator.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const BottomBar(),
            ),
            (route) => false,
          );
        },
      );
      print(res.body);
    } catch (err) {
      showSnackbar(err.toString(), context);
    }
  }

  void getUserData(
    BuildContext context,
  ) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('${Constatnts.uri}/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('${Constatnts.uri}/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackbar(e.toString(), context);
    }
  }

  void signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return SigninScreen();
    }), (route) => false);
  }
}
