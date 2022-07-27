import 'package:questionable_dashboard/model/answer.model.dart';

class QuestionModel {
  String? inquiry;
  List<AnswerModel> listAnswer = [];

  QuestionModel.fromJson(Map<String, dynamic> json) {
    inquiry = json['inquiry'];

    for (var element in json['answers']) {
      listAnswer.add(AnswerModel.fromJson(element));
    }
  }
}
