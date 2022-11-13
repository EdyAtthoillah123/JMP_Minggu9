import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:minggu_9/model/product.dart';
import 'package:get/get.dart';

class democontroller extends GetxController {
  var cartitem = <Product>[].obs;
  int get cartCount => cartitem.length;
  double get totalAmount =>
      cartitem.fold(0.0, (sum, element) => sum + element.price);

  addtocart(Product product) {
    cartitem.add(product);
  }

  final storage = GetStorage();
  bool get isDark => storage.read('darkmode') ?? false;
  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();
  void changetheme(bool val) => storage.write('darkmode', val);
}
