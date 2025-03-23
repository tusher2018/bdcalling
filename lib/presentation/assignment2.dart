import 'package:bdcalling/controller/user_controller.dart';
import 'package:bdcalling/res/commnText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Assignment2 extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  Assignment2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: commonText("Assignment 2", color: Colors.white, fontSize: 21),
        centerTitle: true,
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            final user = userController.users[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: commonText(user.name.first.characters.first,
                    fontSize: 21, fontWeight: FontWeight.bold),
              ),
              title: commonText("${user.name.first} ${user.name.last}",
                  color: Colors.white, fontSize: 16),
              subtitle: commonText(
                  "${user.location.state}, ${user.location.city}, ${user.location.country}",
                  color: Colors.white),
            );
          },
        );
      }),
    );
  }
}
