import 'dart:math';

import 'package:grpc/src/server/call.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'generated/dart_server.pbgrpc.dart';
import 'questions_db_driver.dart';

class TutorialService extends TutorialServiceBase {
  @override
  Future<Question> getQuestion(ServiceCall call, Student request) async {
    print('Received question request from: $request');
    return questionsDb[Random().nextInt(questionsDb.length)];
  }

  @override
  Future<Evaluation> sendAnswer(ServiceCall call, Answer request) async {
    // TODO: implement sendAnswer
    throw UnimplementedError();
  }
}

class Server {
  Future<void> run() async {
    final server = grpc.Server.create(services: [TutorialService()]);
    await server.serve(port: 5555);
    print('Serving on the port: ${server.port}');
  }
}

Future<void> main() async {
  await Server().run();
}
