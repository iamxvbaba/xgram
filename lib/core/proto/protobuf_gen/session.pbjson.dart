///
//  Generated code. Do not modify.
//  source: session.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Session$json = const {
  '1': 'Session',
  '2': const [
    const {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.api.Session.ListEntry', '10': 'list'},
  ],
  '3': const [Session_content$json, Session_ListEntry$json],
};

const Session_content$json = const {
  '1': 'content',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.api.User', '10': 'user'},
    const {'1': 'msg', '3': 2, '4': 1, '5': 11, '6': '.api.Message', '10': 'msg'},
    const {'1': 'badge', '3': 3, '4': 1, '5': 5, '10': 'badge'},
    const {'1': 'isOnline', '3': 5, '4': 1, '5': 8, '10': 'isOnline'},
  ],
};

const Session_ListEntry$json = const {
  '1': 'ListEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 3, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.api.Session.content', '10': 'value'},
  ],
  '7': const {'7': true},
};

