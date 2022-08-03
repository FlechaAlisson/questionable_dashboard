import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:questionable_dashboard/controller/form.controller.dart';
import 'package:questionable_dashboard/screens/login_screen.dart';
import 'package:questionable_dashboard/theme/app_colors.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FormController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.delete),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.delete),
            ),
            floatingLabelStyle: TextStyle(color: AppColors.primary),
            errorStyle: TextStyle(color: AppColors.delete),
            focusColor: AppColors.primary,
            iconColor: AppColors.primary,
            fillColor: AppColors.primary,
          ),
        ),
        home: const LoginScreen(),
      ),
    ),
  );
}
