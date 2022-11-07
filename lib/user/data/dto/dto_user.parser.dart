import 'package:test_desktop_app/user/data/dto/user.dto.dart';
import 'package:test_desktop_app/user/domain/entity/user.entity.dart';

class DtoUserParser {
  static UserEntity userDtoToUserEntity(UserDto userDto) {
    return UserEntity(
      name: userDto.name,
      birthDate: userDto.birthDate,
    );
  }

  static UserDto userEntityToUserDto(UserEntity userEntity) {
    return UserDto(name: userEntity.name, birthDate: userEntity.birthDate);
  }
}
