///
//  Generated code. Do not modify.
//  source: account.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'account_enum.pbenum.dart' as $0;

class LoginOrRegister extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LoginOrRegister', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..e<$0.LoginType>(1, 'loginType', $pb.PbFieldType.OE, protoName: 'loginType', defaultOrMaker: $0.LoginType.cellphoneCode, valueOf: $0.LoginType.valueOf, enumValues: $0.LoginType.values)
    ..aOS(2, 'cellphone')
    ..aOS(3, 'code')
    ..aOS(10, 'source')
    ..hasRequiredFields = false
  ;

  LoginOrRegister._() : super();
  factory LoginOrRegister() => create();
  factory LoginOrRegister.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginOrRegister.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LoginOrRegister clone() => LoginOrRegister()..mergeFromMessage(this);
  LoginOrRegister copyWith(void Function(LoginOrRegister) updates) => super.copyWith((message) => updates(message as LoginOrRegister));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginOrRegister create() => LoginOrRegister._();
  LoginOrRegister createEmptyInstance() => create();
  static $pb.PbList<LoginOrRegister> createRepeated() => $pb.PbList<LoginOrRegister>();
  @$core.pragma('dart2js:noInline')
  static LoginOrRegister getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginOrRegister>(create);
  static LoginOrRegister _defaultInstance;

  @$pb.TagNumber(1)
  $0.LoginType get loginType => $_getN(0);
  @$pb.TagNumber(1)
  set loginType($0.LoginType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLoginType() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cellphone => $_getSZ(1);
  @$pb.TagNumber(2)
  set cellphone($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCellphone() => $_has(1);
  @$pb.TagNumber(2)
  void clearCellphone() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get code => $_getSZ(2);
  @$pb.TagNumber(3)
  set code($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => clearField(3);

  @$pb.TagNumber(10)
  $core.String get source => $_getSZ(3);
  @$pb.TagNumber(10)
  set source($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(10)
  $core.bool hasSource() => $_has(3);
  @$pb.TagNumber(10)
  void clearSource() => clearField(10);
}

class SendSmsCodeArg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SendSmsCodeArg', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..e<$0.SMSCodeType>(1, 'smsCodeType', $pb.PbFieldType.OE, protoName: 'smsCodeType', defaultOrMaker: $0.SMSCodeType.codeLoginOrRegister, valueOf: $0.SMSCodeType.valueOf, enumValues: $0.SMSCodeType.values)
    ..aOS(2, 'cellphone')
    ..hasRequiredFields = false
  ;

  SendSmsCodeArg._() : super();
  factory SendSmsCodeArg() => create();
  factory SendSmsCodeArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendSmsCodeArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SendSmsCodeArg clone() => SendSmsCodeArg()..mergeFromMessage(this);
  SendSmsCodeArg copyWith(void Function(SendSmsCodeArg) updates) => super.copyWith((message) => updates(message as SendSmsCodeArg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendSmsCodeArg create() => SendSmsCodeArg._();
  SendSmsCodeArg createEmptyInstance() => create();
  static $pb.PbList<SendSmsCodeArg> createRepeated() => $pb.PbList<SendSmsCodeArg>();
  @$core.pragma('dart2js:noInline')
  static SendSmsCodeArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendSmsCodeArg>(create);
  static SendSmsCodeArg _defaultInstance;

  @$pb.TagNumber(1)
  $0.SMSCodeType get smsCodeType => $_getN(0);
  @$pb.TagNumber(1)
  set smsCodeType($0.SMSCodeType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSmsCodeType() => $_has(0);
  @$pb.TagNumber(1)
  void clearSmsCodeType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cellphone => $_getSZ(1);
  @$pb.TagNumber(2)
  set cellphone($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCellphone() => $_has(1);
  @$pb.TagNumber(2)
  void clearCellphone() => clearField(2);
}

class YouthPwdArg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('YouthPwdArg', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..a<$core.int>(1, 'password', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  YouthPwdArg._() : super();
  factory YouthPwdArg() => create();
  factory YouthPwdArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory YouthPwdArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  YouthPwdArg clone() => YouthPwdArg()..mergeFromMessage(this);
  YouthPwdArg copyWith(void Function(YouthPwdArg) updates) => super.copyWith((message) => updates(message as YouthPwdArg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static YouthPwdArg create() => YouthPwdArg._();
  YouthPwdArg createEmptyInstance() => create();
  static $pb.PbList<YouthPwdArg> createRepeated() => $pb.PbList<YouthPwdArg>();
  @$core.pragma('dart2js:noInline')
  static YouthPwdArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<YouthPwdArg>(create);
  static YouthPwdArg _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get password => $_getIZ(0);
  @$pb.TagNumber(1)
  set password($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassword() => clearField(1);
}

