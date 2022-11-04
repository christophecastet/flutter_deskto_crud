import 'package:hive/hive.dart';
import 'package:test_desktop_app/user/data/dto/user.dto.dart';
import '../dto/user.dto.dart';

class UserHive {
  Future<dynamic> postUserHive(UserDto userDto) async {
    try {
      var persons = await Hive.openBox<UserDto>('userBox');
      //Box box = Hive.box('personBox');
      await persons.add(userDto);
      Hive.close();
      return 'Success';
    } catch (e) {
      Hive.close();
      rethrow;
    }
  }

  Future<dynamic> getUserListHive() async {
    try {
      var persons = await Hive.openBox<UserDto>('userBox');
      var data = [];
      persons.values.forEach((element) {
        print(element.name);
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
      var persons = await Hive.openBox<UserDto>('userBox');
      persons.putAt(idx, userDto);
      print(userDto);
      Hive.close();
      return 'Success';
    } catch (e) {
      Hive.close();
      rethrow;
    }
  }

  Future<dynamic> deleteUserListHive(int idx) async {
    try {
      var persons = await Hive.openBox<UserDto>('userBox');
      persons.deleteAt(idx);
      Hive.close();
      return 'Success';
    } catch (e) {
      Hive.close();
      rethrow;
    }
  }
}
