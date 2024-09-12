import 'package:e_commerce/admin/services/adminServices.dart';
import 'package:e_commerce/models/orders.dart';
import 'package:e_commerce/user/screens/profile/orderDetails.dart';
import 'package:e_commerce/widgets/loader.dart';
import 'package:e_commerce/widgets/productCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();
  void fetchAllOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Center(child: Loader())
        : GridView.builder(
            itemCount: orders!.length,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.91),
            itemBuilder: (context, index) {
              final orderData = orders![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OrderDetails(order: orderData);
                  }));
                },
                child: SizedBox(
                  height: 140,
                  child: ProductCard(image: orderData.products[0].images[0]),
                ),
              );
            });
  }
}
