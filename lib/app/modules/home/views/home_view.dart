import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF207BFF),
      appBar: AppBar(
        backgroundColor: Color(0xFF207BFF),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.info)),
        title: const Text(
          'Campus Saga',
          style: TextStyle(fontFamily: 'Boogaloo', fontSize: 30),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _cardContainer(),
              SizedBox(
                height: 15,
              ),
              _cardContainer(),
              SizedBox(
                height: 15,
              ),
              _cardContainer(),
              SizedBox(
                height: 15,
              ),
              _cardContainer(),
              SizedBox(
                height: 15,
              ),
              _cardContainer(),
              SizedBox(
                height: 15,
              ),
              _cardContainer(),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _cardContainer() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.5),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/temp/jenny.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Text("Anonymous"),
              Spacer(),
              Checkbox(
                value: false,
                onChanged: (bool? newValue) {},
              )
            ],
          )
        ],
      ),
    );
  }
}
