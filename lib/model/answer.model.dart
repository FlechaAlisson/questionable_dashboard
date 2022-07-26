class AnswerModel {
  String? answer;
  double? percentage;

  AnswerModel.fromJson(Map<String, dynamic> json) {
    answer = json['answer_label'];
    percentage = json['percentage'] * 100;
  }
}
