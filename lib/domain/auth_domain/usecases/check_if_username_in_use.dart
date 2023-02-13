import 'package:cloud_firestore/cloud_firestore.dart';

class CheckIfUsernameInUse {
  Future<bool> checkIfUsernameInUse(String username) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    bool userAlreadyExists =
        (await users.where("username", isEqualTo: username).get()).docs.length >
            0;

    return userAlreadyExists;
  }
}
