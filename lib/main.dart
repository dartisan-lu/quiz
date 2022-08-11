import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/entities/quiz_state.dart';
import 'package:quiz/widgets/quiz_loader_scaffold.dart';

void main() {
  runApp(const ProviderContextApp());
}

class ProviderContextApp extends StatelessWidget {
  const ProviderContextApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizState(),
      child: const QuizApp(),
    );
  }
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home: const QuizLoaderScaffold(),
    );
  }
}
