///
//  Generated code. Do not modify.
//  source: logic.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'abridged.pb.dart' as $3;
import 'message.pb.dart' as $2;

import 'abridged.pbenum.dart' as $3;
import 'account_enum.pbenum.dart' as $0;

class LogicArg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LogicArg', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aOM<$3.Proto>(1, 'p', subBuilder: $3.Proto.create)
    ..aInt64(2, 'userID', protoName: 'userID')
    ..a<$fixnum.Int64>(3, 'authKeyID', $pb.PbFieldType.OU6, protoName: 'authKeyID', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, 'IP', protoName: 'IP')
    ..aOS(5, 'Device', protoName: 'Device')
    ..aOS(6, 'Version', protoName: 'Version')
    ..a<$core.int>(7, 'os', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  LogicArg._() : super();
  factory LogicArg() => create();
  factory LogicArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogicArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LogicArg clone() => LogicArg()..mergeFromMessage(this);
  LogicArg copyWith(void Function(LogicArg) updates) => super.copyWith((message) => updates(message as LogicArg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogicArg create() => LogicArg._();
  LogicArg createEmptyInstance() => create();
  static $pb.PbList<LogicArg> createRepeated() => $pb.PbList<LogicArg>();
  @$core.pragma('dart2js:noInline')
  static LogicArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogicArg>(create);
  static LogicArg _defaultInstance;

  @$pb.TagNumber(1)
  $3.Proto get p => $_getN(0);
  @$pb.TagNumber(1)
  set p($3.Proto v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasP() => $_has(0);
  @$pb.TagNumber(1)
  void clearP() => clearField(1);
  @$pb.TagNumber(1)
  $3.Proto ensureP() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userID => $_getI64(1);
  @$pb.TagNumber(2)
  set userID($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get authKeyID => $_getI64(2);
  @$pb.TagNumber(3)
  set authKeyID($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthKeyID() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthKeyID() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get iP => $_getSZ(3);
  @$pb.TagNumber(4)
  set iP($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIP() => $_has(3);
  @$pb.TagNumber(4)
  void clearIP() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get device => $_getSZ(4);
  @$pb.TagNumber(5)
  set device($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDevice() => $_has(4);
  @$pb.TagNumber(5)
  void clearDevice() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get version => $_getSZ(5);
  @$pb.TagNumber(6)
  set version($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearVersion() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get os => $_getIZ(6);
  @$pb.TagNumber(7)
  set os($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOs() => $_has(6);
  @$pb.TagNumber(7)
  void clearOs() => clearField(7);
}

class LogicResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LogicResponse', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aOB(1, 'changeOP', protoName: 'changeOP')
    ..e<$3.OP>(2, 'op', $pb.PbFieldType.OE, defaultOrMaker: $3.OP.needDH, valueOf: $3.OP.valueOf, enumValues: $3.OP.values)
    ..e<$0.AccountStatus>(3, 'accountStatus', $pb.PbFieldType.OE, protoName: 'accountStatus', defaultOrMaker: $0.AccountStatus.user_ac_none, valueOf: $0.AccountStatus.valueOf, enumValues: $0.AccountStatus.values)
    ..e<$0.AuthStatus>(4, 'authStatus', $pb.PbFieldType.OE, protoName: 'authStatus', defaultOrMaker: $0.AuthStatus.success, valueOf: $0.AuthStatus.valueOf, enumValues: $0.AuthStatus.values)
    ..aOM<$3.Response>(5, 'resp', subBuilder: $3.Response.create)
    ..aInt64(6, 'roomID', protoName: 'roomID')
    ..aInt64(7, 'userID', protoName: 'userID')
    ..a<$core.int>(8, 'os', $pb.PbFieldType.O3)
    ..aOS(9, 'Device', protoName: 'Device')
    ..aOS(10, 'Version', protoName: 'Version')
    ..hasRequiredFields = false
  ;

  LogicResponse._() : super();
  factory LogicResponse() => create();
  factory LogicResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogicResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LogicResponse clone() => LogicResponse()..mergeFromMessage(this);
  LogicResponse copyWith(void Function(LogicResponse) updates) => super.copyWith((message) => updates(message as LogicResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogicResponse create() => LogicResponse._();
  LogicResponse createEmptyInstance() => create();
  static $pb.PbList<LogicResponse> createRepeated() => $pb.PbList<LogicResponse>();
  @$core.pragma('dart2js:noInline')
  static LogicResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogicResponse>(create);
  static LogicResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get changeOP => $_getBF(0);
  @$pb.TagNumber(1)
  set changeOP($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChangeOP() => $_has(0);
  @$pb.TagNumber(1)
  void clearChangeOP() => clearField(1);

  @$pb.TagNumber(2)
  $3.OP get op => $_getN(1);
  @$pb.TagNumber(2)
  set op($3.OP v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOp() => $_has(1);
  @$pb.TagNumber(2)
  void clearOp() => clearField(2);

  @$pb.TagNumber(3)
  $0.AccountStatus get accountStatus => $_getN(2);
  @$pb.TagNumber(3)
  set accountStatus($0.AccountStatus v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountStatus() => clearField(3);

  @$pb.TagNumber(4)
  $0.AuthStatus get authStatus => $_getN(3);
  @$pb.TagNumber(4)
  set authStatus($0.AuthStatus v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthStatus() => clearField(4);

  @$pb.TagNumber(5)
  $3.Response get resp => $_getN(4);
  @$pb.TagNumber(5)
  set resp($3.Response v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasResp() => $_has(4);
  @$pb.TagNumber(5)
  void clearResp() => clearField(5);
  @$pb.TagNumber(5)
  $3.Response ensureResp() => $_ensure(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get roomID => $_getI64(5);
  @$pb.TagNumber(6)
  set roomID($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRoomID() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomID() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get userID => $_getI64(6);
  @$pb.TagNumber(7)
  set userID($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUserID() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserID() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get os => $_getIZ(7);
  @$pb.TagNumber(8)
  set os($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOs() => $_has(7);
  @$pb.TagNumber(8)
  void clearOs() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get device => $_getSZ(8);
  @$pb.TagNumber(9)
  set device($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDevice() => $_has(8);
  @$pb.TagNumber(9)
  void clearDevice() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get version => $_getSZ(9);
  @$pb.TagNumber(10)
  set version($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasVersion() => $_has(9);
  @$pb.TagNumber(10)
  void clearVersion() => clearField(10);
}

class NewConnArg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NewConnArg', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aInt64(1, 'userID', protoName: 'userID')
    ..a<$fixnum.Int64>(2, 'authKey', $pb.PbFieldType.OU6, protoName: 'authKey', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, 'ip')
    ..aInt64(4, 'connID', protoName: 'connID')
    ..aOS(5, 'serverName', protoName: 'serverName')
    ..aInt64(6, 'frontID', protoName: 'frontID')
    ..hasRequiredFields = false
  ;

  NewConnArg._() : super();
  factory NewConnArg() => create();
  factory NewConnArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewConnArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NewConnArg clone() => NewConnArg()..mergeFromMessage(this);
  NewConnArg copyWith(void Function(NewConnArg) updates) => super.copyWith((message) => updates(message as NewConnArg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewConnArg create() => NewConnArg._();
  NewConnArg createEmptyInstance() => create();
  static $pb.PbList<NewConnArg> createRepeated() => $pb.PbList<NewConnArg>();
  @$core.pragma('dart2js:noInline')
  static NewConnArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewConnArg>(create);
  static NewConnArg _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userID => $_getI64(0);
  @$pb.TagNumber(1)
  set userID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get authKey => $_getI64(1);
  @$pb.TagNumber(2)
  set authKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ip => $_getSZ(2);
  @$pb.TagNumber(3)
  set ip($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIp() => $_has(2);
  @$pb.TagNumber(3)
  void clearIp() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get connID => $_getI64(3);
  @$pb.TagNumber(4)
  set connID($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasConnID() => $_has(3);
  @$pb.TagNumber(4)
  void clearConnID() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get serverName => $_getSZ(4);
  @$pb.TagNumber(5)
  set serverName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasServerName() => $_has(4);
  @$pb.TagNumber(5)
  void clearServerName() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get frontID => $_getI64(5);
  @$pb.TagNumber(6)
  set frontID($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFrontID() => $_has(5);
  @$pb.TagNumber(6)
  void clearFrontID() => clearField(6);
}

class NewConnResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NewConnResponse', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  NewConnResponse._() : super();
  factory NewConnResponse() => create();
  factory NewConnResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewConnResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NewConnResponse clone() => NewConnResponse()..mergeFromMessage(this);
  NewConnResponse copyWith(void Function(NewConnResponse) updates) => super.copyWith((message) => updates(message as NewConnResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewConnResponse create() => NewConnResponse._();
  NewConnResponse createEmptyInstance() => create();
  static $pb.PbList<NewConnResponse> createRepeated() => $pb.PbList<NewConnResponse>();
  @$core.pragma('dart2js:noInline')
  static NewConnResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewConnResponse>(create);
  static NewConnResponse _defaultInstance;
}

class DisconnectArg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DisconnectArg', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aInt64(1, 'userID', protoName: 'userID')
    ..a<$fixnum.Int64>(2, 'authKey', $pb.PbFieldType.OU6, protoName: 'authKey', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(3, 'connID', protoName: 'connID')
    ..aOS(4, 'serverName', protoName: 'serverName')
    ..hasRequiredFields = false
  ;

  DisconnectArg._() : super();
  factory DisconnectArg() => create();
  factory DisconnectArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisconnectArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DisconnectArg clone() => DisconnectArg()..mergeFromMessage(this);
  DisconnectArg copyWith(void Function(DisconnectArg) updates) => super.copyWith((message) => updates(message as DisconnectArg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DisconnectArg create() => DisconnectArg._();
  DisconnectArg createEmptyInstance() => create();
  static $pb.PbList<DisconnectArg> createRepeated() => $pb.PbList<DisconnectArg>();
  @$core.pragma('dart2js:noInline')
  static DisconnectArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisconnectArg>(create);
  static DisconnectArg _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userID => $_getI64(0);
  @$pb.TagNumber(1)
  set userID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get authKey => $_getI64(1);
  @$pb.TagNumber(2)
  set authKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthKey() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get connID => $_getI64(2);
  @$pb.TagNumber(3)
  set connID($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasConnID() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnID() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get serverName => $_getSZ(3);
  @$pb.TagNumber(4)
  set serverName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasServerName() => $_has(3);
  @$pb.TagNumber(4)
  void clearServerName() => clearField(4);
}

class DisconnectResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DisconnectResponse', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DisconnectResponse._() : super();
  factory DisconnectResponse() => create();
  factory DisconnectResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisconnectResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DisconnectResponse clone() => DisconnectResponse()..mergeFromMessage(this);
  DisconnectResponse copyWith(void Function(DisconnectResponse) updates) => super.copyWith((message) => updates(message as DisconnectResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DisconnectResponse create() => DisconnectResponse._();
  DisconnectResponse createEmptyInstance() => create();
  static $pb.PbList<DisconnectResponse> createRepeated() => $pb.PbList<DisconnectResponse>();
  @$core.pragma('dart2js:noInline')
  static DisconnectResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisconnectResponse>(create);
  static DisconnectResponse _defaultInstance;
}

class CNotifyArg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CNotifyArg', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aInt64(1, 'userID', protoName: 'userID')
    ..a<$fixnum.Int64>(2, 'authKey', $pb.PbFieldType.OU6, protoName: 'authKey', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(3, 'os', $pb.PbFieldType.O3)
    ..aInt64(4, 'notifyID', protoName: 'notifyID')
    ..aInt64(5, 'frontID', protoName: 'frontID')
    ..aOM<$2.Message>(6, 'message', subBuilder: $2.Message.create)
    ..aInt64(7, 'roomID', protoName: 'roomID')
    ..aOB(8, 'store')
    ..aOB(9, 'broadcast')
    ..hasRequiredFields = false
  ;

  CNotifyArg._() : super();
  factory CNotifyArg() => create();
  factory CNotifyArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CNotifyArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CNotifyArg clone() => CNotifyArg()..mergeFromMessage(this);
  CNotifyArg copyWith(void Function(CNotifyArg) updates) => super.copyWith((message) => updates(message as CNotifyArg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CNotifyArg create() => CNotifyArg._();
  CNotifyArg createEmptyInstance() => create();
  static $pb.PbList<CNotifyArg> createRepeated() => $pb.PbList<CNotifyArg>();
  @$core.pragma('dart2js:noInline')
  static CNotifyArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CNotifyArg>(create);
  static CNotifyArg _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userID => $_getI64(0);
  @$pb.TagNumber(1)
  set userID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get authKey => $_getI64(1);
  @$pb.TagNumber(2)
  set authKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get os => $_getIZ(2);
  @$pb.TagNumber(3)
  set os($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOs() => $_has(2);
  @$pb.TagNumber(3)
  void clearOs() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get notifyID => $_getI64(3);
  @$pb.TagNumber(4)
  set notifyID($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNotifyID() => $_has(3);
  @$pb.TagNumber(4)
  void clearNotifyID() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get frontID => $_getI64(4);
  @$pb.TagNumber(5)
  set frontID($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFrontID() => $_has(4);
  @$pb.TagNumber(5)
  void clearFrontID() => clearField(5);

  @$pb.TagNumber(6)
  $2.Message get message => $_getN(5);
  @$pb.TagNumber(6)
  set message($2.Message v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearMessage() => clearField(6);
  @$pb.TagNumber(6)
  $2.Message ensureMessage() => $_ensure(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get roomID => $_getI64(6);
  @$pb.TagNumber(7)
  set roomID($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRoomID() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomID() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get store => $_getBF(7);
  @$pb.TagNumber(8)
  set store($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStore() => $_has(7);
  @$pb.TagNumber(8)
  void clearStore() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get broadcast => $_getBF(8);
  @$pb.TagNumber(9)
  set broadcast($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBroadcast() => $_has(8);
  @$pb.TagNumber(9)
  void clearBroadcast() => clearField(9);
}

class CNotifyReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CNotifyReply', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CNotifyReply._() : super();
  factory CNotifyReply() => create();
  factory CNotifyReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CNotifyReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CNotifyReply clone() => CNotifyReply()..mergeFromMessage(this);
  CNotifyReply copyWith(void Function(CNotifyReply) updates) => super.copyWith((message) => updates(message as CNotifyReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CNotifyReply create() => CNotifyReply._();
  CNotifyReply createEmptyInstance() => create();
  static $pb.PbList<CNotifyReply> createRepeated() => $pb.PbList<CNotifyReply>();
  @$core.pragma('dart2js:noInline')
  static CNotifyReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CNotifyReply>(create);
  static CNotifyReply _defaultInstance;
}

class LogicApi {
  $pb.RpcClient _client;
  LogicApi(this._client);

  $async.Future<LogicResponse> handle($pb.ClientContext ctx, LogicArg request) {
    var emptyResponse = LogicResponse();
    return _client.invoke<LogicResponse>(ctx, 'Logic', 'Handle', request, emptyResponse);
  }
  $async.Future<NewConnResponse> newConnection($pb.ClientContext ctx, NewConnArg request) {
    var emptyResponse = NewConnResponse();
    return _client.invoke<NewConnResponse>(ctx, 'Logic', 'NewConnection', request, emptyResponse);
  }
  $async.Future<DisconnectResponse> disconnect($pb.ClientContext ctx, DisconnectArg request) {
    var emptyResponse = DisconnectResponse();
    return _client.invoke<DisconnectResponse>(ctx, 'Logic', 'Disconnect', request, emptyResponse);
  }
  $async.Future<CNotifyReply> cNotify($pb.ClientContext ctx, CNotifyArg request) {
    var emptyResponse = CNotifyReply();
    return _client.invoke<CNotifyReply>(ctx, 'Logic', 'CNotify', request, emptyResponse);
  }
  $async.Future<CNotifyReply> dNotify($pb.ClientContext ctx, CNotifyArg request) {
    var emptyResponse = CNotifyReply();
    return _client.invoke<CNotifyReply>(ctx, 'Logic', 'DNotify', request, emptyResponse);
  }
}

