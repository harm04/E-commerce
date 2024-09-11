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
  // List list = [
  //   'https://image.cdn2.seaart.ai/2024-08-12/cqt01lle878c7382p8n0/11ab95d1d36ed257c92d59eb78355f466b6d4356_low.webp',
  //   'https://image.cdn2.seaart.ai/2023-10-07/19204596485342213/0491a9e90f72991fab18a34bf67cfd2d581574ce_high.webp',
  //   'https://image.cdn2.seaart.ai/2023-12-26/cm5jmi5e878c73c2hrq0/e344350079db28705696292c7f317ab2d2009741_high.webp',
  //   'https://image.cdn2.seaart.ai/2024-01-25/cmpc6vle878c73bqvl5g/d79d6c3a889d2562685f659c7cc0f1144c61b6e4_high.webp',
  //   'https://image.cdn2.seaart.ai/2024-08-12/cqt01lle878c7382p8n0/11ab95d1d36ed257c92d59eb78355f466b6d4356_low.webp',
  //   'https://image.cdn2.seaart.ai/2023-10-07/19204596485342213/0491a9e90f72991fab18a34bf67cfd2d581574ce_high.webp',
  //   'https://image.cdn2.seaart.ai/2023-12-26/cm5jmi5e878c73c2hrq0/e344350079db28705696292c7f317ab2d2009741_high.webp',
  //   'https://image.cdn2.seaart.ai/2024-01-25/cmpc6vle878c73bqvl5g/d79d6c3a889d2562685f659c7cc0f1144c61b6e4_high.webp',
  // ];

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
