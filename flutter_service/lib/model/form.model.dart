import 'package:questionable_dashboard/model/question.model.dart';

class FormModel {
  List<QuestionModel> listQuestion = [];

  FormModel.fromJson(Map<String, dynamic> json) {
    for (var element in json['questions']) {
      listQuestion.add(QuestionModel.fromJson(element));
    }
  }
}
