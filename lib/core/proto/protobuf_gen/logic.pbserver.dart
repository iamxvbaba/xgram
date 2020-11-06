///
//  Generated code. Do not modify.
//  source: logic.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'logic.pb.dart' as $5;
import 'logic.pbjson.dart';

export 'logic.pb.dart';

abstract class LogicServiceBase extends $pb.GeneratedService {
  $async.Future<$5.LogicResponse> handle($pb.ServerContext ctx, $5.LogicArg request);
  $async.Future<$5.NewConnResponse> newConnection($pb.ServerContext ctx, $5.NewConnArg request);
  $async.Future<$5.DisconnectResponse> disconnect($pb.ServerContext ctx, $5.DisconnectArg request);
  $async.Future<$5.CNotifyReply> cNotify($pb.ServerContext ctx, $5.CNotifyArg request);
  $async.Future<$5.CNotifyReply> dNotify($pb.ServerContext ctx, $5.CNotifyArg request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Handle': return $5.LogicArg();
      case 'NewConnection': return $5.NewConnArg();
      case 'Disconnect': return $5.DisconnectArg();
      case 'CNotify': return $5.CNotifyArg();
      case 'DNotify': return $5.CNotifyArg();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Handle': return this.handle(ctx, request);
      case 'NewConnection': return this.newConnection(ctx, request);
      case 'Disconnect': return this.disconnect(ctx, request);
      case 'CNotify': return this.cNotify(ctx, request);
      case 'DNotify': return this.dNotify(ctx, request);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => LogicServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => LogicServiceBase$messageJson;
}

