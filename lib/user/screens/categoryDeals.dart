import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/user/screens/productDetails.dart';
import 'package:e_commerce/user/services/homeServices.dart';
import 'package:e_commerce/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryDeals extends StatefulWidget {
  final String category;

  const CategoryDeals({super.key, required this.category});

  @override
  State<CategoryDeals> createState() => _CategoryDealsState();
}

class _CategoryDealsState extends State<CategoryDeals> {
  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  List<Product>? productList;
  final HomeServices homeservices = HomeServices();

  fetchCategoryProducts() async {
    productList = await homeservices.fetchAllProducts(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(62),
          child: AppBar(
            flexibleSpace: Container(
              color: Colors.black,
            ),
            centerTitle: true,
            title: Text(
              widget.category,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )),
      body: productList == null
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Keep shopping for ${widget.category}',
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 170,
                    child: GridView.builder(
                        itemCount: productList!.length,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 15),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 1.4,
                                mainAxisSpacing: 25),
                        itemBuilder: (context, index) {
                          final product = productList![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProductDetails(product: product);
                              }));
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 130,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black, width: 0.5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(
                                        product.images[0],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  product.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
