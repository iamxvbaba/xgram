///
//  Generated code. Do not modify.
//  source: account_enum.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const AuthStatus$json = const {
  '1': 'AuthStatus',
  '2': const [
    const {'1': 'success', '2': 0},
    const {'1': 'fail', '2': 1},
  ],
};

const UserType$json = const {
  '1': 'UserType',
  '2': const [
    const {'1': 'ut_none', '2': 0},
    const {'1': 'ut_common', '2': 1},
    const {'1': 'ut_helper', '2': 2},
    const {'1': 'ut_system', '2': 3},
    const {'1': 'ut_room', '2': 4},
    const {'1': 'ut_guild_anchor', '2': 101},
    const {'1': 'ut_guild_manager', '2': 201},
  ],
};

const Gender$json = const {
  '1': 'Gender',
  '2': const [
    const {'1': 'unknown', '2': 0},
    const {'1': 'male', '2': 1},
    const {'1': 'female', '2': 11},
  ],
};

const AccountStatus$json = const {
  '1': 'AccountStatus',
  '2': const [
    const {'1': 'user_ac_none', '2': 0},
    const {'1': 'user_active', '2': 1},
    const {'1': 'user_half_banned', '2': 101},
    const {'1': 'user_banned', '2': 201},
  ],
};

const RoomStatus$json = const {
  '1': 'RoomStatus',
  '2': const [
    const {'1': 'room_ac_none', '2': 0},
    const {'1': 'room_active', '2': 1},
    const {'1': 'room_banned', '2': 11},
  ],
};

const LoginType$json = const {
  '1': 'LoginType',
  '2': const [
    const {'1': 'cellphoneCode', '2': 0},
    const {'1': 'localCellphone', '2': 1},
    const {'1': 'oauthByWX', '2': 2},
    const {'1': 'oauthByQQ', '2': 3},
    const {'1': 'oauthByMW', '2': 4},
    const {'1': 'oauthByApple', '2': 5},
  ],
};

const SMSCodeType$json = const {
  '1': 'SMSCodeType',
  '2': const [
    const {'1': 'codeLoginOrRegister', '2': 0},
    const {'1': 'codeSetOrResetPwd', '2': 1},
    const {'1': 'codeCancelAccount', '2': 2},
    const {'1': 'codeChangeOrBindCellPhone', '2': 3},
  ],
};

