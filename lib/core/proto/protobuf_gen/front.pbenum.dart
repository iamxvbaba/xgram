///
//  Generated code. Do not modify.
//  source: front.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class NotifyArg_PushType extends $pb.ProtobufEnum {
  static const NotifyArg_PushType SingleChannel = NotifyArg_PushType._(0, 'SingleChannel');
  static const NotifyArg_PushType RoomChannel = NotifyArg_PushType._(1, 'RoomChannel');
  static const NotifyArg_PushType Broadcast = NotifyArg_PushType._(2, 'Broadcast');
  static const NotifyArg_PushType CSysNty = NotifyArg_PushType._(3, 'CSysNty');
  static const NotifyArg_PushType DSysNty = NotifyArg_PushType._(4, 'DSysNty');

  static const $core.List<NotifyArg_PushType> values = <NotifyArg_PushType> [
    SingleChannel,
    RoomChannel,
    Broadcast,
    CSysNty,
    DSysNty,
  ];

  static final $core.Map<$core.int, NotifyArg_PushType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NotifyArg_PushType valueOf($core.int value) => _byValue[value];

  const NotifyArg_PushType._($core.int v, $core.String n) : super(v, n);
}

