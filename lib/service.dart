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

  @override
  Future<Exam> getExam(ServiceCall call, Student request) async {
    final exam = Exam()..id = 1;
    exam.questions.addAll(questionsDb);
    return exam;
  }

  @override
  Future<Evaluation> takeExam(ServiceCall call, Stream<Answer> asnswers) async {
    var score = 0;

    await for (var answer in asnswers) {
      final isCorrect = getCorrectAnswerById(answer.question.id) == answer.text;

      print('Received an answer from ${answer.student.name}\n'
          'for a question: ${answer.question.text}'
          'answer: ${answer.text} is correct: $isCorrect');

      if (isCorrect) {
        score++;
      }
    }

    print('The student: ${call.clientMetadata?['student_name']}'
        ' finished exam with the score: $score');

    return Evaluation()
      ..id = 1
      ..mark = score;
  }

  InterviewMessage _createMessage(String text, {String name = 'Interviewer'}) =>
      InterviewMessage()
        ..name = name
        ..body = text;

  @override
  Stream<InterviewMessage> techInterview(
      ServiceCall call, Stream<InterviewMessage> interviewStream) async* {
    var count = 0;

    await for (var message in interviewStream) {
      print('Candidate ${message.name} message: ${message.body}');
      if (count >= interviewQuestions.length) {
        return;
      } else {
        yield _createMessage(interviewQuestions[count++]);
      }
    }
  }
}

const interviewQuestions = [
  'What was wrong in your previous job place?',
  'Why do you want to work for Us?',
  'Who do you see yourself in 5 years?',
  'We will inform you about the decision. Bye!',
];

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
