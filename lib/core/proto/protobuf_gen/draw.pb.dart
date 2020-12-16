///
//  Generated code. Do not modify.
//  source: draw.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $1;

import 'draw.pbenum.dart';

export 'draw.pbenum.dart';

class DrawParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DrawParam', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aInt64(1, 'roomID', protoName: 'roomID')
    ..e<DrawOP>(2, 'op', $pb.PbFieldType.OE, defaultOrMaker: DrawOP.p_draw, valueOf: DrawOP.valueOf, enumValues: DrawOP.values)
    ..aOS(3, 'pentColor', protoName: 'pentColor')
    ..a<$core.double>(4, 'pentSize', $pb.PbFieldType.OD, protoName: 'pentSize')
    ..a<$core.double>(5, 'dx', $pb.PbFieldType.OD)
    ..a<$core.double>(6, 'dy', $pb.PbFieldType.OD)
    ..a<$core.double>(7, 'scaleWidth', $pb.PbFieldType.OD, protoName: 'scaleWidth')
    ..a<$core.double>(8, 'scaleHeight', $pb.PbFieldType.OD, protoName: 'scaleHeight')
    ..aOM<$1.UserList>(9, 'list', subBuilder: $1.UserList.create)
    ..hasRequiredFields = false
  ;

  DrawParam._() : super();
  factory DrawParam() => create();
  factory DrawParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DrawParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DrawParam clone() => DrawParam()..mergeFromMessage(this);
  DrawParam copyWith(void Function(DrawParam) updates) => super.copyWith((message) => updates(message as DrawParam));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DrawParam create() => DrawParam._();
  DrawParam createEmptyInstance() => create();
  static $pb.PbList<DrawParam> createRepeated() => $pb.PbList<DrawParam>();
  @$core.pragma('dart2js:noInline')
  static DrawParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DrawParam>(create);
  static DrawParam _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomID => $_getI64(0);
  @$pb.TagNumber(1)
  set roomID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomID() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomID() => clearField(1);

  @$pb.TagNumber(2)
  DrawOP get op => $_getN(1);
  @$pb.TagNumber(2)
  set op(DrawOP v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOp() => $_has(1);
  @$pb.TagNumber(2)
  void clearOp() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pentColor => $_getSZ(2);
  @$pb.TagNumber(3)
  set pentColor($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPentColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearPentColor() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get pentSize => $_getN(3);
  @$pb.TagNumber(4)
  set pentSize($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPentSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearPentSize() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get dx => $_getN(4);
  @$pb.TagNumber(5)
  set dx($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDx() => $_has(4);
  @$pb.TagNumber(5)
  void clearDx() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get dy => $_getN(5);
  @$pb.TagNumber(6)
  set dy($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDy() => $_has(5);
  @$pb.TagNumber(6)
  void clearDy() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get scaleWidth => $_getN(6);
  @$pb.TagNumber(7)
  set scaleWidth($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasScaleWidth() => $_has(6);
  @$pb.TagNumber(7)
  void clearScaleWidth() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get scaleHeight => $_getN(7);
  @$pb.TagNumber(8)
  set scaleHeight($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasScaleHeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearScaleHeight() => clearField(8);

  @$pb.TagNumber(9)
  $1.UserList get list => $_getN(8);
  @$pb.TagNumber(9)
  set list($1.UserList v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasList() => $_has(8);
  @$pb.TagNumber(9)
  void clearList() => clearField(9);
  @$pb.TagNumber(9)
  $1.UserList ensureList() => $_ensure(8);
}

