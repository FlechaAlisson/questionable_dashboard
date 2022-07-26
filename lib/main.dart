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
        debugShowMaterialGrid: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            floatingLabelStyle: TextStyle(color: AppColors.primary),
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
