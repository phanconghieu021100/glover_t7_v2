import 'package:flutter/material.dart';
import 'package:glover_t7_v2/helpers/validar_email.dart';
import 'package:glover_t7_v2/pages/cadastro_page.dart';
import 'package:glover_t7_v2/pages/components/button.dart';
import 'package:glover_t7_v2/pages/components/text_field.dart';
// ignore: unused_import
import 'package:glover_t7_v2/pages/games_page.dart';
import 'package:glover_t7_v2/pages/home_page.dart';
import 'package:glover_t7_v2/u.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  bool efetuarLogin() {
    return _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : true,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to glover_t7_v2!',
                style: AppFonts.quicksand(size: 20),
              ),
              const SizedBox(height: 25),
              CustomTextField(
                controller: emailController,
                hintText: 'E-mail',
                obscureText: false,
                validator: (value) {
                  return validateEmail(value);
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: senhaController,
                hintText: 'Password',
                obscureText: true,
                validator: (senha) {
                  if (senha!.isEmpty) {
                    return 'Enter a password';
                  } else if (senha.length < 6) {
                    return 'The password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot password?',
                          style: AppFonts.quicksand(size: 15)),
                    ],
                  )),
              const SizedBox(height: 25),
              CustomButton(
                onTap: () {
                  bool resultValidation = efetuarLogin();
                  if (resultValidation) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                color: AppColors.tColor3,
              ),
              const SizedBox(height: 10),
              CustomButton(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CadastroPage()),
                  );
                },
                color: AppColors.tColor3,
                textoBotao: 'Create an account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
