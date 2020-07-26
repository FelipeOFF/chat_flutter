import 'package:chat/app/modules/base/helper/device_credential.dart';
import 'package:chat/app/modules/models/user.dart';
import 'package:chat/app/modules/repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositoryImpl extends UserRepository {
  final String userCollection = "users";
  final Firestore firestore;

  UserRepositoryImpl(this.firestore);

  @override
  Future<User> saveUser(User user) async {
    var userWithCredential = await _checkUserHasIdentifield(user);
    var userExistent = await _checkUserExist(userWithCredential);

    if (userExistent == null) {
      DocumentReference doc =
          await _getCollectionReference().add(userWithCredential.toMap());
      userWithCredential.user = doc;
      return userWithCredential;
    } else {
      return userExistent;
    }
  }

  @override
  Stream<List<User>> getAllUsersStream() =>
      _getCollectionReference().orderBy("name").snapshots().map(
          (event) => event.documents.map((e) => User.fromMap(e.data)).toList());

  CollectionReference _getCollectionReference() =>
      firestore.collection(userCollection);

  Future<User> _checkUserExist(User user) async {
    var documents = await _getCollectionReference()
        .where("name", isEqualTo: user.name)
        .where(
          "identifier",
        )
        .getDocuments();

    if (documents.documents.isNotEmpty) {
      return User.fromMap(documents.documents.first.data);
    } else {
      return null;
    }
  }

  Future<User> _checkUserHasIdentifield(User user) async {
    if (user.identifier == null) {
      var deviceCredential = await DeviceCredential.getDeviceDetails();
      user.identifier = deviceCredential["identifier"];
      return user;
    } else {
      return user;
    }
  }
}
