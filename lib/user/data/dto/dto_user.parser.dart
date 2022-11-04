import 'package:test_desktop_app/user/data/dto/user.dto.dart';
import 'package:test_desktop_app/user/domain/entity/user.entity.dart';

class DtoUserParser {
/*    static UserEntity userDtoToUserEntity(UserDto userDto) {

    return UserEntity(
      id: userDto.id,
      name: userDto.name,
      birthDate: userDto.birthDate,
    );
  }  */
  static UserDto userEntityToUserDto(UserEntity userEntity) {
    return UserDto(userEntity.name, userEntity.birthDate);
  }
}
