///
//  Generated code. Do not modify.
//  source: front.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'front.pb.dart' as $4;
import 'front.pbjson.dart';

export 'front.pb.dart';

abstract class FrontNotifyServiceBase extends $pb.GeneratedService {
  $async.Future<$4.EmptyResponse> push($pb.ServerContext ctx, $4.NotifyArg request);
  $async.Future<$4.EmptyResponse> pushRoom($pb.ServerContext ctx, $4.NotifyArg request);
  $async.Future<$4.EmptyResponse> broadcast($pb.ServerContext ctx, $4.NotifyArg request);
  $async.Future<$4.EmptyResponse> cPush($pb.ServerContext ctx, $4.NotifyArg request);
  $async.Future<$4.EmptyResponse> dPush($pb.ServerContext ctx, $4.NotifyArg request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Push': return $4.NotifyArg();
      case 'PushRoom': return $4.NotifyArg();
      case 'Broadcast': return $4.NotifyArg();
      case 'CPush': return $4.NotifyArg();
      case 'DPush': return $4.NotifyArg();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Push': return this.push(ctx, request);
      case 'PushRoom': return this.pushRoom(ctx, request);
      case 'Broadcast': return this.broadcast(ctx, request);
      case 'CPush': return this.cPush(ctx, request);
      case 'DPush': return this.dPush(ctx, request);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => FrontNotifyServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => FrontNotifyServiceBase$messageJson;
}

