import 'dart:convert';
import 'package:bdcalling/model/user-model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;
  Box userBox = Hive.box('userBox');

  @override
  void onInit() {
    fetchUsers();

    super.onInit();
  }

//this is the modification for assignment 3
  void loadCachedUsers() {
    var cachedUsers = userBox.get('users');
    if (cachedUsers != null) {
      List<User> userList = (json.decode(cachedUsers) as List)
          .map((data) => User.fromJson(data))
          .toList();
      users.assignAll(userList);
    }
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      final response =
          await http.get(Uri.parse('https://randomuser.me/api?results=10'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var userList = (data['results'] as List)
            .map((json) => User.fromJson(json))
            .toList();
        users.assignAll(userList);
      }
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading(false);
    }
  }
}
