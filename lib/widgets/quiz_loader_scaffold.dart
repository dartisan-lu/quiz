import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'package:quiz/widgets/question_widget.dart';

import '../entities/domain.dart';
import '../entities/quiz_state.dart';

class QuizLoaderScaffold extends StatelessWidget {
  const QuizLoaderScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Question>> _loadData() async {
      var quizState = context.read<QuizState>();
      var data = await DefaultAssetBundle.of(context).loadString("assets/aws.json");
      final List<dynamic> dataObject = json.decode(data);
      var rtn = <Question>[];
      for (var q in dataObject) {
        rtn.add(Question.fromJson(q));
      }
      quizState.initQuiz(rtn);
      return rtn;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('QUIZ'),
      ),
      body: FutureBuilder<List<Question>>(
          future: _loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return const SingleChildScrollView(child:QuestionWidget());
              } else {
                return const Text('No Data');
              }
            }
            return const Text('Loading...');
          }),
    );
  }
}
