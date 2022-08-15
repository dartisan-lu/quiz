import 'package:flutter/foundation.dart';

import 'domain.dart';

class QuizState extends ChangeNotifier {
  List<Question> questions = [];
  Question? question;
  var pos = 0;
  var running = true;
  var validating = false;
  var buttonTitle = 'Submit';
  var points = 0;

  void correct(int pos, bool value) {
    question!.options[pos].correct = value;
  }

  void nextQuestion() {
    if (buttonTitle == 'End') return;

    if (buttonTitle == 'Submit') {
      validating = true;
      var error = question!.options.where((o) => !o.correct).isNotEmpty;
      points = points + (error ? 0 : 1);
      if (pos <= questions.length - 2) {
        buttonTitle = 'Next';
      } else {
        running = false;
        buttonTitle = 'End';
      }
      notifyListeners();
      return;
    }

    if (buttonTitle == 'Next') {
      pos++;
      question = questions[pos];
      question!.options.shuffle();
      validating = false;
      buttonTitle = 'Submit';
      notifyListeners();
      return;
    }
  }

  void initQuiz(List<Question> questions) {
    // Init Values
    pos = 0;
    running = true;
    validating = false;
    buttonTitle = 'Submit';
    points = 0;
    // Init Questions
    this.questions = questions;
    this.questions.shuffle();
    question = questions.first;
    question!.options.shuffle();
    notifyListeners();
  }
}

class QuizSelectorState extends ChangeNotifier {
  Quiz quizSelector = quizList.first;

  void nextQuiz(Quiz quiz) {
      quizSelector = quiz;
      notifyListeners();
      return;
    }
}
