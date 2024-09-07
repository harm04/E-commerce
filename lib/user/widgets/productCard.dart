import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  const ProductCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {


    return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 10, right: 10, bottom: 10),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: SizedBox(
                              height: 170,
                              child: Image.network(
                               image,
                                fit: BoxFit.fitHeight,
                                width: 180,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Product wdefefename',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '\$200',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 204, 250, 207),
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    'Completed',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 10),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }
}