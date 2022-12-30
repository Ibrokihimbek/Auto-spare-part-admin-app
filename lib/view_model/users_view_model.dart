import 'package:admin_aplication/data/app_repositroy/user_repository.dart';
import 'package:admin_aplication/data/models/user_model.dart';
import 'package:flutter/material.dart';

class UsersViewModel extends ChangeNotifier {
  final UsersRepository usersRepository;

  UsersViewModel({required this.usersRepository});


  Stream<List<UserModel>> listenUsers() => usersRepository.getUsers();


  deleteUser(String docId) =>
      usersRepository.deleteUser(docId: docId);
}