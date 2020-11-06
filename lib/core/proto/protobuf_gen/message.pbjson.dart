///
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ContentType$json = const {
  '1': 'ContentType',
  '2': const [
    const {'1': 'normalText', '2': 0},
    const {'1': 'image', '2': 1},
    const {'1': 'emoji', '2': 18},
    const {'1': 'textAndLink', '2': 3},
    const {'1': 'imageAndLink', '2': 4},
    const {'1': 'textAndLinkAndTitle', '2': 5},
  ],
};

const SessionFrom$json = const {
  '1': 'SessionFrom',
  '2': const [
    const {'1': 's_none', '2': 0},
    const {'1': 's_index', '2': 1},
    const {'1': 's_room', '2': 2},
  ],
};

const GiftMessageInfo$json = const {
  '1': 'GiftMessageInfo',
  '2': const [
    const {'1': 'Sender', '3': 1, '4': 1, '5': 11, '6': '.api.User', '10': 'Sender'},
    const {'1': 'Receiver', '3': 2, '4': 3, '5': 11, '6': '.api.User', '10': 'Receiver'},
    const {'1': 'giftID', '3': 3, '4': 1, '5': 5, '10': 'giftID'},
    const {'1': 'giftNum', '3': 4, '4': 1, '5': 5, '10': 'giftNum'},
  ],
};

const MessageBody$json = const {
  '1': 'MessageBody',
  '2': const [
    const {'1': 'contentType', '3': 2, '4': 1, '5': 14, '6': '.api.ContentType', '10': 'contentType'},
    const {'1': 'msgID', '3': 3, '4': 1, '5': 3, '10': 'msgID'},
    const {'1': 'msg', '3': 4, '4': 1, '5': 9, '10': 'msg'},
    const {'1': 'sendTime', '3': 5, '4': 1, '5': 3, '10': 'sendTime'},
    const {'1': 'giftInfo', '3': 6, '4': 1, '5': 11, '6': '.api.GiftMessageInfo', '10': 'giftInfo'},
  ],
};

const MessageUser$json = const {
  '1': 'MessageUser',
  '2': const [
    const {'1': 'sender', '3': 1, '4': 1, '5': 11, '6': '.api.User', '10': 'sender'},
    const {'1': 'receiver', '3': 2, '4': 3, '5': 11, '6': '.api.User', '10': 'receiver'},
  ],
};

const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 3, '10': 'userID'},
    const {'1': 'senderID', '3': 2, '4': 1, '5': 3, '10': 'senderID'},
    const {'1': 'roomID', '3': 3, '4': 1, '5': 3, '10': 'roomID'},
    const {'1': 'body', '3': 4, '4': 1, '5': 11, '6': '.api.MessageBody', '10': 'body'},
    const {'1': 'ut', '3': 5, '4': 1, '5': 14, '6': '.api.UserType', '10': 'ut'},
    const {'1': 'eachInfo', '3': 6, '4': 1, '5': 11, '6': '.api.MessageUser', '10': 'eachInfo'},
  ],
};

const MessageList$json = const {
  '1': 'MessageList',
  '2': const [
    const {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.api.Message', '10': 'list'},
  ],
};

const Session$json = const {
  '1': 'Session',
  '2': const [
    const {'1': 'live', '3': 1, '4': 3, '5': 11, '6': '.api.User', '10': 'live'},
    const {'1': 'list', '3': 2, '4': 3, '5': 11, '6': '.api.Session.content', '10': 'list'},
  ],
  '3': const [Session_content$json],
};

const Session_content$json = const {
  '1': 'content',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.api.User', '10': 'user'},
    const {'1': 'msg', '3': 2, '4': 1, '5': 11, '6': '.api.Message', '10': 'msg'},
    const {'1': 'badge', '3': 3, '4': 1, '5': 5, '10': 'badge'},
    const {'1': 'follow', '3': 5, '4': 1, '5': 8, '10': 'follow'},
    const {'1': 'black', '3': 6, '4': 1, '5': 8, '10': 'black'},
  ],
};

const AddSessionArg$json = const {
  '1': 'AddSessionArg',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 3, '10': 'userID'},
    const {'1': 'from', '3': 2, '4': 1, '5': 14, '6': '.api.SessionFrom', '10': 'from'},
    const {'1': 'RoomID', '3': 3, '4': 1, '5': 3, '10': 'RoomID'},
  ],
};

const SessionHistoryArg$json = const {
  '1': 'SessionHistoryArg',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 3, '10': 'userID'},
    const {'1': 'sendTime', '3': 2, '4': 1, '5': 3, '10': 'sendTime'},
  ],
};

const DelSingleMessageArg$json = const {
  '1': 'DelSingleMessageArg',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 3, '10': 'userID'},
    const {'1': 'msgID', '3': 2, '4': 1, '5': 3, '10': 'msgID'},
    const {'1': 'previousMsg', '3': 3, '4': 1, '5': 11, '6': '.api.Message', '10': 'previousMsg'},
  ],
};

const MessageReceiveAckArg$json = const {
  '1': 'MessageReceiveAckArg',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 3, '10': 'userID'},
    const {'1': 'msgID', '3': 2, '4': 3, '5': 3, '10': 'msgID'},
  ],
};

const MessageReceiveAckMulArg$json = const {
  '1': 'MessageReceiveAckMulArg',
  '2': const [
    const {'1': 'ack', '3': 1, '4': 3, '5': 11, '6': '.api.MessageReceiveAckArg', '10': 'ack'},
  ],
};

