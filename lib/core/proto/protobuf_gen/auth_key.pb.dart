///
//  Generated code. Do not modify.
//  source: auth_key.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ReqPQ extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReqPQ', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'nonce', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ReqPQ._() : super();
  factory ReqPQ() => create();
  factory ReqPQ.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqPQ.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ReqPQ clone() => ReqPQ()..mergeFromMessage(this);
  ReqPQ copyWith(void Function(ReqPQ) updates) => super.copyWith((message) => updates(message as ReqPQ));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqPQ create() => ReqPQ._();
  ReqPQ createEmptyInstance() => create();
  static $pb.PbList<ReqPQ> createRepeated() => $pb.PbList<ReqPQ>();
  @$core.pragma('dart2js:noInline')
  static ReqPQ getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqPQ>(create);
  static ReqPQ _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get nonce => $_getN(0);
  @$pb.TagNumber(1)
  set nonce($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);
}

class ResPQ extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResPQ', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'nonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'ServerNonce', $pb.PbFieldType.OY, protoName: 'ServerNonce')
    ..a<$core.List<$core.int>>(3, 'PQ', $pb.PbFieldType.OY, protoName: 'PQ')
    ..aInt64(4, 'ServerPublicKeyFingerprint', protoName: 'ServerPublicKeyFingerprint')
    ..hasRequiredFields = false
  ;

  ResPQ._() : super();
  factory ResPQ() => create();
  factory ResPQ.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResPQ.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResPQ clone() => ResPQ()..mergeFromMessage(this);
  ResPQ copyWith(void Function(ResPQ) updates) => super.copyWith((message) => updates(message as ResPQ));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPQ create() => ResPQ._();
  ResPQ createEmptyInstance() => create();
  static $pb.PbList<ResPQ> createRepeated() => $pb.PbList<ResPQ>();
  @$core.pragma('dart2js:noInline')
  static ResPQ getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResPQ>(create);
  static ResPQ _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get nonce => $_getN(0);
  @$pb.TagNumber(1)
  set nonce($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get serverNonce => $_getN(1);
  @$pb.TagNumber(2)
  set serverNonce($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServerNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerNonce() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get pQ => $_getN(2);
  @$pb.TagNumber(3)
  set pQ($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPQ() => $_has(2);
  @$pb.TagNumber(3)
  void clearPQ() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get serverPublicKeyFingerprint => $_getI64(3);
  @$pb.TagNumber(4)
  set serverPublicKeyFingerprint($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasServerPublicKeyFingerprint() => $_has(3);
  @$pb.TagNumber(4)
  void clearServerPublicKeyFingerprint() => clearField(4);
}

class ReqDHParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ReqDHParams', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'nonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'ServerNonce', $pb.PbFieldType.OY, protoName: 'ServerNonce')
    ..a<$core.List<$core.int>>(3, 'P', $pb.PbFieldType.OY, protoName: 'P')
    ..a<$core.List<$core.int>>(4, 'Q', $pb.PbFieldType.OY, protoName: 'Q')
    ..aInt64(5, 'PublicKeyFingerprint', protoName: 'PublicKeyFingerprint')
    ..a<$core.List<$core.int>>(6, 'EncryptedData', $pb.PbFieldType.OY, protoName: 'EncryptedData')
    ..hasRequiredFields = false
  ;

  ReqDHParams._() : super();
  factory ReqDHParams() => create();
  factory ReqDHParams.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqDHParams.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ReqDHParams clone() => ReqDHParams()..mergeFromMessage(this);
  ReqDHParams copyWith(void Function(ReqDHParams) updates) => super.copyWith((message) => updates(message as ReqDHParams));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReqDHParams create() => ReqDHParams._();
  ReqDHParams createEmptyInstance() => create();
  static $pb.PbList<ReqDHParams> createRepeated() => $pb.PbList<ReqDHParams>();
  @$core.pragma('dart2js:noInline')
  static ReqDHParams getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqDHParams>(create);
  static ReqDHParams _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get nonce => $_getN(0);
  @$pb.TagNumber(1)
  set nonce($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get serverNonce => $_getN(1);
  @$pb.TagNumber(2)
  set serverNonce($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServerNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerNonce() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get p => $_getN(2);
  @$pb.TagNumber(3)
  set p($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasP() => $_has(2);
  @$pb.TagNumber(3)
  void clearP() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get q => $_getN(3);
  @$pb.TagNumber(4)
  set q($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasQ() => $_has(3);
  @$pb.TagNumber(4)
  void clearQ() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get publicKeyFingerprint => $_getI64(4);
  @$pb.TagNumber(5)
  set publicKeyFingerprint($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPublicKeyFingerprint() => $_has(4);
  @$pb.TagNumber(5)
  void clearPublicKeyFingerprint() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get encryptedData => $_getN(5);
  @$pb.TagNumber(6)
  set encryptedData($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEncryptedData() => $_has(5);
  @$pb.TagNumber(6)
  void clearEncryptedData() => clearField(6);
}

class PQInnerData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PQInnerData', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'PQ', $pb.PbFieldType.OY, protoName: 'PQ')
    ..a<$core.List<$core.int>>(2, 'P', $pb.PbFieldType.OY, protoName: 'P')
    ..a<$core.List<$core.int>>(3, 'Q', $pb.PbFieldType.OY, protoName: 'Q')
    ..a<$core.List<$core.int>>(4, 'nonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(5, 'serverNonce', $pb.PbFieldType.OY, protoName: 'serverNonce')
    ..a<$core.List<$core.int>>(6, 'newNonce', $pb.PbFieldType.OY, protoName: 'newNonce')
    ..a<$core.int>(7, 'dc', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  PQInnerData._() : super();
  factory PQInnerData() => create();
  factory PQInnerData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PQInnerData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PQInnerData clone() => PQInnerData()..mergeFromMessage(this);
  PQInnerData copyWith(void Function(PQInnerData) updates) => super.copyWith((message) => updates(message as PQInnerData));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PQInnerData create() => PQInnerData._();
  PQInnerData createEmptyInstance() => create();
  static $pb.PbList<PQInnerData> createRepeated() => $pb.PbList<PQInnerData>();
  @$core.pragma('dart2js:noInline')
  static PQInnerData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PQInnerData>(create);
  static PQInnerData _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get pQ => $_getN(0);
  @$pb.TagNumber(1)
  set pQ($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPQ() => $_has(0);
  @$pb.TagNumber(1)
  void clearPQ() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get p => $_getN(1);
  @$pb.TagNumber(2)
  set p($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasP() => $_has(1);
  @$pb.TagNumber(2)
  void clearP() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get q => $_getN(2);
  @$pb.TagNumber(3)
  set q($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQ() => $_has(2);
  @$pb.TagNumber(3)
  void clearQ() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get nonce => $_getN(3);
  @$pb.TagNumber(4)
  set nonce($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNonce() => $_has(3);
  @$pb.TagNumber(4)
  void clearNonce() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get serverNonce => $_getN(4);
  @$pb.TagNumber(5)
  set serverNonce($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasServerNonce() => $_has(4);
  @$pb.TagNumber(5)
  void clearServerNonce() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get newNonce => $_getN(5);
  @$pb.TagNumber(6)
  set newNonce($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNewNonce() => $_has(5);
  @$pb.TagNumber(6)
  void clearNewNonce() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get dc => $_getIZ(6);
  @$pb.TagNumber(7)
  set dc($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDc() => $_has(6);
  @$pb.TagNumber(7)
  void clearDc() => clearField(7);
}

class ResDHParamsOK extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResDHParamsOK', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'nonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'ServerNonce', $pb.PbFieldType.OY, protoName: 'ServerNonce')
    ..a<$core.List<$core.int>>(3, 'EncryptedAnswer', $pb.PbFieldType.OY, protoName: 'EncryptedAnswer')
    ..hasRequiredFields = false
  ;

  ResDHParamsOK._() : super();
  factory ResDHParamsOK() => create();
  factory ResDHParamsOK.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResDHParamsOK.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResDHParamsOK clone() => ResDHParamsOK()..mergeFromMessage(this);
  ResDHParamsOK copyWith(void Function(ResDHParamsOK) updates) => super.copyWith((message) => updates(message as ResDHParamsOK));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDHParamsOK create() => ResDHParamsOK._();
  ResDHParamsOK createEmptyInstance() => create();
  static $pb.PbList<ResDHParamsOK> createRepeated() => $pb.PbList<ResDHParamsOK>();
  @$core.pragma('dart2js:noInline')
  static ResDHParamsOK getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResDHParamsOK>(create);
  static ResDHParamsOK _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get nonce => $_getN(0);
  @$pb.TagNumber(1)
  set nonce($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get serverNonce => $_getN(1);
  @$pb.TagNumber(2)
  set serverNonce($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServerNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerNonce() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get encryptedAnswer => $_getN(2);
  @$pb.TagNumber(3)
  set encryptedAnswer($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEncryptedAnswer() => $_has(2);
  @$pb.TagNumber(3)
  void clearEncryptedAnswer() => clearField(3);
}

class ServerDHInnerData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ServerDHInnerData', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'nonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'ServerNonce', $pb.PbFieldType.OY, protoName: 'ServerNonce')
    ..a<$core.int>(3, 'G', $pb.PbFieldType.O3, protoName: 'G')
    ..aOS(4, 'DhPrime', protoName: 'DhPrime')
    ..aOS(5, 'GA', protoName: 'GA')
    ..a<$core.int>(6, 'ServerTime', $pb.PbFieldType.O3, protoName: 'ServerTime')
    ..hasRequiredFields = false
  ;

  ServerDHInnerData._() : super();
  factory ServerDHInnerData() => create();
  factory ServerDHInnerData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerDHInnerData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ServerDHInnerData clone() => ServerDHInnerData()..mergeFromMessage(this);
  ServerDHInnerData copyWith(void Function(ServerDHInnerData) updates) => super.copyWith((message) => updates(message as ServerDHInnerData));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServerDHInnerData create() => ServerDHInnerData._();
  ServerDHInnerData createEmptyInstance() => create();
  static $pb.PbList<ServerDHInnerData> createRepeated() => $pb.PbList<ServerDHInnerData>();
  @$core.pragma('dart2js:noInline')
  static ServerDHInnerData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerDHInnerData>(create);
  static ServerDHInnerData _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get nonce => $_getN(0);
  @$pb.TagNumber(1)
  set nonce($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get serverNonce => $_getN(1);
  @$pb.TagNumber(2)
  set serverNonce($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServerNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerNonce() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get g => $_getIZ(2);
  @$pb.TagNumber(3)
  set g($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasG() => $_has(2);
  @$pb.TagNumber(3)
  void clearG() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get dhPrime => $_getSZ(3);
  @$pb.TagNumber(4)
  set dhPrime($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDhPrime() => $_has(3);
  @$pb.TagNumber(4)
  void clearDhPrime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get gA => $_getSZ(4);
  @$pb.TagNumber(5)
  set gA($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGA() => $_has(4);
  @$pb.TagNumber(5)
  void clearGA() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get serverTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set serverTime($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasServerTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearServerTime() => clearField(6);
}

class ClientDHParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ClientDHParams', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'nonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'ServerNonce', $pb.PbFieldType.OY, protoName: 'ServerNonce')
    ..a<$core.List<$core.int>>(4, 'EncryptedData', $pb.PbFieldType.OY, protoName: 'EncryptedData')
    ..hasRequiredFields = false
  ;

  ClientDHParams._() : super();
  factory ClientDHParams() => create();
  factory ClientDHParams.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientDHParams.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ClientDHParams clone() => ClientDHParams()..mergeFromMessage(this);
  ClientDHParams copyWith(void Function(ClientDHParams) updates) => super.copyWith((message) => updates(message as ClientDHParams));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClientDHParams create() => ClientDHParams._();
  ClientDHParams createEmptyInstance() => create();
  static $pb.PbList<ClientDHParams> createRepeated() => $pb.PbList<ClientDHParams>();
  @$core.pragma('dart2js:noInline')
  static ClientDHParams getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientDHParams>(create);
  static ClientDHParams _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get nonce => $_getN(0);
  @$pb.TagNumber(1)
  set nonce($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get serverNonce => $_getN(1);
  @$pb.TagNumber(2)
  set serverNonce($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServerNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerNonce() => clearField(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get encryptedData => $_getN(2);
  @$pb.TagNumber(4)
  set encryptedData($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasEncryptedData() => $_has(2);
  @$pb.TagNumber(4)
  void clearEncryptedData() => clearField(4);
}

class ClientDHInnerData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ClientDHInnerData', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'nonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'ServerNonce', $pb.PbFieldType.OY, protoName: 'ServerNonce')
    ..aInt64(3, 'RetryID', protoName: 'RetryID')
    ..a<$core.List<$core.int>>(4, 'GB', $pb.PbFieldType.OY, protoName: 'GB')
    ..hasRequiredFields = false
  ;

  ClientDHInnerData._() : super();
  factory ClientDHInnerData() => create();
  factory ClientDHInnerData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientDHInnerData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ClientDHInnerData clone() => ClientDHInnerData()..mergeFromMessage(this);
  ClientDHInnerData copyWith(void Function(ClientDHInnerData) updates) => super.copyWith((message) => updates(message as ClientDHInnerData));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClientDHInnerData create() => ClientDHInnerData._();
  ClientDHInnerData createEmptyInstance() => create();
  static $pb.PbList<ClientDHInnerData> createRepeated() => $pb.PbList<ClientDHInnerData>();
  @$core.pragma('dart2js:noInline')
  static ClientDHInnerData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientDHInnerData>(create);
  static ClientDHInnerData _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get nonce => $_getN(0);
  @$pb.TagNumber(1)
  set nonce($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNonce() => $_has(0);
  @$pb.TagNumber(1)
  void clearNonce() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get serverNonce => $_getN(1);
  @$pb.TagNumber(2)
  set serverNonce($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServerNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerNonce() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get retryID => $_getI64(2);
  @$pb.TagNumber(3)
  set retryID($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRetryID() => $_has(2);
  @$pb.TagNumber(3)
  void clearRetryID() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get gB => $_getN(3);
  @$pb.TagNumber(4)
  set gB($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGB() => $_has(3);
  @$pb.TagNumber(4)
  void clearGB() => clearField(4);
}

class DH_GEN extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DH_GEN', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aOB(1, 'result')
    ..a<$core.List<$core.int>>(2, 'nonce', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'ServerNonce', $pb.PbFieldType.OY, protoName: 'ServerNonce')
    ..a<$core.List<$core.int>>(4, 'NewNonceHash1', $pb.PbFieldType.OY, protoName: 'NewNonceHash1')
    ..hasRequiredFields = false
  ;

  DH_GEN._() : super();
  factory DH_GEN() => create();
  factory DH_GEN.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DH_GEN.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DH_GEN clone() => DH_GEN()..mergeFromMessage(this);
  DH_GEN copyWith(void Function(DH_GEN) updates) => super.copyWith((message) => updates(message as DH_GEN));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DH_GEN create() => DH_GEN._();
  DH_GEN createEmptyInstance() => create();
  static $pb.PbList<DH_GEN> createRepeated() => $pb.PbList<DH_GEN>();
  @$core.pragma('dart2js:noInline')
  static DH_GEN getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DH_GEN>(create);
  static DH_GEN _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get nonce => $_getN(1);
  @$pb.TagNumber(2)
  set nonce($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonce() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get serverNonce => $_getN(2);
  @$pb.TagNumber(3)
  set serverNonce($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasServerNonce() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerNonce() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get newNonceHash1 => $_getN(3);
  @$pb.TagNumber(4)
  set newNonceHash1($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNewNonceHash1() => $_has(3);
  @$pb.TagNumber(4)
  void clearNewNonceHash1() => clearField(4);
}

