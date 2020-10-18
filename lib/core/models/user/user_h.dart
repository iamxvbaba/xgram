import 'package:hive/hive.dart';
import 'package:provider_start/core/models/user/user.dart';

part 'user_h.g.dart';

/// A Hive Database compatible UserH Model
///   - @HiveType(typeId: unique) is necessary for each HiveObject
///   - @HiveField(unique) is necessary if you need the object to persist
@HiveType(typeId: 0)
class UserH extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String username;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String email;

  @HiveField(5)
  final String website;

  @HiveField(6)
  final int follwers;

  @HiveField(7)
  final int follwing;

  UserH(
      {this.id,
      this.name,
      this.username,
      this.phone,
      this.email,
      this.website,
      this.follwers,
      this.follwing});

  factory UserH.fromUser(User user) {
    return UserH(
        id: user.id,
        name: user.name,
        username: user.username,
        phone: user.phone,
        email: user.email,
        website: user.website,
        follwers: user.follwers,
        follwing: user.follwing);
  }

  factory UserH.fromMap(Map<String, dynamic> map) {
    return UserH(
        id: map['id'],
        name: map['name'],
        username: map['username'],
        phone: map['phone'],
        email: map['email'],
        website: map['website'],
        follwers: map['follwers'],
        follwing: map['follwing']);
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['username'] = username;
    map['phone'] = phone;
    map['email'] = email;
    map['website'] = website;
    map['follwers'] = follwers;
    map['follwing'] = follwing;
    return map;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      website.hashCode ^
      follwers.hashCode ^
      follwing.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserH &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          username == other.username &&
          phone == other.phone &&
          email == other.email &&
          website == other.website &&
          follwers == other.follwers &&
          follwing == other.follwing;
}
