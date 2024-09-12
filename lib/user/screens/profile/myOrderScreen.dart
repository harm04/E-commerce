import 'package:e_commerce/models/orders.dart';
import 'package:e_commerce/user/screens/profile/orderDetails.dart';
import 'package:e_commerce/user/services/myorders.dart';
import 'package:e_commerce/widgets/loader.dart';
import 'package:e_commerce/widgets/productCard.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {

  MyOrderServices myOrderServices = MyOrderServices();
  List<Order>? order;
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    order = await myOrderServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(
            "My Orders",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: order == null
            ? const Loader()
            : GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.74),
                scrollDirection: Axis.vertical,
                itemCount: order!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                     onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OrderDetails(order: order![index],);
                  }));
                },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductCard(
                          image: order![index].products[0].images[0],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order![index].products[0].name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                order![index].products[0].price.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }));
  }
}
