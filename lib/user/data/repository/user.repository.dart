import 'package:test_desktop_app/user/data/data-source/user.hive.dart';
import 'package:test_desktop_app/user/data/dto/dto_user.parser.dart';
import 'package:test_desktop_app/user/data/dto/user.dto.dart';
import 'package:test_desktop_app/user/domain/entity/user.entity.dart';

class UserRepository {
  Future<dynamic> addUser(UserEntity userEntity) async {
    UserHive userHive = UserHive();
    try {
      UserDto userDto = DtoUserParser.userEntityToUserDto(userEntity);
      dynamic result = await userHive.postUserHive(userDto);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getUserList() async {
    UserHive userHive = UserHive();
    try {
      dynamic userListDto = await userHive.getUserListHive();
      //UserEntity userEntity = DtoUserParser.userDtoToUserEntity(userDto);
      return userListDto;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateUser(int idx, UserEntity userEntity) async {
    UserHive userHive = UserHive();
    try {
      UserDto userDto = DtoUserParser.userEntityToUserDto(userEntity);
      print(userDto);
      dynamic result = await userHive.putUserListHive(idx, userDto);
      //UserEntity userEntity = DtoUserParser.userDtoToUserEntity(userDto);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteUser(int idx) async {
    UserHive userHive = UserHive();
    try {
      //UserDto userDto = DtoUserParser.userEntityToUserDto(userEntity);
      dynamic result = await userHive.deleteUserListHive(idx);
      //UserEntity userEntity = DtoUserParser.userDtoToUserEntity(userDto);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
