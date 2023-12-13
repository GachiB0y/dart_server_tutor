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
    print('Received answer for the question: $request');

    final correctAnswer = getCorrectAnswerById(request.question.id);
    if (correctAnswer == null) {
      throw grpc.GrpcError.invalidArgument('Invalid question id!');
    }

    final evaluation = Evaluation()
      ..id = 1
      ..answerId = request.id;

    if (correctAnswer == request.text) {
      evaluation.mark = 5;
    } else {
      evaluation.mark = 2;
    }
    return evaluation;
  }

  @override
  Stream<AnsweredQuestion> getTutorial(
      ServiceCall call, Student request) async* {
    for (var question in questionsDb) {
      final answeredQuestion = AnsweredQuestion()
        ..question = question
        ..answer = getCorrectAnswerById(question.id)!;

      yield answeredQuestion;

      await Future.delayed(Duration(seconds: 2));
    }
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
