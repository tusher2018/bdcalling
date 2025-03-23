import 'package:bdcalling/controller/assignmet3_controller.dart';
import 'package:bdcalling/res/commnText.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Assignment3 extends StatelessWidget {
  final Assignment3_UserController userController =
      Get.put(Assignment3_UserController());

  Assignment3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: commonText("Assignment 3", color: Colors.white, fontSize: 21),
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
                  backgroundImage:
                      CachedNetworkImageProvider(user.picture.large)),
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
