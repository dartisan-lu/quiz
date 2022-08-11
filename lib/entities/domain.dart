class Answer {
  late String answer;
  late bool check;
  late bool correct;

  Answer(this.answer, this.check);

  Answer.fromJson(dynamic data) {
    answer = data['answer'];
    check = data['check'];
    correct = !check;
  }
}

class Question {
  late int id;
  late String question;
  late List<Answer> options;

  Question(this.id, this.question, this.options);

  Question.fromJson(dynamic data) {
    id = data['id'];
    question = data['question'];
    options = <Answer>[];
    for (var a in data['options']) {
      options.add(Answer.fromJson(a));
    }
  }
}
