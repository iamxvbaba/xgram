///
//  Generated code. Do not modify.
//  source: front.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'abridged.pbjson.dart' as $2;

const EmptyArg$json = const {
  '1': 'EmptyArg',
};

const EmptyResponse$json = const {
  '1': 'EmptyResponse',
};

const RoomUserPushInfo$json = const {
  '1': 'RoomUserPushInfo',
  '2': const [
    const {'1': 'frontID', '3': 1, '4': 1, '5': 3, '10': 'frontID'},
    const {'1': 'authKey', '3': 2, '4': 3, '5': 4, '10': 'authKey'},
  ],
};

const NotifyArg$json = const {
  '1': 'NotifyArg',
  '2': const [
    const {'1': 'p', '3': 1, '4': 1, '5': 11, '6': '.api.Proto', '10': 'p'},
    const {'1': 'authKey', '3': 2, '4': 1, '5': 4, '10': 'authKey'},
    const {'1': 'roomID', '3': 3, '4': 1, '5': 3, '10': 'roomID'},
    const {'1': 'pushType', '3': 4, '4': 1, '5': 14, '6': '.api.NotifyArg.PushType', '10': 'pushType'},
    const {'1': 'frontID', '3': 5, '4': 1, '5': 3, '10': 'frontID'},
    const {'1': 'ntyID', '3': 6, '4': 1, '5': 3, '10': 'ntyID'},
    const {'1': 'data', '3': 7, '4': 1, '5': 12, '10': 'data'},
    const {'1': 'roomPush', '3': 8, '4': 3, '5': 11, '6': '.api.RoomUserPushInfo', '10': 'roomPush'},
  ],
  '4': const [NotifyArg_PushType$json],
};

const NotifyArg_PushType$json = const {
  '1': 'PushType',
  '2': const [
    const {'1': 'SingleChannel', '2': 0},
    const {'1': 'RoomChannel', '2': 1},
    const {'1': 'Broadcast', '2': 2},
    const {'1': 'CSysNty', '2': 3},
    const {'1': 'DSysNty', '2': 4},
  ],
};

const FrontNotifyServiceBase$json = const {
  '1': 'FrontNotify',
  '2': const [
    const {'1': 'Push', '2': '.api.NotifyArg', '3': '.api.EmptyResponse', '4': const {}},
    const {'1': 'PushRoom', '2': '.api.NotifyArg', '3': '.api.EmptyResponse', '4': const {}},
    const {'1': 'Broadcast', '2': '.api.NotifyArg', '3': '.api.EmptyResponse', '4': const {}},
    const {'1': 'CPush', '2': '.api.NotifyArg', '3': '.api.EmptyResponse', '4': const {}},
    const {'1': 'DPush', '2': '.api.NotifyArg', '3': '.api.EmptyResponse', '4': const {}},
  ],
};

const FrontNotifyServiceBase$messageJson = const {
  '.api.NotifyArg': NotifyArg$json,
  '.api.Proto': $2.Proto$json,
  '.api.RoomUserPushInfo': RoomUserPushInfo$json,
  '.api.EmptyResponse': EmptyResponse$json,
};

