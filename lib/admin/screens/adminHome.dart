import 'package:e_commerce/admin/models/product.dart';
import 'package:e_commerce/admin/screens/postProduct.dart';
import 'package:e_commerce/admin/services/adminServices.dart';
import 'package:e_commerce/user/services/auth.dart';
import 'package:e_commerce/widgets/loader.dart';
import 'package:e_commerce/widgets/productCard.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  List<Product>? products;

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    void signOut() {
      AuthServices().signOut(context);
    }

    return products == null
        ? const Loader()
        : Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(62),
                child: AppBar(
                  flexibleSpace: Container(
                    color: Colors.black,
                  ),
                  title: const Text(
                    'Admin',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          signOut();
                        },
                        child: const Text(
                          'Switch to user',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PostProduct();
                }));
              },
              backgroundColor: Colors.black,
              tooltip: 'Add Product',
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: GridView.builder(
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final productData = products![index];
                  print(products!.length);
                  return Column(
                    children: [
                      SizedBox(
                       
                        child: ProductCard(image: productData.images[0]),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            productData.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )),
                          Icon(Icons.delete)
                        ],
                      )
                    ],
                  );
                }),
          );
  }
}
