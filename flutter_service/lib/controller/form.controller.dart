import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:questionable_dashboard/model/form.model.dart';
import 'package:questionable_dashboard/repository/form.repository.dart';

class FormController extends ChangeNotifier {
  List<FormModel> forms = [];
  final FormRepository _repository = FormRepository();

  Future<void> loadForm() async {
    Response? response = await _repository.loadForm();

    for (dynamic element in response?.data['reports']) {
      forms.add(FormModel.fromJson(element));
    }

    notifyListeners();
  }
}
