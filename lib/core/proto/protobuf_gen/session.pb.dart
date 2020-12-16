///
//  Generated code. Do not modify.
//  source: session.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $1;
import 'message.pb.dart' as $4;

class Session_content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Session.content', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aOM<$1.User>(1, 'user', subBuilder: $1.User.create)
    ..aOM<$4.Message>(2, 'msg', subBuilder: $4.Message.create)
    ..a<$core.int>(3, 'badge', $pb.PbFieldType.O3)
    ..aOB(5, 'isOnline', protoName: 'isOnline')
    ..hasRequiredFields = false
  ;

  Session_content._() : super();
  factory Session_content() => create();
  factory Session_content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Session_content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Session_content clone() => Session_content()..mergeFromMessage(this);
  Session_content copyWith(void Function(Session_content) updates) => super.copyWith((message) => updates(message as Session_content));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Session_content create() => Session_content._();
  Session_content createEmptyInstance() => create();
  static $pb.PbList<Session_content> createRepeated() => $pb.PbList<Session_content>();
  @$core.pragma('dart2js:noInline')
  static Session_content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Session_content>(create);
  static Session_content _defaultInstance;

  @$pb.TagNumber(1)
  $1.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($1.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $1.User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $4.Message get msg => $_getN(1);
  @$pb.TagNumber(2)
  set msg($4.Message v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);
  @$pb.TagNumber(2)
  $4.Message ensureMsg() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get badge => $_getIZ(2);
  @$pb.TagNumber(3)
  set badge($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBadge() => $_has(2);
  @$pb.TagNumber(3)
  void clearBadge() => clearField(3);

  @$pb.TagNumber(5)
  $core.bool get isOnline => $_getBF(3);
  @$pb.TagNumber(5)
  set isOnline($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsOnline() => $_has(3);
  @$pb.TagNumber(5)
  void clearIsOnline() => clearField(5);
}

class Session extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Session', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..m<$fixnum.Int64, Session_content>(1, 'list', entryClassName: 'Session.ListEntry', keyFieldType: $pb.PbFieldType.O6, valueFieldType: $pb.PbFieldType.OM, valueCreator: Session_content.create, packageName: const $pb.PackageName('api'))
    ..hasRequiredFields = false
  ;

  Session._() : super();
  factory Session() => create();
  factory Session.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Session.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Session clone() => Session()..mergeFromMessage(this);
  Session copyWith(void Function(Session) updates) => super.copyWith((message) => updates(message as Session));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Session create() => Session._();
  Session createEmptyInstance() => create();
  static $pb.PbList<Session> createRepeated() => $pb.PbList<Session>();
  @$core.pragma('dart2js:noInline')
  static Session getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Session>(create);
  static Session _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$fixnum.Int64, Session_content> get list => $_getMap(0);
}

