import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minggu_9/controlller/democontroller.dart';

class Demopage extends StatelessWidget {
  final democontroller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Get.arguments),
            ),
            SwitchListTile(
              value: ctrl.isDark,
              title: Text("Touch to change Theme Mode"),
              onChanged: ctrl.changetheme,
            ),
            ElevatedButton(
              onPressed: () => Get.snackbar(
                  'Snackbar', 'i am a modern snackbar message',
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white,
                  backgroundColor: Colors.black87),
              child: Text('Snack Bar'),
            ),
            ElevatedButton(
                onPressed: () => Get.defaultDialog(
                    title: "Dialogue", content: Text('Hey, From Dialogue')),
                child: Text('Dialogue')),
            ElevatedButton(
                onPressed: () => Get.bottomSheet(Container(
                      height: 150,
                      color: Colors.white,
                      child: Text(
                        'Hello from Bottom sheet',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    )),
                child: Text('Bottom Sheet')),
            ElevatedButton(
                onPressed: () => Get.offNamed('/'),
                child: Text('Back to Home')),
          ],
        ),
      ),
    );
  }
}
