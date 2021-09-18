import 'package:get/get.dart';
import 'package:sample01/core/api_service.dart';
import 'package:sample01/core/mdoels/user_Add_models..dart';
import 'package:sample01/core/mdoels/usermodel.dart';

class HomePageViewModel extends GetxController {
  ApiService _apiService = new ApiService();
  User? user;
  List<User> userList = [];
  HomePageViewModel() {
    getData();
  }
  //User? user;
  createUser(String? firstName, String? lastName, String? email) async {
    final result = await _apiService.postUserData(firstName, lastName, email);

    return userList;
  }

  deleteUser(User? user) async {
    final result = await _apiService.removeUserData(user!);
    userList.remove(user);
    update();
    return result;
  }

  getData() async {
    var result = await _apiService.getFectData();
    if (result == false) {
    } else {
      for (var item in result) {
        userList.add(
          User.fromJson(item),
        );
      }

      return userList;
    }
  }
}
