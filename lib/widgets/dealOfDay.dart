import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/user/screens/productDetails.dart';
import 'package:e_commerce/user/services/homeServices.dart';
import 'package:e_commerce/widgets/loader.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  final HomeServices homeServices = HomeServices();
  Product? product;
  @override
  void initState() {
    super.initState();
    dealofDay();
  }

  void dealofDay() async {
    product = await homeServices.dealOfDay(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Deal of the day',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductDetails(product: product!);
                      }));
                    },
                    child: Image.network(
                      product!.images[0],
                      height: 250,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                 
                ],
              );
  }
}
