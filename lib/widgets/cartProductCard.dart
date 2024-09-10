import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/user/provider/user.dart';
import 'package:e_commerce/user/services/productDetailsServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProductCard extends StatefulWidget {
  final int index;
  const CartProductCard({super.key, required this.index});

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    final productCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];
    final ProductDetailsServices productDetailsServices =
        ProductDetailsServices();

    void increaseQuantity(Product product) {
      productDetailsServices.addtoCart(context: context, product: product);
    }

    void decreaseQuantity(Product product) {
      productDetailsServices.removeFromCart(context: context, product: product);
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: Image.network(
                product.images[0],
                fit: BoxFit.contain,
                height: 150,
                width: 150,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 200,
                    child: Text(
                      product.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    )),
                SizedBox(
                    width: 200,
                    child: Text(
                      product.description,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 3,
                    )),
                Row(
                  children: [
                    SizedBox(
                        child: Text(
                      '\$${product.price.toString()}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                             onTap: () {
                              increaseQuantity(product);
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(quantity.toString()),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              decreaseQuantity(product);
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
