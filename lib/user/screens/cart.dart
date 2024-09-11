import 'package:e_commerce/user/provider/user.dart';
import 'package:e_commerce/user/screens/address.dart';
import 'package:e_commerce/user/screens/searchScreen.dart';
import 'package:e_commerce/widgets/cartProductCard.dart';
import 'package:e_commerce/widgets/cartSubtotal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  navigateToSearchScreen(String search) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchScreen(searchQuery: search);
    }));
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();

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
      body: SingleChildScrollView(
        child: Column(
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
                          'Delivery to ${user.firstname} ${user.lastname} : ${user.address}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
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
          sum==0?const SizedBox():   const CartSubtotal(),
            ListView.builder(
                shrinkWrap: true,
                itemCount: user.cart.length,
                itemBuilder: (context, index) {
                  return CartProductCard(index: index);
                }),
          sum==0?const Text('Nothing in your cart'):  GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Address(
                    totalAmount: sum.toString(),
                  );
                }));
              },
              child: Card(
                child: Container(
                  height: 60,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Buy now',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
