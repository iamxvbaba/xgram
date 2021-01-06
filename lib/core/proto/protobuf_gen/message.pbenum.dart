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
  static const ContentType voice = ContentType._(2, 'voice');
  static const ContentType emoji = ContentType._(3, 'emoji');
  static const ContentType extra = ContentType._(4, 'extra');

  static const $core.List<ContentType> values = <ContentType> [
    normalText,
    image,
    voice,
    emoji,
    extra,
  ];

  static final $core.Map<$core.int, ContentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContentType valueOf($core.int value) => _byValue[value];

  const ContentType._($core.int v, $core.String n) : super(v, n);
}

