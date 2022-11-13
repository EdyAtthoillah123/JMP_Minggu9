import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:minggu_9/controlller/democontroller.dart';
import 'package:minggu_9/controlller/purchase.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class MyWidget extends StatelessWidget {
  final Purchase = Get.put(purchase());
  democontroller cart = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        bottomSheet: SafeArea(
          child: Card(
            elevation: 12.0,
            margin: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Icon(Icons.shopping_cart_rounded,
                            size: 40, color: Colors.white),
                        Positioned(
                          right: 5,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Center(
                              child:
                                  GetX<democontroller>(builder: (controller) {
                                return Text(
                                  '${controller.cartCount}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.0),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GetX<democontroller>(builder: (controller) {
                      return Text(
                        'Total Amount - ${controller.totalAmount}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0),
                      );
                    }),
                    IconButton(
                        onPressed: () => Get.toNamed('/cart',
                            arguments:
                                "Home Page tO Demo Page -> Passing arguments"),
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Container(
          child: GetX<purchase>(builder: (controller) {
            return ListView.builder(
                itemCount: controller.product.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              'https://img.alicdn.com/tfs/TB1e.XyReL2gK0jSZFmXXc7iXXa-990-400.png',
                              fit: BoxFit.cover,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.product[index].productname,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0),
                                        ),
                                        Text(
                                            controller.product[index]
                                                .productDeskription,
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12.0)),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () => cart
                                        .addtocart(controller.product[index]),
                                    child: Text(
                                      'Shop Now',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12.0),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
          }),
        ));
  }
}
