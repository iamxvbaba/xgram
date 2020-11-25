///
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ContentType extends $pb.ProtobufEnum {
  static const ContentType normalText = ContentType._(0, 'normalText');
  static const ContentType image = ContentType._(1, 'image');
  static const ContentType video = ContentType._(2, 'video');
  static const ContentType location = ContentType._(3, 'location');

  static const $core.List<ContentType> values = <ContentType> [
    normalText,
    image,
    video,
    location,
  ];

  static final $core.Map<$core.int, ContentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContentType valueOf($core.int value) => _byValue[value];

  const ContentType._($core.int v, $core.String n) : super(v, n);
}

class SessionFrom extends $pb.ProtobufEnum {
  static const SessionFrom s_none = SessionFrom._(0, 's_none');
  static const SessionFrom s_index = SessionFrom._(1, 's_index');
  static const SessionFrom s_room = SessionFrom._(2, 's_room');

  static const $core.List<SessionFrom> values = <SessionFrom> [
    s_none,
    s_index,
    s_room,
  ];

  static final $core.Map<$core.int, SessionFrom> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SessionFrom valueOf($core.int value) => _byValue[value];

  const SessionFrom._($core.int v, $core.String n) : super(v, n);
}

