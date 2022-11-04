import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_desktop_app/user/domain/entity/user.entity.dart';
import 'package:test_desktop_app/user/domain/service/user.service.dart';
part 'user.state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  UserService userService = UserService();
  void addUser(UserEntity userEntity) async {
    try {
      // Add info to people box
      dynamic response = await userService.addUser(userEntity);
      emit(UserLoadedState(response));
    } catch (e) {
      emit(UserErrorState(e));
    }
  }

  Future<void> getUsersList() async {
    // Get info from people box
    try {
      var usersList = await userService.getUserList();
      emit(UserLoadedState(usersList));
    } catch (e) {
      emit(UserErrorState(e));
    }
  }

  void updateInfo(int idx, UserEntity userEntity, List userList) async {
    // Update info of people box
    try {
      var usersList = await userService.updateUser(idx, userEntity, userList);
      emit(UserUpdatedState(usersList));
    } catch (e) {
      emit(UserErrorState(e));
    }
  }

  void deleteInfo(int idx, List userList) async {
    // Delete info from people box
    try {
      var result = await userService.deleteUser(idx, userList);
      emit(UserDeletedState(result));
    } catch (e) {
      emit(UserErrorState(e));
    }
  }
}
