import 'package:flutter/material.dart';
import 'package:questionable_dashboard/screens/dashboard_screen.dart';
import 'package:questionable_dashboard/theme/app_colors.dart';
import 'package:questionable_dashboard/widget/buttons.widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .25,
              height: MediaQuery.of(context).size.width * .25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///
                  const Text(
                    'Questionable',
                    style: TextStyle(
                      fontSize: 45,
                      color: AppColors.heading,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Dashboard',
                    style: TextStyle(
                      color: AppColors.heading,
                      fontSize: 22,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const TextField(
                    decoration: InputDecoration(
                      label: Text('Nome do estabelecimento'),
                      prefixIcon: Icon(Icons.store),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text('Senha'),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),

                  const SizedBox(height: 20),

                  PrimaryButton(
                    text: 'login',
                    height: 45,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const DashboardScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
