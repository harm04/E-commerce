import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:e_commerce/admin/services/adminServices.dart';
import 'package:e_commerce/utils/filePicker.dart';
import 'package:e_commerce/widgets/customButtons.dart';
import 'package:e_commerce/widgets/customTextfield.dart';
import 'package:flutter/material.dart';

class PostProduct extends StatefulWidget {
  const PostProduct({super.key});

  @override
  State<PostProduct> createState() => _PostProductState();
}

class _PostProductState extends State<PostProduct> {
  TextEditingController productcontroller = TextEditingController();

  TextEditingController descriptioncontroller = TextEditingController();

  TextEditingController pricecontroller = TextEditingController();

  TextEditingController quantitycontroller = TextEditingController();

  final AdminServices adminServices = AdminServices();
  final _addProductFormKey = GlobalKey<FormState>();

 

  @override
  void dispose() {
    super.dispose();
    productcontroller.dispose();
    descriptioncontroller.dispose();
    quantitycontroller.dispose();
    pricecontroller.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  String category = 'Mobiles';
  List<File> images = [];
 

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productcontroller.text,
          description: descriptioncontroller.text,
          price: double.parse(pricecontroller.text),
          quantity: double.parse(quantitycontroller.text),
          category: category,
          images: images);
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
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
                  title: const Text(
                    'Add Product',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            body: SingleChildScrollView(
              child: Form(
                  key: _addProductFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: images.isNotEmpty
                              ? CarouselSlider(
                                  items: images.map((i) {
                                    return Builder(
                                        builder: (BuildContext context) {
                                      return Image.file(
                                        i,
                                        fit: BoxFit.cover,
                                        height: 150,
                                      );
                                    });
                                  }).toList(),
                                  options: CarouselOptions(
                                      viewportFraction: 1, height: 150))
                              : GestureDetector(
                                  onTap: () {
                                    selectImages();
                                  },
                                  child: DottedBorder(
                                    color: Colors.black,
                                    strokeCap: StrokeCap.round,
                                    strokeWidth: 1.3,
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(10),
                                    dashPattern: const [10, 4],
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: Image.asset(
                                                'assets/icons/ic_folder.png')),
                                        Text(
                                          'Select a Product',
                                          style: TextStyle(
                                              color: Colors.grey.shade400),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextfield(
                            hintText: 'Product Name',
                            type: TextInputType.text,
                            controller: productcontroller,
                            maxlines: 3,
                            obsecureText: false),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                          hintText: 'Product Description',
                          type: TextInputType.text,
                          controller: descriptioncontroller,
                          obsecureText: false,
                          maxlines: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                            hintText: 'Product Price',
                            type: TextInputType.number,
                            controller: pricecontroller,
                            obsecureText: false),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                            hintText: 'Product Quantity',
                            type: TextInputType.number,
                            controller: quantitycontroller,
                            obsecureText: false),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: productCategories.map((String item) {
                                return DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ));
                              }).toList(),
                              value: category,
                              onChanged: (String? newVal) {
                                setState(() {
                                  category = newVal!;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            sellProduct();
                          },
                          child: const CustomButton(
                              buttonText: 'Sell',
                              buttonColor: Colors.blue,
                              textColor: Colors.white),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  )),
            ),
          );
  }
}
