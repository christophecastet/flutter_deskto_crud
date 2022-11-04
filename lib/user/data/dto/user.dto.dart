import 'package:hive/hive.dart';
part 'user.dto.g.dart';

@HiveType(typeId: 1)
class UserDto {
  @HiveField(0)
  String? name;
  @HiveField(1)
  DateTime? birthDate;

  UserDto(this.name, this.birthDate);
}
