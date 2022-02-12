import 'package:dnc_flutter_firestore_service/dnc_flutter_firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../firebase_options.dart';
import '../mock.dart';

void main() {
  UserService? userService;
  UserModel? model;
  setupFirebaseAuthMocks();

  setUp(() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.android);
    userService = UserService();
    model = UserModel(
        name: "teston name",
        email: 'teston0@example.com',
        phone: '+6285xxx',
        username: 'teston');
  });

  test('save user', () {
    Future<dynamic> save = userService!.save(model!);
    expect(save, completion(equals(ResponseMessage.sendSuccess.value)));
  });
  test('update user', () {});
  test('load user use stream', () {});
  test('load user use list', () {});
  test('delete user', () {});
}
