//
//  Generated code. Do not modify.
//  source: dart_server.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'dart_server.pb.dart' as $0;

export 'dart_server.pb.dart';

@$pb.GrpcServiceName('Tutorial')
class TutorialClient extends $grpc.Client {
  static final _$getQuestion = $grpc.ClientMethod<$0.Student, $0.Question>(
      '/Tutorial/getQuestion',
      ($0.Student value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Question.fromBuffer(value));
  static final _$sendAnswer = $grpc.ClientMethod<$0.Answer, $0.Evaluation>(
      '/Tutorial/sendAnswer',
      ($0.Answer value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Evaluation.fromBuffer(value));

  TutorialClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Question> getQuestion($0.Student request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getQuestion, request, options: options);
  }

  $grpc.ResponseFuture<$0.Evaluation> sendAnswer($0.Answer request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendAnswer, request, options: options);
  }
}

@$pb.GrpcServiceName('Tutorial')
abstract class TutorialServiceBase extends $grpc.Service {
  $core.String get $name => 'Tutorial';

  TutorialServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Student, $0.Question>(
        'getQuestion',
        getQuestion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Student.fromBuffer(value),
        ($0.Question value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Answer, $0.Evaluation>(
        'sendAnswer',
        sendAnswer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Answer.fromBuffer(value),
        ($0.Evaluation value) => value.writeToBuffer()));
  }

  $async.Future<$0.Question> getQuestion_Pre($grpc.ServiceCall call, $async.Future<$0.Student> request) async {
    return getQuestion(call, await request);
  }

  $async.Future<$0.Evaluation> sendAnswer_Pre($grpc.ServiceCall call, $async.Future<$0.Answer> request) async {
    return sendAnswer(call, await request);
  }

  $async.Future<$0.Question> getQuestion($grpc.ServiceCall call, $0.Student request);
  $async.Future<$0.Evaluation> sendAnswer($grpc.ServiceCall call, $0.Answer request);
}
