import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:test_desktop_app/user/data/dto/user.dto.dart';
import 'package:test_desktop_app/user/domain/entity/user.entity.dart';
import 'package:test_desktop_app/user/presentation/bloc/user.cubit.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: UserScreen(),
    );
  }
}

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserEntity userEntity = UserEntity(
      name: 'Tug ${Random().nextInt(100).toString()}',
      birthDate: DateTime.now());

  late dynamic userResult;
  late List userList = [];
  String updatedName = "";

  @override
  void initState() {
    super.initState();
    Hive.registerAdapter<UserDto>(UserDtoAdapter());
    getUsersList();
  }

  Future<void> getUsersList() async {
    await context.read<UserCubit>().getUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener

        if (state is UserLoadedState && state.result.runtimeType == String) {
          userResult = state.result;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: const Color.fromRGBO(33, 150, 243, 0.5),
            content: Text(
              state.result,
              textAlign: TextAlign.center,
            ),
          ));
        }
      },
      builder: (context, state) {
        if (state is UserLoadedState && state.result.runtimeType != String) {
          userList = state.result;
        }
        if (state
            is UserUpdatedState /* && state.result.runtimeType != String */) {
          userList = state.result;
        }
        if (state
            is UserDeletedState /* && state.result.runtimeType != String */) {
          userList = state.result;
        }
        return Center(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<UserCubit>().addUser(userEntity);
                  },
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<UserCubit>().getUsersList();
                  },
                  child: const Text('Get'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Hive.deleteBoxFromDisk("userBox");
                  },
                  child: const Text('Delete box'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                  border: TableBorder.all(width: 1.0, color: Colors.black),
                  columns: const [
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Name',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Update field',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Update action',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Delete action',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    for (var i = 0; i < userList.length; i++)
                      DataRow(cells: [
                        DataCell(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(userList[i].name.toString()),
                            ],
                          ),
                        ),
                        DataCell(
                          TextField(
                            //controller: controller,
                            onChanged: (v) {
                              setState(() {
                                updatedName = v;
                              });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Name',
                            ),
                          ),
                        ),
                        DataCell(
                          ElevatedButton(
                            onPressed: () {
                              //var prevUser = user;
                              context.read<UserCubit>().updateInfo(
                                  i,
                                  UserEntity(
                                    name: updatedName,
                                    birthDate: DateTime.now(),
                                  ),
                                  userList);
                            },
                            child: const Text('Update'),
                          ),
                        ),
                        DataCell(
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade200),
                            onPressed: () {
                              context.read<UserCubit>().deleteInfo(i, userList);
                            },
                            child: const Text('Delete'),
                          ),
                        )
                      ])
                  ]),
            )
          ],
        ));
      },
    );
  }
}
