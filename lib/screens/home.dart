import 'package:e_commerce/provider/user.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/utils/categoryList.dart';
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
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            flexibleSpace: Container(
              color: Colors.black,
            ),
            title: TextField(
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
          SizedBox(
            height: 60,
            child: ListView.builder(
              itemCount: Categories.categoryImages.length,
              scrollDirection: Axis.horizontal,
              itemExtent: 90,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            Categories.categoryImages[index]['image']!,
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                      Text(
                        Categories.categoryImages[index]['title']!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(user.toJson().toString()),
        ],
      ),
    );
  }
}
