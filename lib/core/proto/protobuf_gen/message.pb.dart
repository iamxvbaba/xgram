///
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $1;

import 'message.pbenum.dart';
import 'account_enum.pbenum.dart' as $0;

export 'message.pbenum.dart';

class GiftMessageInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GiftMessageInfo', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aOM<$1.User>(1, 'Sender', protoName: 'Sender', subBuilder: $1.User.create)
    ..pc<$1.User>(2, 'Receiver', $pb.PbFieldType.PM, protoName: 'Receiver', subBuilder: $1.User.create)
    ..a<$core.int>(3, 'giftID', $pb.PbFieldType.O3, protoName: 'giftID')
    ..a<$core.int>(4, 'giftNum', $pb.PbFieldType.O3, protoName: 'giftNum')
    ..hasRequiredFields = false
  ;

  GiftMessageInfo._() : super();
  factory GiftMessageInfo() => create();
  factory GiftMessageInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GiftMessageInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GiftMessageInfo clone() => GiftMessageInfo()..mergeFromMessage(this);
  GiftMessageInfo copyWith(void Function(GiftMessageInfo) updates) => super.copyWith((message) => updates(message as GiftMessageInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftMessageInfo create() => GiftMessageInfo._();
  GiftMessageInfo createEmptyInstance() => create();
  static $pb.PbList<GiftMessageInfo> createRepeated() => $pb.PbList<GiftMessageInfo>();
  @$core.pragma('dart2js:noInline')
  static GiftMessageInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GiftMessageInfo>(create);
  static GiftMessageInfo _defaultInstance;

  @$pb.TagNumber(1)
  $1.User get sender => $_getN(0);
  @$pb.TagNumber(1)
  set sender($1.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);
  @$pb.TagNumber(1)
  $1.User ensureSender() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$1.User> get receiver => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get giftID => $_getIZ(2);
  @$pb.TagNumber(3)
  set giftID($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGiftID() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftID() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get giftNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set giftNum($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGiftNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftNum() => clearField(4);
}

class MessageBody extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MessageBody', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..e<ContentType>(2, 'contentType', $pb.PbFieldType.OE, protoName: 'contentType', defaultOrMaker: ContentType.normalText, valueOf: ContentType.valueOf, enumValues: ContentType.values)
    ..aInt64(3, 'msgID', protoName: 'msgID')
    ..aOS(4, 'msg')
    ..aInt64(5, 'sendTime', protoName: 'sendTime')
    ..aOM<GiftMessageInfo>(6, 'giftInfo', protoName: 'giftInfo', subBuilder: GiftMessageInfo.create)
    ..hasRequiredFields = false
  ;

  MessageBody._() : super();
  factory MessageBody() => create();
  factory MessageBody.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageBody.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MessageBody clone() => MessageBody()..mergeFromMessage(this);
  MessageBody copyWith(void Function(MessageBody) updates) => super.copyWith((message) => updates(message as MessageBody));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageBody create() => MessageBody._();
  MessageBody createEmptyInstance() => create();
  static $pb.PbList<MessageBody> createRepeated() => $pb.PbList<MessageBody>();
  @$core.pragma('dart2js:noInline')
  static MessageBody getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageBody>(create);
  static MessageBody _defaultInstance;

  @$pb.TagNumber(2)
  ContentType get contentType => $_getN(0);
  @$pb.TagNumber(2)
  set contentType(ContentType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContentType() => $_has(0);
  @$pb.TagNumber(2)
  void clearContentType() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get msgID => $_getI64(1);
  @$pb.TagNumber(3)
  set msgID($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsgID() => $_has(1);
  @$pb.TagNumber(3)
  void clearMsgID() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(4)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(4)
  void clearMsg() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get sendTime => $_getI64(3);
  @$pb.TagNumber(5)
  set sendTime($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasSendTime() => $_has(3);
  @$pb.TagNumber(5)
  void clearSendTime() => clearField(5);

  @$pb.TagNumber(6)
  GiftMessageInfo get giftInfo => $_getN(4);
  @$pb.TagNumber(6)
  set giftInfo(GiftMessageInfo v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasGiftInfo() => $_has(4);
  @$pb.TagNumber(6)
  void clearGiftInfo() => clearField(6);
  @$pb.TagNumber(6)
  GiftMessageInfo ensureGiftInfo() => $_ensure(4);
}

class MessageUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MessageUser', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aOM<$1.User>(1, 'sender', subBuilder: $1.User.create)
    ..pc<$1.User>(2, 'receiver', $pb.PbFieldType.PM, subBuilder: $1.User.create)
    ..hasRequiredFields = false
  ;

  MessageUser._() : super();
  factory MessageUser() => create();
  factory MessageUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MessageUser clone() => MessageUser()..mergeFromMessage(this);
  MessageUser copyWith(void Function(MessageUser) updates) => super.copyWith((message) => updates(message as MessageUser));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageUser create() => MessageUser._();
  MessageUser createEmptyInstance() => create();
  static $pb.PbList<MessageUser> createRepeated() => $pb.PbList<MessageUser>();
  @$core.pragma('dart2js:noInline')
  static MessageUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageUser>(create);
  static MessageUser _defaultInstance;

  @$pb.TagNumber(1)
  $1.User get sender => $_getN(0);
  @$pb.TagNumber(1)
  set sender($1.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);
  @$pb.TagNumber(1)
  $1.User ensureSender() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$1.User> get receiver => $_getList(1);
}

class Message extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Message', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aInt64(1, 'userID', protoName: 'userID')
    ..aInt64(2, 'senderID', protoName: 'senderID')
    ..aInt64(3, 'roomID', protoName: 'roomID')
    ..aOM<MessageBody>(4, 'body', subBuilder: MessageBody.create)
    ..e<$0.UserType>(5, 'ut', $pb.PbFieldType.OE, defaultOrMaker: $0.UserType.ut_none, valueOf: $0.UserType.valueOf, enumValues: $0.UserType.values)
    ..aOM<MessageUser>(6, 'eachInfo', protoName: 'eachInfo', subBuilder: MessageUser.create)
    ..hasRequiredFields = false
  ;

  Message._() : super();
  factory Message() => create();
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Message clone() => Message()..mergeFromMessage(this);
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userID => $_getI64(0);
  @$pb.TagNumber(1)
  set userID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get senderID => $_getI64(1);
  @$pb.TagNumber(2)
  set senderID($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSenderID() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderID() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get roomID => $_getI64(2);
  @$pb.TagNumber(3)
  set roomID($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomID() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomID() => clearField(3);

  @$pb.TagNumber(4)
  MessageBody get body => $_getN(3);
  @$pb.TagNumber(4)
  set body(MessageBody v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBody() => $_has(3);
  @$pb.TagNumber(4)
  void clearBody() => clearField(4);
  @$pb.TagNumber(4)
  MessageBody ensureBody() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.UserType get ut => $_getN(4);
  @$pb.TagNumber(5)
  set ut($0.UserType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUt() => $_has(4);
  @$pb.TagNumber(5)
  void clearUt() => clearField(5);

  @$pb.TagNumber(6)
  MessageUser get eachInfo => $_getN(5);
  @$pb.TagNumber(6)
  set eachInfo(MessageUser v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasEachInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearEachInfo() => clearField(6);
  @$pb.TagNumber(6)
  MessageUser ensureEachInfo() => $_ensure(5);
}

class MessageList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MessageList', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..pc<Message>(1, 'list', $pb.PbFieldType.PM, subBuilder: Message.create)
    ..hasRequiredFields = false
  ;

  MessageList._() : super();
  factory MessageList() => create();
  factory MessageList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MessageList clone() => MessageList()..mergeFromMessage(this);
  MessageList copyWith(void Function(MessageList) updates) => super.copyWith((message) => updates(message as MessageList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageList create() => MessageList._();
  MessageList createEmptyInstance() => create();
  static $pb.PbList<MessageList> createRepeated() => $pb.PbList<MessageList>();
  @$core.pragma('dart2js:noInline')
  static MessageList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageList>(create);
  static MessageList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Message> get list => $_getList(0);
}

class DelSingleMessageArg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DelSingleMessageArg', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aInt64(1, 'userID', protoName: 'userID')
    ..aInt64(2, 'msgID', protoName: 'msgID')
    ..aOM<Message>(3, 'previousMsg', protoName: 'previousMsg', subBuilder: Message.create)
    ..hasRequiredFields = false
  ;

  DelSingleMessageArg._() : super();
  factory DelSingleMessageArg() => create();
  factory DelSingleMessageArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelSingleMessageArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DelSingleMessageArg clone() => DelSingleMessageArg()..mergeFromMessage(this);
  DelSingleMessageArg copyWith(void Function(DelSingleMessageArg) updates) => super.copyWith((message) => updates(message as DelSingleMessageArg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DelSingleMessageArg create() => DelSingleMessageArg._();
  DelSingleMessageArg createEmptyInstance() => create();
  static $pb.PbList<DelSingleMessageArg> createRepeated() => $pb.PbList<DelSingleMessageArg>();
  @$core.pragma('dart2js:noInline')
  static DelSingleMessageArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelSingleMessageArg>(create);
  static DelSingleMessageArg _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userID => $_getI64(0);
  @$pb.TagNumber(1)
  set userID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get msgID => $_getI64(1);
  @$pb.TagNumber(2)
  set msgID($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsgID() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsgID() => clearField(2);

  @$pb.TagNumber(3)
  Message get previousMsg => $_getN(2);
  @$pb.TagNumber(3)
  set previousMsg(Message v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPreviousMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreviousMsg() => clearField(3);
  @$pb.TagNumber(3)
  Message ensurePreviousMsg() => $_ensure(2);
}

class MessageReceiveAckArg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MessageReceiveAckArg', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..aInt64(1, 'userID', protoName: 'userID')
    ..p<$fixnum.Int64>(2, 'msgID', $pb.PbFieldType.P6, protoName: 'msgID')
    ..hasRequiredFields = false
  ;

  MessageReceiveAckArg._() : super();
  factory MessageReceiveAckArg() => create();
  factory MessageReceiveAckArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageReceiveAckArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MessageReceiveAckArg clone() => MessageReceiveAckArg()..mergeFromMessage(this);
  MessageReceiveAckArg copyWith(void Function(MessageReceiveAckArg) updates) => super.copyWith((message) => updates(message as MessageReceiveAckArg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageReceiveAckArg create() => MessageReceiveAckArg._();
  MessageReceiveAckArg createEmptyInstance() => create();
  static $pb.PbList<MessageReceiveAckArg> createRepeated() => $pb.PbList<MessageReceiveAckArg>();
  @$core.pragma('dart2js:noInline')
  static MessageReceiveAckArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageReceiveAckArg>(create);
  static MessageReceiveAckArg _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userID => $_getI64(0);
  @$pb.TagNumber(1)
  set userID($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$fixnum.Int64> get msgID => $_getList(1);
}

class MessageReceiveAckMulArg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MessageReceiveAckMulArg', package: const $pb.PackageName('api'), createEmptyInstance: create)
    ..pc<MessageReceiveAckArg>(1, 'ack', $pb.PbFieldType.PM, subBuilder: MessageReceiveAckArg.create)
    ..hasRequiredFields = false
  ;

  MessageReceiveAckMulArg._() : super();
  factory MessageReceiveAckMulArg() => create();
  factory MessageReceiveAckMulArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageReceiveAckMulArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MessageReceiveAckMulArg clone() => MessageReceiveAckMulArg()..mergeFromMessage(this);
  MessageReceiveAckMulArg copyWith(void Function(MessageReceiveAckMulArg) updates) => super.copyWith((message) => updates(message as MessageReceiveAckMulArg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageReceiveAckMulArg create() => MessageReceiveAckMulArg._();
  MessageReceiveAckMulArg createEmptyInstance() => create();
  static $pb.PbList<MessageReceiveAckMulArg> createRepeated() => $pb.PbList<MessageReceiveAckMulArg>();
  @$core.pragma('dart2js:noInline')
  static MessageReceiveAckMulArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageReceiveAckMulArg>(create);
  static MessageReceiveAckMulArg _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MessageReceiveAckArg> get ack => $_getList(0);
}

