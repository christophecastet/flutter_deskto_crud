import 'package:hive/hive.dart';

part 'user.model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  DateTime birthDate;
  UserModel(this.name, this.birthDate);
}
