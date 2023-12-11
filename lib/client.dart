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

  Future<void> callService(Student student) async {
    await getQuestion(student);
    await channel.shutdown();
  }
}

Future<void> main(List<String> args) async {
  final clientApp = TutorialTerminalClient();
  final student = Student()
    ..id = 42
    ..name = 'Volkov Alex';
  await clientApp.callService(student);
}
