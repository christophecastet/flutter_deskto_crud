import 'package:test_desktop_app/user/data/dto/user.dto.dart';
import 'package:test_desktop_app/user/data/repository/user.repository.dart';
import 'package:test_desktop_app/user/domain/entity/user.entity.dart';

class UserService {
  Future<dynamic> addUser(UserEntity userEntity) async {
    UserRepository userRepository = UserRepository();
    try {
      dynamic result = await userRepository.addUser(userEntity);
      print(result);
      return result;
    } catch (e) {
      throw Exception('Failure');
    }
  }

  Future<dynamic> getUserList() async {
    UserRepository userRepository = UserRepository();
    try {
      dynamic userList = await userRepository.getUserList();
      return userList;
    } catch (e) {
      throw Exception('Failure');
    }
  }

  Future<dynamic> updateUser(
      int idx, UserEntity userEntity, List userList) async {
    UserRepository userRepository = UserRepository();
    try {
      dynamic result = await userRepository.updateUser(idx, userEntity);
      if (result == 'Success') {
        userList[idx] = userEntity;
      }
      print(userList);
      return userList;
    } catch (e) {
      throw Exception('Failure');
    }
  }

  Future<dynamic> deleteUser(int idx, List userList) async {
    UserRepository userRepository = UserRepository();
    try {
      dynamic result = await userRepository.deleteUser(idx);

      if (result == 'Success') {
        userList.removeAt(idx);
      }
      return userList;
    } catch (e) {
      throw Exception('Failure');
    }
  }
}
