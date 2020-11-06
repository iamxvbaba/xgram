///
//  Generated code. Do not modify.
//  source: auth_key.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ReqPQ$json = const {
  '1': 'ReqPQ',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 12, '10': 'nonce'},
  ],
};

const ResPQ$json = const {
  '1': 'ResPQ',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 12, '10': 'nonce'},
    const {'1': 'ServerNonce', '3': 2, '4': 1, '5': 12, '10': 'ServerNonce'},
    const {'1': 'PQ', '3': 3, '4': 1, '5': 12, '10': 'PQ'},
    const {'1': 'ServerPublicKeyFingerprint', '3': 4, '4': 1, '5': 3, '10': 'ServerPublicKeyFingerprint'},
  ],
};

const ReqDHParams$json = const {
  '1': 'ReqDHParams',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 12, '10': 'nonce'},
    const {'1': 'ServerNonce', '3': 2, '4': 1, '5': 12, '10': 'ServerNonce'},
    const {'1': 'P', '3': 3, '4': 1, '5': 12, '10': 'P'},
    const {'1': 'Q', '3': 4, '4': 1, '5': 12, '10': 'Q'},
    const {'1': 'PublicKeyFingerprint', '3': 5, '4': 1, '5': 3, '10': 'PublicKeyFingerprint'},
    const {'1': 'EncryptedData', '3': 6, '4': 1, '5': 12, '10': 'EncryptedData'},
  ],
};

const PQInnerData$json = const {
  '1': 'PQInnerData',
  '2': const [
    const {'1': 'PQ', '3': 1, '4': 1, '5': 12, '10': 'PQ'},
    const {'1': 'P', '3': 2, '4': 1, '5': 12, '10': 'P'},
    const {'1': 'Q', '3': 3, '4': 1, '5': 12, '10': 'Q'},
    const {'1': 'nonce', '3': 4, '4': 1, '5': 12, '10': 'nonce'},
    const {'1': 'serverNonce', '3': 5, '4': 1, '5': 12, '10': 'serverNonce'},
    const {'1': 'newNonce', '3': 6, '4': 1, '5': 12, '10': 'newNonce'},
    const {'1': 'dc', '3': 7, '4': 1, '5': 13, '10': 'dc'},
  ],
};

const ResDHParamsOK$json = const {
  '1': 'ResDHParamsOK',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 12, '10': 'nonce'},
    const {'1': 'ServerNonce', '3': 2, '4': 1, '5': 12, '10': 'ServerNonce'},
    const {'1': 'EncryptedAnswer', '3': 3, '4': 1, '5': 12, '10': 'EncryptedAnswer'},
  ],
};

const ServerDHInnerData$json = const {
  '1': 'ServerDHInnerData',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 12, '10': 'nonce'},
    const {'1': 'ServerNonce', '3': 2, '4': 1, '5': 12, '10': 'ServerNonce'},
    const {'1': 'G', '3': 3, '4': 1, '5': 5, '10': 'G'},
    const {'1': 'DhPrime', '3': 4, '4': 1, '5': 9, '10': 'DhPrime'},
    const {'1': 'GA', '3': 5, '4': 1, '5': 9, '10': 'GA'},
    const {'1': 'ServerTime', '3': 6, '4': 1, '5': 5, '10': 'ServerTime'},
  ],
};

const ClientDHParams$json = const {
  '1': 'ClientDHParams',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 12, '10': 'nonce'},
    const {'1': 'ServerNonce', '3': 2, '4': 1, '5': 12, '10': 'ServerNonce'},
    const {'1': 'EncryptedData', '3': 4, '4': 1, '5': 12, '10': 'EncryptedData'},
  ],
};

const ClientDHInnerData$json = const {
  '1': 'ClientDHInnerData',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 12, '10': 'nonce'},
    const {'1': 'ServerNonce', '3': 2, '4': 1, '5': 12, '10': 'ServerNonce'},
    const {'1': 'RetryID', '3': 3, '4': 1, '5': 3, '10': 'RetryID'},
    const {'1': 'GB', '3': 4, '4': 1, '5': 12, '10': 'GB'},
  ],
};

const DH_GEN$json = const {
  '1': 'DH_GEN',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    const {'1': 'nonce', '3': 2, '4': 1, '5': 12, '10': 'nonce'},
    const {'1': 'ServerNonce', '3': 3, '4': 1, '5': 12, '10': 'ServerNonce'},
    const {'1': 'NewNonceHash1', '3': 4, '4': 1, '5': 12, '10': 'NewNonceHash1'},
  ],
};

