import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String photo;
  DocumentReference user;

  User({
    this.name,
    this.photo,
    this.user,
  });

  User copyWith({
    String name,
    String photo,
    DocumentReference user,
  }) {
    return User(
      name: name ?? this.name,
      photo: photo ?? this.photo,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
      'user': user,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      name: map['name'],
      photo: map['photo'],
      user: map['user'],
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, photo: $photo, user: $user)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User && o.name == name && o.photo == photo && o.user == user;
  }

  @override
  int get hashCode => name.hashCode ^ photo.hashCode ^ user.hashCode;
}
