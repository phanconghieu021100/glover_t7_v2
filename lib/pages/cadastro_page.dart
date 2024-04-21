// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:glover_t7_v2/helpers/validar_email.dart';
import 'package:glover_t7_v2/pages/components/button.dart';
import 'package:glover_t7_v2/pages/components/text_field.dart';
import 'package:glover_t7_v2/pages/login_page.dart';
import 'package:glover_t7_v2/u.dart';

class CadastroPage extends StatelessWidget {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void efetuarCadastro() {
    _formKey.currentState!.validate();
    print('h1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register!',
                style: AppFonts.quicksand(size: 25),
              ),
              const SizedBox(height: 25),
              CustomTextField(
                controller: nomeController,
                hintText: 'Name',
                obscureText: false,
                validator: (nome) {
                  if (nome!.isEmpty) {
                    return 'Enter a name';
                  }
                  return null;
                },
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
              const SizedBox(height: 25),
              CustomButton(
                color: AppColors.tColor2,
                onTap: () {
                  _formKey.currentState!.validate();
                  print('h1');
                  

                },
                textoBotao: 'Register',
              ),
              const SizedBox(height: 10),
              CustomButton(
                color: AppColors.tColor2,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                textoBotao: 'Return to login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
