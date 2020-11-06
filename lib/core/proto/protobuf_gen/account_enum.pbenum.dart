///
//  Generated code. Do not modify.
//  source: account_enum.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AuthStatus extends $pb.ProtobufEnum {
  static const AuthStatus success = AuthStatus._(0, 'success');
  static const AuthStatus fail = AuthStatus._(1, 'fail');

  static const $core.List<AuthStatus> values = <AuthStatus> [
    success,
    fail,
  ];

  static final $core.Map<$core.int, AuthStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AuthStatus valueOf($core.int value) => _byValue[value];

  const AuthStatus._($core.int v, $core.String n) : super(v, n);
}

class UserType extends $pb.ProtobufEnum {
  static const UserType ut_none = UserType._(0, 'ut_none');
  static const UserType ut_common = UserType._(1, 'ut_common');
  static const UserType ut_helper = UserType._(2, 'ut_helper');
  static const UserType ut_system = UserType._(3, 'ut_system');
  static const UserType ut_room = UserType._(4, 'ut_room');
  static const UserType ut_guild_anchor = UserType._(101, 'ut_guild_anchor');
  static const UserType ut_guild_manager = UserType._(201, 'ut_guild_manager');

  static const $core.List<UserType> values = <UserType> [
    ut_none,
    ut_common,
    ut_helper,
    ut_system,
    ut_room,
    ut_guild_anchor,
    ut_guild_manager,
  ];

  static final $core.Map<$core.int, UserType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserType valueOf($core.int value) => _byValue[value];

  const UserType._($core.int v, $core.String n) : super(v, n);
}

class Gender extends $pb.ProtobufEnum {
  static const Gender unknown = Gender._(0, 'unknown');
  static const Gender male = Gender._(1, 'male');
  static const Gender female = Gender._(11, 'female');

  static const $core.List<Gender> values = <Gender> [
    unknown,
    male,
    female,
  ];

  static final $core.Map<$core.int, Gender> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Gender valueOf($core.int value) => _byValue[value];

  const Gender._($core.int v, $core.String n) : super(v, n);
}

class AccountStatus extends $pb.ProtobufEnum {
  static const AccountStatus user_ac_none = AccountStatus._(0, 'user_ac_none');
  static const AccountStatus user_active = AccountStatus._(1, 'user_active');
  static const AccountStatus user_half_banned = AccountStatus._(101, 'user_half_banned');
  static const AccountStatus user_banned = AccountStatus._(201, 'user_banned');

  static const $core.List<AccountStatus> values = <AccountStatus> [
    user_ac_none,
    user_active,
    user_half_banned,
    user_banned,
  ];

  static final $core.Map<$core.int, AccountStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AccountStatus valueOf($core.int value) => _byValue[value];

  const AccountStatus._($core.int v, $core.String n) : super(v, n);
}

class RoomStatus extends $pb.ProtobufEnum {
  static const RoomStatus room_ac_none = RoomStatus._(0, 'room_ac_none');
  static const RoomStatus room_active = RoomStatus._(1, 'room_active');
  static const RoomStatus room_banned = RoomStatus._(11, 'room_banned');

  static const $core.List<RoomStatus> values = <RoomStatus> [
    room_ac_none,
    room_active,
    room_banned,
  ];

  static final $core.Map<$core.int, RoomStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RoomStatus valueOf($core.int value) => _byValue[value];

  const RoomStatus._($core.int v, $core.String n) : super(v, n);
}

class LoginType extends $pb.ProtobufEnum {
  static const LoginType cellphoneCode = LoginType._(0, 'cellphoneCode');
  static const LoginType localCellphone = LoginType._(1, 'localCellphone');
  static const LoginType oauthByWX = LoginType._(2, 'oauthByWX');
  static const LoginType oauthByQQ = LoginType._(3, 'oauthByQQ');
  static const LoginType oauthByMW = LoginType._(4, 'oauthByMW');
  static const LoginType oauthByApple = LoginType._(5, 'oauthByApple');

  static const $core.List<LoginType> values = <LoginType> [
    cellphoneCode,
    localCellphone,
    oauthByWX,
    oauthByQQ,
    oauthByMW,
    oauthByApple,
  ];

  static final $core.Map<$core.int, LoginType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LoginType valueOf($core.int value) => _byValue[value];

  const LoginType._($core.int v, $core.String n) : super(v, n);
}

class SMSCodeType extends $pb.ProtobufEnum {
  static const SMSCodeType codeLoginOrRegister = SMSCodeType._(0, 'codeLoginOrRegister');
  static const SMSCodeType codeSetOrResetPwd = SMSCodeType._(1, 'codeSetOrResetPwd');
  static const SMSCodeType codeCancelAccount = SMSCodeType._(2, 'codeCancelAccount');
  static const SMSCodeType codeChangeOrBindCellPhone = SMSCodeType._(3, 'codeChangeOrBindCellPhone');

  static const $core.List<SMSCodeType> values = <SMSCodeType> [
    codeLoginOrRegister,
    codeSetOrResetPwd,
    codeCancelAccount,
    codeChangeOrBindCellPhone,
  ];

  static final $core.Map<$core.int, SMSCodeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SMSCodeType valueOf($core.int value) => _byValue[value];

  const SMSCodeType._($core.int v, $core.String n) : super(v, n);
}

