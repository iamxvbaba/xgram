///
//  Generated code. Do not modify.
//  source: logic.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'abridged.pbjson.dart' as $3;
import 'message.pbjson.dart' as $2;
import 'user.pbjson.dart' as $1;

const LogicArg$json = const {
  '1': 'LogicArg',
  '2': const [
    const {'1': 'p', '3': 1, '4': 1, '5': 11, '6': '.api.Proto', '10': 'p'},
    const {'1': 'userID', '3': 2, '4': 1, '5': 3, '10': 'userID'},
    const {'1': 'authKeyID', '3': 3, '4': 1, '5': 4, '10': 'authKeyID'},
    const {'1': 'IP', '3': 4, '4': 1, '5': 9, '10': 'IP'},
    const {'1': 'Device', '3': 5, '4': 1, '5': 9, '10': 'Device'},
    const {'1': 'Version', '3': 6, '4': 1, '5': 9, '10': 'Version'},
    const {'1': 'os', '3': 7, '4': 1, '5': 5, '10': 'os'},
  ],
};

const LogicResponse$json = const {
  '1': 'LogicResponse',
  '2': const [
    const {'1': 'changeOP', '3': 1, '4': 1, '5': 8, '10': 'changeOP'},
    const {'1': 'op', '3': 2, '4': 1, '5': 14, '6': '.api.OP', '10': 'op'},
    const {'1': 'accountStatus', '3': 3, '4': 1, '5': 14, '6': '.api.AccountStatus', '10': 'accountStatus'},
    const {'1': 'authStatus', '3': 4, '4': 1, '5': 14, '6': '.api.AuthStatus', '10': 'authStatus'},
    const {'1': 'roomID', '3': 6, '4': 1, '5': 3, '10': 'roomID'},
    const {'1': 'userID', '3': 7, '4': 1, '5': 3, '10': 'userID'},
    const {'1': 'os', '3': 8, '4': 1, '5': 5, '10': 'os'},
    const {'1': 'Device', '3': 9, '4': 1, '5': 9, '10': 'Device'},
    const {'1': 'Version', '3': 10, '4': 1, '5': 9, '10': 'Version'},
    const {'1': 'resp', '3': 5, '4': 1, '5': 11, '6': '.api.Response', '10': 'resp'},
  ],
};

const NewConnArg$json = const {
  '1': 'NewConnArg',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 3, '10': 'userID'},
    const {'1': 'authKey', '3': 2, '4': 1, '5': 4, '10': 'authKey'},
    const {'1': 'ip', '3': 3, '4': 1, '5': 9, '10': 'ip'},
    const {'1': 'connID', '3': 4, '4': 1, '5': 3, '10': 'connID'},
    const {'1': 'serverName', '3': 5, '4': 1, '5': 9, '10': 'serverName'},
    const {'1': 'frontID', '3': 6, '4': 1, '5': 3, '10': 'frontID'},
  ],
};

const NewConnResponse$json = const {
  '1': 'NewConnResponse',
};

const DisconnectArg$json = const {
  '1': 'DisconnectArg',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 3, '10': 'userID'},
    const {'1': 'authKey', '3': 2, '4': 1, '5': 4, '10': 'authKey'},
    const {'1': 'connID', '3': 3, '4': 1, '5': 3, '10': 'connID'},
    const {'1': 'serverName', '3': 4, '4': 1, '5': 9, '10': 'serverName'},
  ],
};

const DisconnectResponse$json = const {
  '1': 'DisconnectResponse',
};

const CNotifyArg$json = const {
  '1': 'CNotifyArg',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 3, '10': 'userID'},
    const {'1': 'authKey', '3': 2, '4': 1, '5': 4, '10': 'authKey'},
    const {'1': 'os', '3': 3, '4': 1, '5': 5, '10': 'os'},
    const {'1': 'notifyID', '3': 4, '4': 1, '5': 3, '10': 'notifyID'},
    const {'1': 'frontID', '3': 5, '4': 1, '5': 3, '10': 'frontID'},
    const {'1': 'message', '3': 6, '4': 1, '5': 11, '6': '.api.Message', '10': 'message'},
    const {'1': 'roomID', '3': 7, '4': 1, '5': 3, '10': 'roomID'},
    const {'1': 'store', '3': 8, '4': 1, '5': 8, '10': 'store'},
    const {'1': 'broadcast', '3': 9, '4': 1, '5': 8, '10': 'broadcast'},
  ],
};

const CNotifyReply$json = const {
  '1': 'CNotifyReply',
};

const LogicServiceBase$json = const {
  '1': 'Logic',
  '2': const [
    const {'1': 'Handle', '2': '.api.LogicArg', '3': '.api.LogicResponse', '4': const {}},
    const {'1': 'NewConnection', '2': '.api.NewConnArg', '3': '.api.NewConnResponse', '4': const {}},
    const {'1': 'Disconnect', '2': '.api.DisconnectArg', '3': '.api.DisconnectResponse', '4': const {}},
    const {'1': 'CNotify', '2': '.api.CNotifyArg', '3': '.api.CNotifyReply', '4': const {}},
    const {'1': 'DNotify', '2': '.api.CNotifyArg', '3': '.api.CNotifyReply', '4': const {}},
  ],
};

const LogicServiceBase$messageJson = const {
  '.api.LogicArg': LogicArg$json,
  '.api.Proto': $3.Proto$json,
  '.api.LogicResponse': LogicResponse$json,
  '.api.Response': $3.Response$json,
  '.api.NewConnArg': NewConnArg$json,
  '.api.NewConnResponse': NewConnResponse$json,
  '.api.DisconnectArg': DisconnectArg$json,
  '.api.DisconnectResponse': DisconnectResponse$json,
  '.api.CNotifyArg': CNotifyArg$json,
  '.api.Message': $2.Message$json,
  '.api.MessageBody': $2.MessageBody$json,
  '.api.MessageUser': $2.MessageUser$json,
  '.api.User': $1.User$json,
  '.api.CNotifyReply': CNotifyReply$json,
};

