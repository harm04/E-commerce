import 'package:e_commerce/widgets/adminBottomBar.dart';
import 'package:e_commerce/user/provider/user.dart';
import 'package:e_commerce/user/screens/auth/signin.dart';
import 'package:e_commerce/user/services/auth.dart';
import 'package:e_commerce/widgets/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//7:50:29
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authServices = AuthServices();
  @override
  void initState() {
    super.initState();
    authServices.getUserData(context);
  }

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              color: Colors.black,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(color: Colors.white))),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ?Provider.of<UserProvider>(context).user.type=='user'? const BottomBar()
          :const AdminBottomBAr(): const SigninScreen(),
    );
  }
}
