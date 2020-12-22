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
  ],
};

const MessageBody$json = const {
  '1': 'MessageBody',
  '2': const [
    const {'1': 'contentType', '3': 2, '4': 1, '5': 14, '6': '.api.ContentType', '10': 'contentType'},
    const {'1': 'msgID', '3': 3, '4': 1, '5': 3, '10': 'msgID'},
    const {'1': 'msg', '3': 4, '4': 1, '5': 9, '10': 'msg'},
    const {'1': 'sendTime', '3': 5, '4': 1, '5': 3, '10': 'sendTime'},
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

