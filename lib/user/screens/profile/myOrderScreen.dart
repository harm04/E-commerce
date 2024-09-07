import 'package:e_commerce/user/widgets/productCard.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
    List list = [
    'https://image.cdn2.seaart.ai/2024-08-12/cqt01lle878c7382p8n0/11ab95d1d36ed257c92d59eb78355f466b6d4356_low.webp',
    'https://image.cdn2.seaart.ai/2023-10-07/19204596485342213/0491a9e90f72991fab18a34bf67cfd2d581574ce_high.webp',
    'https://image.cdn2.seaart.ai/2023-12-26/cm5jmi5e878c73c2hrq0/e344350079db28705696292c7f317ab2d2009741_high.webp',
    'https://image.cdn2.seaart.ai/2024-01-25/cmpc6vle878c73bqvl5g/d79d6c3a889d2562685f659c7cc0f1144c61b6e4_high.webp',
    'https://image.cdn2.seaart.ai/2024-08-12/cqt01lle878c7382p8n0/11ab95d1d36ed257c92d59eb78355f466b6d4356_low.webp',
    'https://image.cdn2.seaart.ai/2023-10-07/19204596485342213/0491a9e90f72991fab18a34bf67cfd2d581574ce_high.webp',
    'https://image.cdn2.seaart.ai/2023-12-26/cm5jmi5e878c73c2hrq0/e344350079db28705696292c7f317ab2d2009741_high.webp',
    'https://image.cdn2.seaart.ai/2024-01-25/cmpc6vle878c73bqvl5g/d79d6c3a889d2562685f659c7cc0f1144c61b6e4_high.webp',
  ];


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
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.74),
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ProductCard(image: list[index]);
            }));
  }
}
