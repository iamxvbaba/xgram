///
//  Generated code. Do not modify.
//  source: abridged.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class OP extends $pb.ProtobufEnum {
  static const OP needDH = OP._(0, 'needDH');
  static const OP reqPQ = OP._(1, 'reqPQ');
  static const OP resPQ = OP._(2, 'resPQ');
  static const OP reqDHParams = OP._(3, 'reqDHParams');
  static const OP resDHParamsOK = OP._(4, 'resDHParamsOK');
  static const OP clientDHParams = OP._(5, 'clientDHParams');
  static const OP dhGenResult = OP._(6, 'dhGenResult');
  static const OP needLogin = OP._(7, 'needLogin');
  static const OP loginOrRegister = OP._(8, 'loginOrRegister');
  static const OP logout = OP._(9, 'logout');
  static const OP channelReady = OP._(-100, 'channelReady');
  static const OP channelFinished = OP._(-200, 'channelFinished');
  static const OP testData = OP._(200, 'testData');
  static const OP testDataResp = OP._(201, 'testDataResp');
  static const OP pushSingle = OP._(301, 'pushSingle');
  static const OP receiveSingle = OP._(302, 'receiveSingle');
  static const OP SystemNotifyC = OP._(100000001, 'SystemNotifyC');
  static const OP SystemNotifyD = OP._(100000002, 'SystemNotifyD');

  static const $core.List<OP> values = <OP> [
    needDH,
    reqPQ,
    resPQ,
    reqDHParams,
    resDHParamsOK,
    clientDHParams,
    dhGenResult,
    needLogin,
    loginOrRegister,
    logout,
    channelReady,
    channelFinished,
    testData,
    testDataResp,
    pushSingle,
    receiveSingle,
    SystemNotifyC,
    SystemNotifyD,
  ];

  static final $core.Map<$core.int, OP> _byValue = $pb.ProtobufEnum.initByValue(values);
  static OP valueOf($core.int value) => _byValue[value];

  const OP._($core.int v, $core.String n) : super(v, n);
}

