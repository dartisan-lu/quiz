import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../entities/domain.dart';
import '../entities/quiz_state.dart';

class AnswerOptionWidget extends StatefulWidget {
  const AnswerOptionWidget(this.answer, this.validate, this.pos, {Key? key}) : super(key: key);
  final bool validate;
  final Answer answer;
  final int pos;

  @override
  State<AnswerOptionWidget> createState() => _AnswerOptionWidgetState();
}

class _AnswerOptionWidgetState extends State<AnswerOptionWidget> {
  bool isChecked = false;
  Color _correct = Colors.transparent;

  _changeChecked(bool? v) {
    var quizState = context.read<QuizState>();
    setState(() {
      isChecked = v!;
      quizState.correct(widget.pos, widget.answer.check == isChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.validate && _correct != Colors.transparent) {
      isChecked = false;
    }

    if (widget.validate) {
      _correct = widget.answer.check == isChecked ? Colors.green : Colors.red;
    } else {
      _correct = Colors.transparent;
    }

    return Row(children: [
      Container(
        decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(50.0)), color: _correct),
        margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
        child: Checkbox(value: isChecked, onChanged: (v) => _changeChecked(v)),
      ),
      Text(widget.answer.answer)
    ]);
  }
}
