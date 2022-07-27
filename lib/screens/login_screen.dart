import 'package:flutter/material.dart';
import 'package:questionable_dashboard/screens/dashboard_screen.dart';
import 'package:questionable_dashboard/theme/app_colors.dart';
import 'package:questionable_dashboard/widget/buttons.widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
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

                Form(
                  key: formKey,
                  child: _inputs(),
                ),

                const SizedBox(height: 20),

                PrimaryButton(
                  text: 'login',
                  height: 45,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const DashboardScreen(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _inputs() => Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Nome do estabelecimento'),
              prefixIcon: Icon(Icons.store),
            ),
            validator: _validator,
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              label: Text('Senha'),
              prefixIcon: Icon(Icons.lock),
            ),
            validator: _validator,
          ),
        ],
      );

  String? _validator(String? value) {
    if (value == null || value == '') return 'Obrigatório';
    return null;
  }
}
