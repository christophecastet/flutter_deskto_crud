import 'package:hive/hive.dart';
import 'package:test_desktop_app/user/data/dto/user.dto.dart';
import '../../../model/user.model.dart';

class UserHive {
  Future<dynamic> postUserHive(UserDto userDto) async {
    try {
      var persons = await Hive.openBox<UserModel>('userBox');
      // parser
      UserModel userModel = UserModel(userDto.name, userDto.birthDate);
      await persons.add(userModel);
      Hive.close();
      return 'Success';
    } catch (e) {
      Hive.close();
      rethrow;
    }
  }

  Future<dynamic> getUserListHive() async {
    try {
      var persons = await Hive.openBox<UserModel>('userBox');
      var data = [];
      persons.values.forEach((element) {
        data.add(element);
      });
      Hive.close();
      return data;
    } catch (e) {
      Hive.close();
      rethrow;
    }
  }

  Future<dynamic> putUserListHive(int idx, UserDto userDto) async {
    try {
      var persons = await Hive.openBox<UserModel>('userBox');
      // parser
      UserModel userModel = UserModel(userDto.name, userDto.birthDate);
      persons.putAt(idx, userModel);
      Hive.close();
      return 'Success';
    } catch (e) {
      Hive.close();
      rethrow;
    }
  }

  Future<dynamic> deleteUserListHive(int idx) async {
    try {
      var persons = await Hive.openBox<UserModel>('userBox');
      persons.deleteAt(idx);
      Hive.close();
      return 'Success';
    } catch (e) {
      Hive.close();
      rethrow;
    }
  }
}
