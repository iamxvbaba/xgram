///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'account_enum.pbenum.dart' as $0;

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('User', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aInt64(1, 'id')
    ..aInt64(2, 'account')
    ..aOS(3, 'phone')
    ..e<$0.Gender>(4, 'gender', $pb.PbFieldType.OE, defaultOrMaker: $0.Gender.unknown, valueOf: $0.Gender.valueOf, enumValues: $0.Gender.values)
    ..aOS(5, 'nickname')
    ..aOS(6, 'avatar')
    ..aOS(7, 'profile')
    ..aOS(8, 'birthday')
    ..aOS(9, 'area')
    ..a<$core.int>(10, 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User() => create();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  User clone() => User()..mergeFromMessage(this);
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get account => $_getI64(1);
  @$pb.TagNumber(2)
  set account($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get phone => $_getSZ(2);
  @$pb.TagNumber(3)
  set phone($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPhone() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhone() => clearField(3);

  @$pb.TagNumber(4)
  $0.Gender get gender => $_getN(3);
  @$pb.TagNumber(4)
  set gender($0.Gender v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get nickname => $_getSZ(4);
  @$pb.TagNumber(5)
  set nickname($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNickname() => $_has(4);
  @$pb.TagNumber(5)
  void clearNickname() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get avatar => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatar($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAvatar() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatar() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get profile => $_getSZ(6);
  @$pb.TagNumber(7)
  set profile($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasProfile() => $_has(6);
  @$pb.TagNumber(7)
  void clearProfile() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get birthday => $_getSZ(7);
  @$pb.TagNumber(8)
  set birthday($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBirthday() => $_has(7);
  @$pb.TagNumber(8)
  void clearBirthday() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get area => $_getSZ(8);
  @$pb.TagNumber(9)
  set area($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasArea() => $_has(8);
  @$pb.TagNumber(9)
  void clearArea() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get status => $_getIZ(9);
  @$pb.TagNumber(10)
  set status($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearStatus() => clearField(10);
}

class UserList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserList', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..pc<User>(1, 'users', $pb.PbFieldType.PM, subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  UserList._() : super();
  factory UserList() => create();
  factory UserList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserList clone() => UserList()..mergeFromMessage(this);
  UserList copyWith(void Function(UserList) updates) => super.copyWith((message) => updates(message as UserList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserList create() => UserList._();
  UserList createEmptyInstance() => create();
  static $pb.PbList<UserList> createRepeated() => $pb.PbList<UserList>();
  @$core.pragma('dart2js:noInline')
  static UserList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserList>(create);
  static UserList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<User> get users => $_getList(0);
}

