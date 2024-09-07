import 'package:flutter/material.dart';

class DealOfDay extends StatelessWidget {
  const DealOfDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'Deal of the day',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 15,
                      ),
                ),
               
              ],
            ),
          ),
        ),
        Image.network(
            'https://plus.unsplash.com/premium_photo-1673795751718-a48116c5cba6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',height: 250,fit: BoxFit.fitHeight,),
         Container(
              alignment: Alignment.topLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 10.0,top: 10),
                child: Text('\$100',style: TextStyle(color: Colors.black,fontSize: 16,overflow: TextOverflow.ellipsis),maxLines: 2,),
              ),),
            Container(
              alignment: Alignment.topLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 10.0,bottom: 10,right: 10),
                child: Text('Macbook M1',style: TextStyle(color: Colors.black,fontSize: 16,overflow: TextOverflow.ellipsis),maxLines: 2,),
              ),)
      ],
    );
  }
}
