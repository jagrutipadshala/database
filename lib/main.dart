import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: Home(),
  ));
}


class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());
    Controller c1=Get.find();

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(
            child: Column(
              children: [
                ElevatedButton(
                    child: Obx(() => Text("Clicks: ${c.count}")),
                    onPressed: () {
                      {
                        c.increment();
                      }
                    }),
              ],
            )
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed:() {
              Get.off(second());
            },));
  }
}

class Controller extends GetxController {
  var count = 0.obs;
  List l=[1,2,4,5,6,7].obs;
  increment() {
    count++;
  }
}


class second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
