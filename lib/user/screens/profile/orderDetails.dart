import 'package:e_commerce/models/orders.dart';
import 'package:e_commerce/user/screens/searchScreen.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetails extends StatefulWidget {
  final Order order;
  const OrderDetails({super.key, required this.order});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  navigateToSearchScreen(String search) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchScreen(searchQuery: search);
    }));
  }

  int currentStep = 0;
  @override
  void initState() {
    super.initState();
    currentStep = widget.order.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            flexibleSpace: Container(
              color: Colors.black,
            ),
            title: TextFormField(
              onFieldSubmitted: navigateToSearchScreen,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Image.asset(
                    'assets/icons/ic_search.png',
                    height: 30,
                    color: Colors.grey,
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(width: 1.4))),
            ),
            actions: [
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Image.asset(
                      'assets/icons/ic_bell.png',
                      height: 26,
                      color: Colors.white,
                    ),
                  )),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'View order details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order date :       ${DateFormat().format(
                          DateTime.fromMillisecondsSinceEpoch(
                              widget.order.orderedAt),
                        )}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        'Order ID :           ${widget.order.id}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Text(
                        'Order total :       ${widget.order.totalPrice}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Purchase details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              for (int i = 0; i < widget.order.products.length; i++)
                Row(
                  children: [
                    Image.network(
                      widget.order.products[i].images[0],
                      height: 120,
                      width: 120,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.order.products[i].name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 2,
                            ),
                            Text(
                              'Qty : ${widget.order.quantity[i].toString()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 2,
                            ),
                          ]),
                    )
                  ],
                ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Track Your order',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Stepper(
                  currentStep: currentStep,
                  controlsBuilder: (context, details) {
                    return const SizedBox();
                  },
                  steps: [
                    Step(
                        title: const Text('Pending'),
                        content: const Text('Your order is processing'),
                        isActive: currentStep > 0,
                        state: currentStep > 0
                            ? StepState.complete
                            : StepState.indexed),
                    Step(
                        title: const Text('Pending'),
                        content: const Text('Your order is processing'),
                        isActive: currentStep > 1,
                        state: currentStep > 1
                            ? StepState.complete
                            : StepState.indexed),
                    Step(
                        title: const Text('Pending'),
                        content: const Text('Your order is processing'),
                        isActive: currentStep > 2,
                        state: currentStep > 2
                            ? StepState.complete
                            : StepState.indexed),
                    Step(
                        title: const Text('Pending'),
                        content: const Text('Your order is processing'),
                        isActive: currentStep >= 3,
                        state: currentStep >= 3
                            ? StepState.complete
                            : StepState.indexed),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
