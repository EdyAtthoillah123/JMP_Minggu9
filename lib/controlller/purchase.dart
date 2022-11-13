import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:minggu_9/model/product.dart';

class purchase extends GetxController {
  var product = <Product>[].obs;
  @override
  void onInit() {
    fecthproduct();
    super.onInit();
  }

  void fecthproduct() async {
    await Future.delayed(Duration(seconds: 1));
    var serverresponse = [
      Product(1, "Demo Product", "aby",
          "This is product that we are going show by getx ", 300.0),
      Product(1, "Demo Product", "aby",
          "This is product that we are going show by getx ", 300.0),
      Product(1, "Demo Product", "aby",
          "This is product that we are going show by getx ", 300.0),
      Product(1, "Demo Product", "aby",
          "This is product that we are going show by getx ", 300.0),
      Product(1, "Demo Product", "aby",
          "This is product that we are going show by getx ", 300.0),
      Product(1, "Demo Product", "aby",
          "This is product that we are going show by getx ", 300.0),
      Product(1, "Demo Product", "aby",
          "This is product that we are going show by getx ", 300.0)
    ];
    product.value = serverresponse;
  }
}
