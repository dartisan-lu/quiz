import 'package:flutter/material.dart';
import 'package:quiz/entities/domain.dart';
import 'package:quiz/entities/quiz_state.dart';
import 'package:provider/provider.dart';

class QuizSelector extends StatefulWidget {
  const QuizSelector({Key? key}) : super(key: key);

  @override
  State<QuizSelector> createState() => _QuizSelectorState();
}

class _QuizSelectorState extends State<QuizSelector> {
  Quiz dropdownValue = quizList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Quiz>(
      value: dropdownValue,
      items: quizList
          .map<DropdownMenuItem<Quiz>>((Quiz value) {
        return DropdownMenuItem<Quiz>(
          value: value,
          child: Text(
            value.description,
            style: const TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
      onChanged: (Quiz? newValue) {
        var quizState = context.read<QuizSelectorState>();
        setState(() {
          dropdownValue = newValue!;
          quizState.nextQuiz(dropdownValue);
        });
      },
    );
  }
}
