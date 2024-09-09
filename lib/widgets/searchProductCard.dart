import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/widgets/stars.dart';
import 'package:flutter/material.dart';

class SearchProductCard extends StatelessWidget {
  final Product product;
  const SearchProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double totleRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totleRating += product.rating![i].rating;
    }
    double avgRating = 0;
    if (totleRating != 0) {
      avgRating = totleRating / product.rating!.length;
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
                 Stars(rating: avgRating),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 130,
                        child: Text(
                          '\$${product.price.toString()}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                        width: 70,
                        child: Text(
                          'In stock',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 17,
                          ),
                        )),
                       
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
