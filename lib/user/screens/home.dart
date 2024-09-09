import 'package:e_commerce/user/provider/user.dart';
import 'package:e_commerce/user/screens/searchScreen.dart';
import 'package:e_commerce/widgets/crouselImages.dart';
import 'package:e_commerce/widgets/dealOfDay.dart';
import 'package:e_commerce/widgets/topCategories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    searchcontroller.dispose();
  }

  navigateToSearchScreen(String search) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchScreen(searchQuery: search);
    }));
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            flexibleSpace: Container(
              color: Colors.black,
            ),
            title: TextFormField(
           
               
              onFieldSubmitted: navigateToSearchScreen,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Image.asset(
                    'assets/icons/ic_search.png',
                    height: 30,
                    color: Colors.grey,
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(width: 1.4))),
            ),
            actions: [
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Image.asset(
                      'assets/icons/ic_bell.png',
                      height: 26,
                      color: Colors.white,
                    ),
                  )),
            ],
          )),
      body: ListView(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: const Color.fromARGB(255, 236, 236, 236),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/ic_location.png',
                        height: 25,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        'Delivery to ${user.firstname} ${user.lastname} : cdcdcdcc cdceefrffrfceceeveve vvee ecaddress',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TopCaregories(),
          const SizedBox(
            height: 10,
          ),
          const CrouselImages(),
          const SizedBox(
            height: 10,
          ),
          DealOfDay(),
          Text(user.toJson().toString()),
        ],
      ),
    );
  }
}
