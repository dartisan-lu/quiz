import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/entities/quiz_state.dart';
import 'package:quiz/widgets/answer_list_widget.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void submit() {
      var quizState = context.read<QuizState>();
      quizState.nextQuestion();
    }

    return Consumer<QuizState>(builder: (context, quizState, child) {
      if (quizState.question == null || quizState.question!.options.isEmpty) return const SizedBox();
      return Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text(quizState.question!.question,style: const TextStyle(fontSize: 24),softWrap: true,)),
            const AnswerListWidget(),
            ElevatedButton(
              onPressed: quizState.running ? submit : null,
              child: Text(quizState.buttonTitle),
            ),
            Text(
                'Points: ${quizState.points} / ${quizState.questions.length} (${(quizState.points / quizState.questions.length * 100).ceil()}%)')
          ],
        ),
      );
    });
  }
}
