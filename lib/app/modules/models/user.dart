import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class User {
  String name;
  String photo;
  String identifier;
  Color color;
  DocumentReference user;

  User({
    this.name,
    this.photo,
    this.identifier,
    this.color,
    this.user,
  }) {
    if (this.color == null) {
      this.color = RandomColor().randomColor(
        colorBrightness: ColorBrightness.primary,
        colorSaturation: ColorSaturation.highSaturation,
      );
    }
  }

  User copyWith({
    String name,
    String photo,
    String identifier,
    Color color,
    DocumentReference user,
  }) {
    return User(
      name: name ?? this.name,
      photo: photo ?? this.photo,
      identifier: identifier ?? this.identifier,
      color: color ?? this.color,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
      'identifier': identifier,
      'color': color.value,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      name: map['name'],
      photo: map['photo'],
      identifier: map['identifier'],
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, photo: $photo, identifier: $identifier, color: $color, user: $user)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.name == name &&
        o.photo == photo &&
        o.identifier == identifier &&
        o.color == color &&
        o.user == user;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        photo.hashCode ^
        identifier.hashCode ^
        color.hashCode ^
        user.hashCode;
  }
}
