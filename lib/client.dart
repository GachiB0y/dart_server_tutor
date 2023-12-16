import 'dart:async';
import 'dart:io';

import 'package:grpc/grpc.dart';

import 'generated/dart_server.pbgrpc.dart';

class TutorialTerminalClient {
  late final ClientChannel channel;
  late final TutorialClient stub;

  TutorialTerminalClient() {
    channel = ClientChannel(
      '127.0.0.1',
      port: 5555,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    stub = TutorialClient(channel);
  }

  Future<Question> getQuestion(Student student) async {
    final question = await stub.getQuestion(student);
    print('Received question: $question');
    return question;
  }

  Future<void> sendAnswer(Student student, Question question) async {
    final answer = Answer()
      ..question = question
      ..student = student;

    print('Enter your answer: ');

    answer.text = stdin.readLineSync()!;

    final evaluation = await stub.sendAnswer(answer);

    print('Evaluation for the answer: ${answer.text} '
        '\non the question ${question.text}:'
        '\n$evaluation');
  }

  Future<void> takeTutorial(Student student) async {
    await for (var answeredQuestion in stub.getTutorial(student)) {
      print(answeredQuestion);
    }
  }

  Future<void> techInterview(String candidateName) async {
    final candidateStream = StreamController<InterviewMessage>();
    final interviewerStream = stub.techInterview(candidateStream.stream);

    candidateStream.add(InterviewMessage()
      ..name = candidateName
      ..body = 'I am ready!');

    await for (var message in interviewerStream) {
      print('\nMessage from the ${message.name}:\n${message.body}\n');

      print('Enter your answer:');

      final answer = stdin.readLineSync();

      candidateStream.add(InterviewMessage()..body = answer!);
    }

    unawaited(candidateStream.close());
  }

  Future<void> callService(Student student) async {
    // final question = await getQuestion(student);
    // await sendAnswer(student, question);
    // await takeTutorial(student);
    // final exam = await takeExam(student);
    // print('${student.name}, your exam score is: ${exam.mark}');
    await techInterview(student.name);
    await channel.shutdown();
  }

  Future<Evaluation> takeExam(Student student) async {
    final exam = await stub.getExam(student);

    final questions = exam.questions;

    final answersStream = StreamController<Answer>();

    final evaluationFuture = stub.takeExam(answersStream.stream,
        options: CallOptions(metadata: {'student_name': '${student.name}'}));

    for (var question in questions) {
      final answer = Answer()
        ..question = question
        ..student = student;

      print('Enter the answer for the question: ${question.text}');

      answer.text = stdin.readLineSync()!;

      answersStream.add(answer);

      await Future.delayed(Duration(milliseconds: 1));
    }
    unawaited(answersStream.close());

    return evaluationFuture;
  }
}

Future<void> main(List<String> args) async {
  final clientApp = TutorialTerminalClient();
  final student = Student()
    ..id = 42
    ..name = 'Volkov Alex';
  await clientApp.callService(student);
}
