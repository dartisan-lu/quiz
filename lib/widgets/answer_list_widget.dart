import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/entities/quiz_state.dart';
import 'package:quiz/widgets/answer_option_widget.dart';

class AnswerListWidget extends StatelessWidget {
  const AnswerListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Consumer<QuizState>(builder: (context, quizState, child) {
      if (quizState.question == null || quizState.question!.options.isEmpty) return const SizedBox();
      return Column(children: [
        ListView.builder(
            itemCount: quizState.question!.options.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: AnswerOptionWidget(quizState.question!.options[index], quizState.validating, index),
              );
            })
      ]);
    }));
  }
}
