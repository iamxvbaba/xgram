///
//  Generated code. Do not modify.
//  source: draw.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class DrawOP extends $pb.ProtobufEnum {
  static const DrawOP p_draw = DrawOP._(0, 'p_draw');
  static const DrawOP p_drawNull = DrawOP._(1, 'p_drawNull');
  static const DrawOP p_clear = DrawOP._(2, 'p_clear');
  static const DrawOP p_undo = DrawOP._(3, 'p_undo');
  static const DrawOP p_reverseUndo = DrawOP._(4, 'p_reverseUndo');

  static const $core.List<DrawOP> values = <DrawOP> [
    p_draw,
    p_drawNull,
    p_clear,
    p_undo,
    p_reverseUndo,
  ];

  static final $core.Map<$core.int, DrawOP> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DrawOP valueOf($core.int value) => _byValue[value];

  const DrawOP._($core.int v, $core.String n) : super(v, n);
}

