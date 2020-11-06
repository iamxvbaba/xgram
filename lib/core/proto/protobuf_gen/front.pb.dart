///
//  Generated code. Do not modify.
//  source: front.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'abridged.pb.dart' as $1;

import 'front.pbenum.dart';

export 'front.pbenum.dart';

class EmptyArg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EmptyArg', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  EmptyArg._() : super();
  factory EmptyArg() => create();
  factory EmptyArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmptyArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EmptyArg clone() => EmptyArg()..mergeFromMessage(this);
  EmptyArg copyWith(void Function(EmptyArg) updates) => super.copyWith((message) => updates(message as EmptyArg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmptyArg create() => EmptyArg._();
  EmptyArg createEmptyInstance() => create();
  static $pb.PbList<EmptyArg> createRepeated() => $pb.PbList<EmptyArg>();
  @$core.pragma('dart2js:noInline')
  static EmptyArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmptyArg>(create);
  static EmptyArg _defaultInstance;
}

class EmptyResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EmptyResponse', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  EmptyResponse._() : super();
  factory EmptyResponse() => create();
  factory EmptyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmptyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EmptyResponse clone() => EmptyResponse()..mergeFromMessage(this);
  EmptyResponse copyWith(void Function(EmptyResponse) updates) => super.copyWith((message) => updates(message as EmptyResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmptyResponse create() => EmptyResponse._();
  EmptyResponse createEmptyInstance() => create();
  static $pb.PbList<EmptyResponse> createRepeated() => $pb.PbList<EmptyResponse>();
  @$core.pragma('dart2js:noInline')
  static EmptyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmptyResponse>(create);
  static EmptyResponse _defaultInstance;
}

class RoomUserPushInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RoomUserPushInfo', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aInt64(1, 'frontID', protoName: 'frontID')
    ..p<$fixnum.Int64>(2, 'authKey', $pb.PbFieldType.PU6, protoName: 'authKey')
    ..hasRequiredFields = false
  ;

  RoomUserPushInfo._() : super();
  factory RoomUserPushInfo() => create();
  factory RoomUserPushInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomUserPushInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RoomUserPushInfo clone() => RoomUserPushInfo()..mergeFromMessage(this);
  RoomUserPushInfo copyWith(void Function(RoomUserPushInfo) updates) => super.copyWith((message) => updates(message as RoomUserPushInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomUserPushInfo create() => RoomUserPushInfo._();
  RoomUserPushInfo createEmptyInstance() => create();
  static $pb.PbList<RoomUserPushInfo> createRepeated() => $pb.PbList<RoomUserPushInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomUserPushInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomUserPushInfo>(create);
  static RoomUserPushInfo _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get frontID => $_getI64(0);
  @$pb.TagNumber(1)
  set frontID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrontID() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrontID() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$fixnum.Int64> get authKey => $_getList(1);
}

class NotifyArg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NotifyArg', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aOM<$1.Proto>(1, 'p', subBuilder: $1.Proto.create)
    ..a<$fixnum.Int64>(2, 'authKey', $pb.PbFieldType.OU6, protoName: 'authKey', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(3, 'roomID', protoName: 'roomID')
    ..e<NotifyArg_PushType>(4, 'pushType', $pb.PbFieldType.OE, protoName: 'pushType', defaultOrMaker: NotifyArg_PushType.SingleChannel, valueOf: NotifyArg_PushType.valueOf, enumValues: NotifyArg_PushType.values)
    ..aInt64(5, 'frontID', protoName: 'frontID')
    ..aInt64(6, 'ntyID', protoName: 'ntyID')
    ..a<$core.List<$core.int>>(7, 'data', $pb.PbFieldType.OY)
    ..pc<RoomUserPushInfo>(8, 'roomPush', $pb.PbFieldType.PM, protoName: 'roomPush', subBuilder: RoomUserPushInfo.create)
    ..hasRequiredFields = false
  ;

  NotifyArg._() : super();
  factory NotifyArg() => create();
  factory NotifyArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotifyArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NotifyArg clone() => NotifyArg()..mergeFromMessage(this);
  NotifyArg copyWith(void Function(NotifyArg) updates) => super.copyWith((message) => updates(message as NotifyArg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NotifyArg create() => NotifyArg._();
  NotifyArg createEmptyInstance() => create();
  static $pb.PbList<NotifyArg> createRepeated() => $pb.PbList<NotifyArg>();
  @$core.pragma('dart2js:noInline')
  static NotifyArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotifyArg>(create);
  static NotifyArg _defaultInstance;

  @$pb.TagNumber(1)
  $1.Proto get p => $_getN(0);
  @$pb.TagNumber(1)
  set p($1.Proto v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasP() => $_has(0);
  @$pb.TagNumber(1)
  void clearP() => clearField(1);
  @$pb.TagNumber(1)
  $1.Proto ensureP() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get authKey => $_getI64(1);
  @$pb.TagNumber(2)
  set authKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthKey() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get roomID => $_getI64(2);
  @$pb.TagNumber(3)
  set roomID($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomID() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomID() => clearField(3);

  @$pb.TagNumber(4)
  NotifyArg_PushType get pushType => $_getN(3);
  @$pb.TagNumber(4)
  set pushType(NotifyArg_PushType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPushType() => $_has(3);
  @$pb.TagNumber(4)
  void clearPushType() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get frontID => $_getI64(4);
  @$pb.TagNumber(5)
  set frontID($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFrontID() => $_has(4);
  @$pb.TagNumber(5)
  void clearFrontID() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get ntyID => $_getI64(5);
  @$pb.TagNumber(6)
  set ntyID($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNtyID() => $_has(5);
  @$pb.TagNumber(6)
  void clearNtyID() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get data => $_getN(6);
  @$pb.TagNumber(7)
  set data($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasData() => $_has(6);
  @$pb.TagNumber(7)
  void clearData() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<RoomUserPushInfo> get roomPush => $_getList(7);
}

class FrontNotifyApi {
  $pb.RpcClient _client;
  FrontNotifyApi(this._client);

  $async.Future<EmptyResponse> push($pb.ClientContext ctx, NotifyArg request) {
    var emptyResponse = EmptyResponse();
    return _client.invoke<EmptyResponse>(ctx, 'FrontNotify', 'Push', request, emptyResponse);
  }
  $async.Future<EmptyResponse> pushRoom($pb.ClientContext ctx, NotifyArg request) {
    var emptyResponse = EmptyResponse();
    return _client.invoke<EmptyResponse>(ctx, 'FrontNotify', 'PushRoom', request, emptyResponse);
  }
  $async.Future<EmptyResponse> broadcast($pb.ClientContext ctx, NotifyArg request) {
    var emptyResponse = EmptyResponse();
    return _client.invoke<EmptyResponse>(ctx, 'FrontNotify', 'Broadcast', request, emptyResponse);
  }
  $async.Future<EmptyResponse> cPush($pb.ClientContext ctx, NotifyArg request) {
    var emptyResponse = EmptyResponse();
    return _client.invoke<EmptyResponse>(ctx, 'FrontNotify', 'CPush', request, emptyResponse);
  }
  $async.Future<EmptyResponse> dPush($pb.ClientContext ctx, NotifyArg request) {
    var emptyResponse = EmptyResponse();
    return _client.invoke<EmptyResponse>(ctx, 'FrontNotify', 'DPush', request, emptyResponse);
  }
}

