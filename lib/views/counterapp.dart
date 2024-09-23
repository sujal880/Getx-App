import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wslc_302_getx/controllers/countercontroller.dart';

class CounterApp extends StatelessWidget {
  final CounterController controller=Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
      ),
      body: Center(
        child: Obx((){
          return Text(
            controller.count.toString(),
            style: TextStyle(fontSize: 55),
          );
        })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
